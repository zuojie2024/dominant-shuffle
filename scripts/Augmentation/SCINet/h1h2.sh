export CUDA_VISIBLE_DEVICES=7

if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/FrAug" ]; then
    mkdir ./logs/FrAug
fi


aug=dom_shuffle
model_name=SCINet

for rate in 8.0
do

python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path ETTh1.csv \
  --model_id ETTh1_96_96 \
  --model $model_name \
  --data ETTh1 \
  --features M \
  --seq_len 192 \
  --label_len 48 \
  --pred_len 96 \
  --e_layers 2 \
  --d_layers 1 \
  --hidden_size 4\
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --itr 1 \
  --dropout 0.5 \
  --train_epochs 8  --batch_size 16  --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/FrAug/$model_name'_ETTh1_'96'_'$aug'_d5_'$rate.log



python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path ETTh1.csv \
  --model_id ETTh1_96_192 \
  --model $model_name \
  --data ETTh1 \
  --features M \
  --seq_len 336\
  --label_len 48 \
  --pred_len 192 \
  --e_layers 2 \
  --d_layers 1 \
  --hidden_size 4\
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --itr 1 \
  --dropout 0.5 \
  --train_epochs 8 --batch_size 16  --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/FrAug/$model_name'_ETTh1_'192'_'$aug'_d5_'$rate.log

python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path ETTh1.csv \
  --model_id ETTh1_96_336 \
  --model $model_name \
  --data ETTh1 \
  --features M \
  --seq_len 336 \
  --label_len 48 \
  --pred_len 336 \
  --e_layers 2 \
  --d_layers 1 \
  --hidden_size 4\
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --itr 1 \
  --dropout 0.5 \
  --train_epochs 8 --batch_size 16  --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/FrAug/$model_name'_ETTh1_'336'_'$aug'_d5_'$rate.log


python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path ETTh2.csv \
  --model_id ETTh2_96_96 \
  --model $model_name \
  --data ETTh2 \
  --features M \
  --seq_len 192 \
  --label_len 48 \
  --pred_len 96 \
  --e_layers 2 \
  --d_layers 1 \
  --hidden_size 4\
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --itr 1 \
  --dropout 0.5 \
  --train_epochs 8  --batch_size 16  --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/FrAug/$model_name'_ETTh2_'96'_'$aug'_d5_'$rate.log



python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path ETTh2.csv \
  --model_id ETTh2_96_192 \
  --model $model_name \
  --data ETTh2 \
  --features M \
  --seq_len 336\
  --label_len 48 \
  --pred_len 192 \
  --e_layers 2 \
  --d_layers 1 \
  --hidden_size 4\
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --itr 1 \
  --dropout 0.5 \
  --train_epochs 8 --batch_size 16  --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/FrAug/$model_name'_ETTh2_'192'_'$aug'_d5_'$rate.log

python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path ETTh2.csv \
  --model_id ETTh2_96_336 \
  --model $model_name \
  --data ETTh2 \
  --features M \
  --seq_len 336 \
  --label_len 48 \
  --pred_len 336 \
  --e_layers 2 \
  --d_layers 1 \
  --hidden_size 4\
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --itr 1 \
  --dropout 0.5 \
  --train_epochs 8 --batch_size 16  --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/FrAug/$model_name'_ETTh2_'336'_'$aug'_d5_'$rate.log

python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path ETTh2.csv \
  --model_id ETTh2_96_720 \
  --model $model_name \
  --data ETTh2 \
  --features M \
  --seq_len 736 \
  --label_len 48 \
  --pred_len 720 \
  --e_layers 2 \
  --d_layers 1 \
  --hidden_size 4\
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --itr 1 \
  --dropout 0.5 \
  --train_epochs 8 --batch_size 16  --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/FrAug/$model_name'_ETTh2_'720'_'$aug'_d5_'$rate.log

done

for rate in 2.0 3.0
do

python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path ETTh1.csv \
  --model_id ETTh1_96_720 \
  --model $model_name \
  --data ETTh1 \
  --features M \
  --seq_len 736 \
  --label_len 48 \
  --pred_len 720 \
  --e_layers 2 \
  --d_layers 1 \
  --hidden_size 4\
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --itr 1 \
  --dropout 0.5 \
  --train_epochs 8 --batch_size 16  --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/FrAug/$model_name'_ETTh1_'720'_'$aug'_d5_'$rate.log

done