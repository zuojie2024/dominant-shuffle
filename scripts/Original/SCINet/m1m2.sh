if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/original" ]; then
    mkdir ./logs/original
fi

model_name=SCINet

seq_len=720

python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path ETTm1.csv \
  --model_id ETTm1_96_96 \
  --model $model_name \
  --data ETTm1 \
  --features M \
  --seq_len 384 \
  --label_len 96 \
  --pred_len 96 \
  --e_layers 2 \
  --d_layers 1 \
  --hidden_size 0.5 \
  --stacks 2 \
  --levels 4 \
  --dropout 0.5 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7  \
  --batch_size 32 \
  --des 'Exp' \
  --itr 1 --train_epochs 8 >logs/original/$model_name'_ETTm1_'96.log



python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path ETTm1.csv \
  --model_id ETTm1_96_192 \
  --model $model_name \
  --data ETTm1 \
  --features M \
  --seq_len 384 \
  --label_len 192 \
  --pred_len 192 \
  --e_layers 2 \
  --d_layers 1 \
  --hidden_size 0.5 \
  --stacks 2 \
  --levels 4 \
  --dropout 0.5 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7  \
  --batch_size 32 \
  --des 'Exp' \
  --itr 1 --train_epochs 8 >logs/original/$model_name'_ETTm1_'192.log

 


python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path ETTm1.csv \
  --model_id ETTm1_96_336 \
  --model $model_name \
  --data ETTm1\
  --features M \
  --seq_len 336 \
  --label_len 336 \
  --pred_len 336 \
  --e_layers 2 \
  --d_layers 1 \
  --hidden_size 0.5 \
  --stacks 2 \
  --levels 4 \
  --dropout 0.5 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --batch_size 32 \
  --des 'Exp' \
  --itr 1 --train_epochs 8 >logs/original/$model_name'_ETTm1_'336.log




python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path ETTm1.csv \
  --model_id ETTm1_96_720 \
  --model $model_name \
  --data ETTm1 \
  --features M \
  --seq_len 720 \
  --label_len 720 \
  --pred_len 720 \
  --e_layers 2 \
  --d_layers 1 \
  --hidden_size 0.5 \
  --stacks 2 \
  --levels 4 \
  --dropout 0.5 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --batch_size 32 \
  --des 'Exp' \
  --itr 1 --train_epochs 8 >logs/original/$model_name'_ETTm1_'720.log


python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path ETTm2.csv \
  --model_id ETTm2_96_96 \
  --model $model_name \
  --data ETTm2 \
  --features M \
  --seq_len 384 \
  --label_len 96 \
  --pred_len 96 \
  --e_layers 2 \
  --d_layers 1 \
  --hidden_size 0.5 \
  --stacks 2 \
  --levels 4 \
  --dropout 0.5 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7  \
  --batch_size 32 \
  --des 'Exp' \
  --itr 1 --train_epochs 8 >logs/original/$model_name'_ETTm2_'96.log


python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path ETTm2.csv \
  --model_id ETTm2_96_192 \
  --model $model_name \
  --data ETTm2 \
  --features M \
  --seq_len 384 \
  --label_len 192 \
  --pred_len 192 \
  --e_layers 2 \
  --d_layers 1 \
  --hidden_size 0.5 \
  --stacks 2 \
  --levels 4 \
  --dropout 0.5 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --batch_size 32 \
  --itr 1 --train_epochs 6 >logs/original/$model_name'_ETTm2_'192.log

python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path ETTm2.csv \
  --model_id ETTm2_96_336 \
  --model $model_name \
  --data ETTm1 \
  --features M \
  --seq_len 336 \
  --label_len 336 \
  --pred_len 336 \
  --e_layers 2 \
  --d_layers 1 \
  --hidden_size 0.5 \
  --stacks 2 \
  --levels 4 \
  --dropout 0.5 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --batch_size 32 \
  --itr 1 --train_epochs 6 >logs/original/$model_name'_ETTm2_'336.log

python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path ETTm2.csv \
  --model_id ETTm2_96_720 \
  --model $model_name \
  --data ETTm2 \
  --features M \
  --seq_len 720 \
  --label_len 720 \
  --pred_len 720 \
  --e_layers 2 \
  --d_layers 1 \
  --hidden_size 0.5 \
  --stacks 2 \
  --levels 4 \
  --dropout 0.5 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --batch_size 32 \
  --itr 1 --train_epochs 6 >logs/original/$model_name'_ETTm2_'720.log