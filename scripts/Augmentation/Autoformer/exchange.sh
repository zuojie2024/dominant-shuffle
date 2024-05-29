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

for rate in 5.0 6.0 7.0
do
for model_name in Autoformer
do 
for pred_len in 96 192 336 720
do 


  
  python -u run_longExp.py \
    --is_training 1 \
    --use_former \
    --root_path ./dataset/ \
    --data_path exchange_rate.csv \
    --model_id exchange_96_$pred_len \
    --model $model_name \
    --data custom \
    --features M \
    --seq_len 96 \
    --label_len 48 \
    --pred_len $pred_len \
    --e_layers 2 \
    --d_layers 1 \
    --factor 3 \
    --enc_in 8 \
    --dec_in 8 \
    --c_out 8 \
    --des 'Exp' \
    --itr 1 \
    --batch_size 16  --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/$model_name'_exchange_rate_'$pred_len'_'$aug'_d5_'$rate.log



done
done
done