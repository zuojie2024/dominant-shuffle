import torch
import torch.nn as nn
import torch.nn.functional as F


class IEBlock(nn.Module):
    def __init__(self, input_dim, hid_dim, output_dim, num_node):
        super(IEBlock, self).__init__()

        self.input_dim = input_dim
        self.hid_dim = hid_dim
        self.output_dim = output_dim
        self.num_node = num_node

        self._build()

    def _build(self):
        self.spatial_proj = nn.Sequential(
            nn.Linear(self.input_dim, self.hid_dim),
            nn.LeakyReLU(),
            nn.Linear(self.hid_dim, self.hid_dim // 4)
        )

        self.channel_proj = nn.Linear(self.num_node, self.num_node)
        torch.nn.init.eye_(self.channel_proj.weight)

        self.output_proj = nn.Linear(self.hid_dim // 4, self.output_dim)


    def forward(self, x):
        x = self.spatial_proj(x.permute(0, 2, 1))
        x = x.permute(0, 2, 1) + self.channel_proj(x.permute(0, 2, 1))
        x = self.output_proj(x.permute(0, 2, 1))

        x = x.permute(0, 2, 1)

        return x


class Model(nn.Module):
    def __init__(self, config):
        super(Model, self).__init__()
        self.lookback = config.seq_len
        self.lookahead = config.pred_len
        self.chunk_size = config.chunk_size
        assert(self.lookback % self.chunk_size == 0)
        self.num_chunks = self.lookback // self.chunk_size
        self.hid_dim = config.d_model
        self.num_node = config.enc_in
        self.dropout = config.dropout
        self._build()

    def _build(self):
        self.layer_1 = IEBlock(
            input_dim=self.chunk_size,
            hid_dim=self.hid_dim // 4,
            output_dim=self.hid_dim // 4,
            num_node=self.num_chunks
        )

        self.chunk_proj_1 = nn.Linear(self.num_chunks, 1)

        self.layer_2 = IEBlock(
            input_dim=self.chunk_size,
            hid_dim=self.hid_dim // 4,
            output_dim=self.hid_dim // 4,
            num_node=self.num_chunks
        )

        self.chunk_proj_2 = nn.Linear(self.num_chunks, 1)

        self.layer_3 = IEBlock(
            input_dim=self.hid_dim // 2,
            hid_dim=self.hid_dim // 2,
            output_dim=self.lookahead,
            num_node=self.num_node
        )

        # self.ar = nn.Sequential(
        #     nn.Linear(self.lookback, self.hid_dim //4),
        #     nn.LeakyReLU(),
        #     nn.Linear(self.hid_dim // 4, self.lookahead)
        # )
        self.ar = nn.Linear(self.lookback, self.lookahead)

    def forward(self, x):
        B, T, N = x.size()

        highway = self.ar(x.permute(0, 2, 1))
        highway = highway.permute(0, 2, 1)

        # continuous sampling
        x1 = x.reshape(B, self.num_chunks, self.chunk_size, N)
        x1 = x1.permute(0, 3, 2, 1)
        x1 = x1.reshape(-1, self.chunk_size, self.num_chunks)
        x1 = self.layer_1(x1)
        x1 = self.chunk_proj_1(x1).squeeze(dim=-1)
        
        # interval sampling
        x2 = x.reshape(B, self.chunk_size, self.num_chunks, N)
        x2 = x2.permute(0, 3, 1, 2)
        x2 = x2.reshape(-1, self.chunk_size, self.num_chunks)
        x2 = self.layer_2(x2)
        x2 = self.chunk_proj_2(x2).squeeze(dim=-1)

        x3 = torch.cat([x1, x2], dim=-1)

        x3 = x3.reshape(B, N, -1)
        x3 = x3.permute(0, 2, 1)

        out = self.layer_3(x3)

        out = out + highway
        return out
