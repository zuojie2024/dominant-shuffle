export CUDA_VISIBLE_DEVICES=7
if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/Aug" ]; then
    mkdir ./logs/Aug
fi

if [ ! -d "./logs/Aug/lightTS" ]; then
    mkdir ./logs/Aug/lightTS
fi

for aug in dom_shuffle
do
for rate in 2.0 3.0
do



python -u run_longExp.py --task_name long_term_forecast --batch_size 16 --data custom --enc_in 21 --model 'LightTS' --data_path weather.csv  --pred_len  96 --seq_len 192 --d_model 128 --learning_rate 1e-4 --chunk_size 48 --is_training 1 --itr 1 --train_epochs 5 --model_id AUG_LightTS'_'$rate'_'$aug --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/lightTS/$aug'_'$rate'_'weather_96.log 
python -u run_longExp.py --task_name long_term_forecast --batch_size 16 --data custom --enc_in 21 --model 'LightTS' --data_path weather.csv  --pred_len 192 --seq_len 720 --d_model 128 --learning_rate 1e-4 --chunk_size 72 --is_training 1 --itr 1 --train_epochs 5 --model_id AUG_LightTS'_'$rate'_'$aug --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/lightTS/$aug'_'$rate'_'weather_192.log 
python -u run_longExp.py --task_name long_term_forecast --batch_size 16 --data custom --enc_in 21 --model 'LightTS' --data_path weather.csv  --pred_len 336 --seq_len 720 --d_model 128 --learning_rate 1e-4 --chunk_size 72 --is_training 1 --itr 1 --train_epochs 5 --model_id AUG_LightTS'_'$rate'_'$aug --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/lightTS/$aug'_'$rate'_'weather_336.log 
python -u run_longExp.py --task_name long_term_forecast --batch_size 16 --data custom --enc_in 21 --model 'LightTS' --data_path weather.csv  --pred_len 720 --seq_len 720 --d_model 128 --learning_rate 1e-4 --chunk_size 72 --is_training 1 --itr 1 --train_epochs 5 --model_id AUG_LightTS'_'$rate'_'$aug --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/lightTS/$aug'_'$rate'_'weather_720.log 


done
done