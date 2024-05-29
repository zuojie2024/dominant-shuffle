export CUDA_VISIBLE_DEVICES=7
if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/Aug" ]; then
    mkdir ./logs/Aug
fi

# aug: dom_shuffle
# rate: k

aug=dom_shuffle
model_name=iTransformer


for rate in 6.0 8.0
do

python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path traffic.csv \
  --model_id traffic_96_720 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 96 \
  --e_layers 4 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 862 \
  --dec_in 862 \
  --c_out 862 \
  --des 'Exp' \
  --d_model 512 \
  --d_ff 512 \
  --batch_size 8 \
  --learning_rate 0.001 \
  --itr 1 --train_epochs 6 --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/$model_name'_traffic_'96'_'$aug'_d5_'$rate.log


python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path traffic.csv \
  --model_id traffic_96_720 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 192 \
  --e_layers 4 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 862 \
  --dec_in 862 \
  --c_out 862 \
  --des 'Exp' \
  --d_model 512 \
  --d_ff 512 \
  --batch_size 8 \
  --learning_rate 0.001 \
  --itr 1 --train_epochs 6 --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/$model_name'_traffic_'192'_'$aug'_d5_'$rate.log

python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path traffic.csv \
  --model_id traffic_96_720 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 336 \
  --e_layers 4 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 862 \
  --dec_in 862 \
  --c_out 862 \
  --des 'Exp' \
  --d_model 512 \
  --d_ff 512 \
  --batch_size 8 \
  --learning_rate 0.001 \
  --itr 1 --train_epochs 6 --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/$model_name'_traffic_'336'_'$aug'_d5_'$rate.log


python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path traffic.csv \
  --model_id traffic_96_720 \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 720 \
  --e_layers 4 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 862 \
  --dec_in 862 \
  --c_out 862 \
  --des 'Exp' \
  --d_model 512 \
  --d_ff 512 \
  --batch_size 8 \
  --learning_rate 0.001 \
  --itr 1 --train_epochs 6 --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/$model_name'_traffic_'720'_'$aug'_d5_'$rate.log


done