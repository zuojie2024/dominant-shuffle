
if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/original" ]; then
    mkdir ./logs/original
fi

model_name=TiDE
seq_len=720

python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --use_former \
  --root_path ./dataset/ \
  --data_path ETTm2.csv \
  --model_id ETTm2_96_96 \
  --model $model_name \
  --data ETTm2 \
  --features M \
  --seq_len $seq_len \
  --label_len 48 \
  --pred_len 96 \
  --e_layers 2 \
  --d_layers 2 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7  \
  --d_model 256 \
  --d_ff 256 \
  --dropout 0.0 \
  --batch_size 512 \
  --learning_rate 0.1 \
  --patience 5 \
  --itr 1 --train_epochs 8 >logs/original/$model_name'_ETTm2_'96.log



python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --use_former \
  --root_path ./dataset/ \
  --data_path ETTm2.csv \
  --model_id ETTm2_96_192 \
  --model $model_name \
  --data ETTm2 \
  --features M \
  --seq_len $seq_len \
  --label_len 48 \
  --pred_len 192 \
  --e_layers 2 \
  --d_layers 2 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7  \
  --d_model 256 \
  --d_ff 256 \
  --dropout 0.0 \
  --batch_size 512 \
  --learning_rate 0.1 \
  --patience 5 \
  --itr 1 --train_epochs 8 >logs/original/$model_name'_ETTm2_'192.log

 


python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --use_former \
  --root_path ./dataset/ \
  --data_path ETTm2.csv \
  --model_id ETTm2_96_336 \
  --model $model_name \
  --data ETTm2 \
  --features M \
  --seq_len $seq_len \
  --label_len 48 \
  --pred_len 336 \
  --e_layers 2 \
  --d_layers 2 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --d_model 256 \
  --d_ff 256 \
  --dropout 0.0 \
  --batch_size 512 \
  --learning_rate 0.1 \
  --patience 5 \
  --itr 1 --train_epochs 8 >logs/original/$model_name'_ETTm2_'336.log




python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --use_former \
  --root_path ./dataset/ \
  --data_path ETTm2.csv \
  --model_id ETTm2_96_720 \
  --model $model_name \
  --data ETTm2 \
  --features M \
  --seq_len $seq_len \
  --label_len 48 \
  --pred_len 720 \
  --e_layers 2 \
  --d_layers 2 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --d_model 256 \
  --d_ff 256 \
  --dropout 0.0 \
  --batch_size 512 \
  --learning_rate 0.1 \
  --patience 5 \
  --itr 1 --train_epochs 8 >logs/original/$model_name'_ETTm2_'720.log
