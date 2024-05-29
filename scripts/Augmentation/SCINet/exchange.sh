if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/Aug" ]; then
    mkdir ./logs/Aug
fi


aug=dom_shuffle
model_name=SCINet

for rate in 0.1 0.5
do


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
  --itr 1 --train_epochs 8 --batch_size 16  --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/$model_name'_exchange_'96'_'$aug'_d5_'$rate.log

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
  --itr 1 --train_epochs 5 --batch_size 16  --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/$model_name'_exchange_'192'_'$aug'_d5_'$rate.log

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
  --train_epochs 3 --batch_size 16  --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/$model_name'_exchange_'336'_'$aug'_d5_'$rate.log

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
  --itr 1  --train_epochs 3 --batch_size 16  --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/$model_name'_exchange_'720'_'$aug'_d5_'$rate.log

done