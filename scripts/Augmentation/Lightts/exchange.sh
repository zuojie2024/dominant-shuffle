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
for rate in 9.0
do



python run_longExp.py --task_name long_term_forecast --data custom --enc_in 8 --data_path exchange_rate.csv --seq_len 98 --pred_len  96 --d_model 64 --chunk_size 7 --learning_rate 1e-3 --batch_size 16 --model 'LightTS' --train_epochs 200 --is_training 1 --itr 1 --model_id AUG_LightTS'_'$rate'_'$aug --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/lightTS/$aug'_'$rate'_'exchange_96.log 
python run_longExp.py --task_name long_term_forecast --data custom --enc_in 8 --data_path exchange_rate.csv --seq_len 98 --pred_len 192 --d_model 64 --chunk_size 7 --learning_rate 1e-3 --batch_size 16 --model 'LightTS' --train_epochs 200 --is_training 1 --itr 1 --model_id AUG_LightTS'_'$rate'_'$aug --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/lightTS/$aug'_'$rate'_'exchange_192.log 
python run_longExp.py --task_name long_term_forecast --data custom --enc_in 8 --data_path exchange_rate.csv --seq_len 98 --pred_len 336 --d_model 64 --chunk_size 7 --learning_rate 1e-3 --batch_size 16 --model 'LightTS' --train_epochs 1 --is_training 1 --itr 1 --model_id AUG_LightTS'_'$rate'_'$aug --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/lightTS/$aug'_'$rate'_'exchange_336.log 
python run_longExp.py --task_name long_term_forecast --data custom --enc_in 8 --data_path exchange_rate.csv --seq_len 98 --pred_len 720 --d_model 64 --chunk_size 7 --learning_rate 1e-3 --batch_size 16 --model 'LightTS' --train_epochs 100 --is_training 1 --itr 1 --model_id AUG_LightTS'_'$rate'_'$aug --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/lightTS/$aug'_'$rate'_'exchange_720.log 


done
done