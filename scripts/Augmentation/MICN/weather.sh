export CUDA_VISIBLE_DEVICES=7

if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/Aug" ]; then
    mkdir ./logs/Aug
fi

aug=dom_shuffle
model_name=MICN

for rate in 2.0 3.0 4.0
do


python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --use_former \
  --root_path ./dataset/ \
  --data_path weather.csv \
  --model_id weather_96_96 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 96 \
  --pred_len 96 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 21 \
  --dec_in 21 \
  --c_out 21 \
  --d_model 32 \
  --d_ff 32 \
  --top_k 5 \
  --des 'Exp' \
  --itr 1 \
  --train_epochs 10 --batch_size 16  --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/$model_name'_weather_'96'_'$aug'_d5_'$rate.log


python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --use_former \
  --root_path ./dataset/ \
  --data_path weather.csv \
  --model_id weather_96_192 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 96 \
  --pred_len 192 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 21 \
  --dec_in 21 \
  --c_out 21 \
  --d_model 32 \
  --d_ff 32 \
  --top_k 5 \
  --des 'Exp' \
  --itr 1 \
  --train_epochs 20 --batch_size 16  --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/$model_name'_weather_'192'_'$aug'_d5_'$rate.log



done

for rate in 8.0 9.0
do
python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --use_former \
  --root_path ./dataset/ \
  --data_path weather.csv \
  --model_id weather_96_336 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 96 \
  --pred_len 336 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 21 \
  --dec_in 21 \
  --c_out 21 \
  --d_model 32 \
  --d_ff 32 \
  --top_k 5 \
  --des 'Exp' \
  --itr 1 \
  --train_epochs 1 --batch_size 16  --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/$model_name'_weather_'336'_'$aug'_d5_'$rate.log

python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --use_former \
  --root_path ./dataset/ \
  --data_path weather.csv \
  --model_id weather_96_720 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 96 \
  --pred_len 720 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 21 \
  --dec_in 21 \
  --c_out 21 \
  --d_model 32 \
  --d_ff 32 \
  --top_k 5 \
  --des 'Exp' \
  --itr 1 \
  --train_epochs 1 --batch_size 16  --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/$model_name'_weather_'720'_'$aug'_d5_'$rate.log
done