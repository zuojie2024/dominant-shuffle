export CUDA_VISIBLE_DEVICES=7
if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/FrAug" ]; then
    mkdir ./logs/FrAug
fi
# aug: f_mask, f_mix
# rate: mask/mix rate
aug=dom_shuffle
model_name=iTransformer


for rate in 2.0 3.0 
do


python -u run_longExp.py \
  --is_training 1 \
  --root_path ./dataset/ \
  --task_name long_term_forecast \
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
  --des 'Exp' \
  --itr 1 \
  --d_model 128 \
  --d_ff 128 \
  --batch_size 16 \
  --train_epochs 6 --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/FrAug/$model_name'_exchange_rate_'96'_'$aug'_d5_'$rate.log

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
  --des 'Exp' \
  --itr 1 \
  --d_model 128 \
  --d_ff 128 \
  --batch_size 16 \
  --train_epochs 6 --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/FrAug/$model_name'_exchange_rate_'192'_'$aug'_d5_'$rate.log

done


for rate in 6.0 7.0 8.0
do
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
  --itr 1 \
  --d_model 128 \
  --d_ff 128 \
  --batch_size 16 \
  --train_epochs 6 --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/FrAug/$model_name'_exchange_rate_'336'_'$aug'_d5_'$rate.log





python -u run_longExp.py \
  --is_training 1 \
  --root_path ./dataset/ \
  --task_name long_term_forecast \
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
  --des 'Exp' \
  --itr 1 \
  --d_model 128 \
  --d_ff 128 \
  --batch_size 16 \
  --train_epochs 6 --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/FrAug/$model_name'_exchange_rate_'720'_'$aug'_d5_'$rate.log

do