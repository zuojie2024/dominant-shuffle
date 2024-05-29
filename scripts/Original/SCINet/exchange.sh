if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/original" ]; then
    mkdir ./logs/original
fi

model_name=SCINet



python -u run_longExp.py \
  --is_training 1 \
  --task_name long_term_forecast \
  --root_path ./dataset/ \
  --data_path exchange_rate.csv \
  --model_id Exchange_96_96 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --pred_len 96 \
  --e_layers 2 \
  --enc_in 8 \
  --dec_in 8 \
  --c_out 8 \
  --hidden_size 0.125 \
  --stacks 1 \
  --levels 3 \
  --dropout 0 \
  --des 'Exp' \
  --d_model 128 \
  --d_ff 128 \
  --itr 1 --train_epochs 6 >logs/original/$model_name'_exchange_rate_'96.log

python -u run_longExp.py \
  --is_training 1 \
  --root_path ./dataset/ \
  --task_name long_term_forecast \
  --data_path exchange_rate.csv \
  --model_id Exchange_96_192 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --pred_len 192 \
  --e_layers 2 \
  --enc_in 8 \
  --dec_in 8 \
  --c_out 8 \
  --hidden_size 0.125 \
  --stacks 1 \
  --levels 3 \
  --dropout 0 \
  --des 'Exp' \
  --d_model 128 \
  --d_ff 128 \
  --itr 1 --train_epochs 6 >logs/original/$model_name'_exchange_rate_'192.log

python -u run_longExp.py \
  --is_training 1 \
  --root_path ./dataset/ \
  --task_name long_term_forecast \
  --data_path exchange_rate.csv \
  --model_id Exchange_96_336 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --pred_len 336 \
  --e_layers 2 \
  --enc_in 8 \
  --dec_in 8 \
  --c_out 8 \
  --des 'Exp' \
  --hidden_size 0.125 \
  --stacks 1 \
  --levels 3 \
  --dropout 0 \
  --itr 1 \
  --d_model 128 \
  --d_ff 128 \
  --train_epochs 6 >logs/original/$model_name'_exchange_rate_'336.log

python -u run_longExp.py \
  --is_training 1 \
  --task_name long_term_forecast \
  --root_path ./dataset/ \
  --data_path exchange_rate.csv \
  --model_id Exchange_96_720 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --pred_len 720 \
  --e_layers 2 \
  --enc_in 8 \
  --dec_in 8 \
  --c_out 8 \
  --hidden_size 0.125 \
  --stacks 1 \
  --levels 3 \
  --dropout 0 \
  --des 'Exp' \
  --d_model 128 \
  --d_ff 128 \
  --itr 1  --train_epochs 6 >logs/original/$model_name'_exchange_rate_'720.log