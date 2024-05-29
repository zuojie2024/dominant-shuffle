export CUDA_VISIBLE_DEVICES=7
if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/FrAug" ]; then
    mkdir ./logs/FrAug
fi

# aug: dom_shuffle
# rate: k

aug=dom_shuffle

for rate in 5.0 6.0 7.0 8.0
do
for model_name in Autoformer
do 
for pred_len in 96 192 336 720
do 


  
  python -u run_longExp.py \
      --is_training 1 \
      --use_former \
      --root_path ./dataset/ \
      --data_path ETTm1.csv \
      --task_name long_term_forecast \
      --model_id ETTm1_96_$pred_len \
      --model $model_name \
      --data ETTm1 \
      --features M \
      --seq_len 96 \
      --label_len 48 \
      --pred_len $pred_len \
      --e_layers 2 \
      --d_layers 1 \
      --factor 3 \
      --enc_in 7 \
      --dec_in 7 \
      --c_out 7 \
      --des 'Exp' \
      --itr 1 --batch_size 16  --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/FrAug/$model_name'_ETTm1_'$pred_len'_'$aug'_d5_'$rate.log



done
done
done


for rate in 3.0 4.0 5.0 7.0
do
for model_name in Autoformer
do 
for pred_len in 96 192 336 720
do 


  

  python -u run_longExp.py \
      --is_training 1 \
      --root_path ./dataset/ \
      --data_path ETTm2.csv \
      --task_name long_term_forecast \
      --model_id ETTm2_96_$pred_len \
      --model $model_name \
      --data ETTm2 \
      --features M \
      --seq_len 96 \
      --label_len 48 \
      --pred_len $pred_len \
      --e_layers 2 \
      --d_layers 1 \
      --factor 3 \
      --enc_in 7 \
      --dec_in 7 \
      --c_out 7 \
      --des 'Exp' \
      --itr 1 --batch_size 16  --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/FrAug/$model_name'_ETTm2_'$pred_len'_'$aug'_d5_'$rate.log



done
done
done