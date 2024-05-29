if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/Aug" ]; then
    mkdir ./logs/Aug
fi


aug=dom_shuffle
model_name=SCINet

for rate in 2.0 3.0
do


python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path weather.csv \
  --model_id weather_96_96 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 96 \
  --e_layers 3 \
  --d_layers 1 \
  --hidden_size 1 \
  --stacks 2 \
  --levels 3 \
  --enc_in 21 \
  --dec_in 21 \
  --c_out 21 \
  --des 'Exp' \
  --d_model 512\
  --d_ff 512\
  --batch_size 64 \
  --itr 1 --train_epochs 8 --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/$model_name'_weather_'96'_'$aug'_d5_'$rate.log

python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path weather.csv \
  --model_id weather_96_192 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 192 \
  --e_layers 3 \
  --d_layers 1 \
  --hidden_size 1 \
  --stacks 2 \
  --levels 3 \
  --enc_in 21 \
  --dec_in 21 \
  --c_out 21 \
  --des 'Exp' \
  --d_model 512\
  --d_ff 512\
  --batch_size 64 \
  --itr 1 --train_epochs 8 --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/$model_name'_weather_'192'_'$aug'_d5_'$rate.log


python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path weather.csv \
  --model_id weather_96_336 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 336 \
  --e_layers 3 \
  --d_layers 1 \
  --hidden_size 1 \
  --stacks 2 \
  --levels 3 \
  --enc_in 21 \
  --dec_in 21 \
  --c_out 21 \
  --des 'Exp' \
  --d_model 512\
  --d_ff 512\
  --batch_size 64 \
  --itr 1 --train_epochs 8 --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/$model_name'_weather_'336'_'$aug'_d5_'$rate.log


python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path weather.csv \
  --model_id weather_96_720 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 720\
  --e_layers 3 \
  --d_layers 1 \
  --hidden_size 1 \
  --stacks 2 \
  --levels 3 \
  --enc_in 21 \
  --dec_in 21 \
  --c_out 21 \
  --des 'Exp' \
  --d_model 512\
  --d_ff 512\
  --batch_size 64 \
  --itr 1 --train_epochs 8 --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/$model_name'_weather_'720'_'$aug'_d5_'$rate.log
done