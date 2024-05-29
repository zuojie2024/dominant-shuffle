if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/Aug" ]; then
    mkdir ./logs/Aug
fi

# aug: dom_shuffle
# rate: k

aug=dom_shuffle

for rate in 2.0 8.0
do


python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --use_former \
  --root_path ./dataset/ \
  --data_path ETTh1.csv \
  --model_id ETTh1_96_96 \
  --model $model_name \
  --data ETTh1 \
  --features M \
  --seq_len $seq_len \
  --label_len 48 \
  --pred_len 96 \
  --e_layers 2 \
  --d_layers 1 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --d_model 256 \
  --d_ff 256 \
  --dropout 0.5 \
  --batch_size 256 \
  --learning_rate 0.001 \
  --patience 5 \
  --itr 1 \
  --train_epochs 10  --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/$model_name'_ETTh1_'96'_'$aug'_d5_'$rate.log



python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --use_former \
  --root_path ./dataset/ \
  --data_path ETTh1.csv \
  --model_id ETTh1_96_192 \
  --model $model_name \
  --data ETTh1 \
  --features M \
  --seq_len $seq_len \
  --label_len 48 \
  --pred_len 192 \
  --e_layers 2 \
  --d_layers 1 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --d_model 256 \
  --d_ff 256 \
  --dropout 0.5 \
  --batch_size 256 \
  --learning_rate 0.001 \
  --patience 5 \
  --itr 1 \
  --train_epochs 10 --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/$model_name'_ETTh1_'192'_'$aug'_d5_'$rate.log

python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --use_former \
  --root_path ./dataset/ \
  --data_path ETTh1.csv \
  --model_id ETTh1_96_336 \
  --model $model_name \
  --data ETTh1 \
  --features M \
  --seq_len $seq_len \
  --label_len 48 \
  --pred_len 336 \
  --e_layers 2 \
  --d_layers 1 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --d_model 256 \
  --d_ff 256 \
  --dropout 0.3 \
  --batch_size 256 \
  --learning_rate 0.0001 \
  --patience 5 \
  --itr 1 \
  --train_epochs 10 --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/$model_name'_ETTh1_'336'_'$aug'_d5_'$rate.log




python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --use_former \
  --root_path ./dataset/ \
  --data_path ETTh1.csv \
  --model_id ETTh1_96_720 \
  --model $model_name \
  --data ETTh1 \
  --features M \
  --seq_len $seq_len \
  --label_len 48 \
  --pred_len 720 \
  --e_layers 2 \
  --d_layers 1 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --d_model 256 \
  --d_ff 256 \
  --dropout 0.3 \
  --batch_size 256 \
  --learning_rate 0.0001 \
  --patience 5 \
  --itr 1 \
  --train_epochs 10 --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/$model_name'_ETTh1_'720'_'$aug'_d5_'$rate.log


python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --use_former \
  --root_path ./dataset/ \
  --data_path ETTh2.csv \
  --model_id ETTh2_96_96 \
  --model $model_name \
  --data ETTh2 \
  --features M \
  --seq_len $seq_len \
  --label_len 48 \
  --pred_len 96 \
  --e_layers 2 \
  --d_layers 2 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --d_model 256 \
  --d_ff 256 \
  --dropout 0.2 \
  --batch_size 256 \
  --learning_rate 0.000224 \
  --patience 5 \
  --itr 1 \
  --train_epochs 10  --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/$model_name'_ETTh2_'96'_'$aug'_d5_'$rate.log



python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --use_former \
  --root_path ./dataset/ \
  --data_path ETTh2.csv \
  --model_id ETTh2_96_192 \
  --model $model_name \
  --data ETTh2 \
  --features M \
  --seq_len $seq_len \
  --label_len 48 \
  --pred_len 192 \
  --e_layers 2 \
  --d_layers 2 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --d_model 256 \
  --d_ff 256 \
  --dropout 0.2 \
  --batch_size 256 \
  --learning_rate 0.000224 \
  --patience 5 \
  --itr 1 \
  --train_epochs 10 --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/$model_name'_ETTh2_'192'_'$aug'_d5_'$rate.log

 


python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --use_former \
  --root_path ./dataset/ \
  --data_path ETTh2.csv \
  --model_id ETTh2_96_336 \
  --model $model_name \
  --data ETTh2 \
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
  --dropout 0.2 \
  --batch_size 256 \
  --learning_rate 0.000224 \
  --patience 5 \
  --itr 1 \
  --train_epochs 10 --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/$model_name'_ETTh2_'336'_'$aug'_d5_'$rate.log




python -u run_longExp.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --use_former \
  --root_path ./dataset/ \
  --data_path ETTh2.csv \
  --model_id ETTh2_96_720 \
  --model $model_name \
  --data ETTh2 \
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
  --dropout 0.2 \
  --batch_size 256 \
  --learning_rate 0.000224 \
  --patience 5 \
  --itr 1 \
  --train_epochs 10 --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/$model_name'_ETTh2_'720'_'$aug'_d5_'$rate.log

done