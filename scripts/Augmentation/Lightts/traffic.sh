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
for rate in 2.0 3.0 4.0
do



python run_longExp.py --task_name long_term_forecast --data custom --enc_in 862 --data_path traffic.csv --seq_len 168 --pred_len  96 --d_model 256 --learning_rate 3e-5 --chunk_size 14 --batch_size 2 --model 'LightTS' --train_epochs 6 --is_training 1 --itr 1 --model_id AUG_LightTS'_'$rate'_'$aug --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/lightTS/$aug'_'$rate'_'traffic_96.log 
python run_longExp.py --task_name long_term_forecast --data custom --enc_in 862 --data_path traffic.csv --seq_len 168 --pred_len 192 --d_model 256 --learning_rate 3e-5 --chunk_size 14 --batch_size 2 --model 'LightTS' --train_epochs 6 --is_training 1 --itr 1 --model_id AUG_LightTS'_'$rate'_'$aug --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/lightTS/$aug'_'$rate'_'traffic_192.log 
python run_longExp.py --task_name long_term_forecast --data custom --enc_in 862 --data_path traffic.csv --seq_len 168 --pred_len 336 --d_model 256 --learning_rate 3e-5 --chunk_size 14 --batch_size 2 --model 'LightTS' --train_epochs 6 --is_training 1 --itr 1 --model_id AUG_LightTS'_'$rate'_'$aug --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/lightTS/$aug'_'$rate'_'traffic_336.log 
python run_longExp.py --task_name long_term_forecast --data custom --enc_in 862 --data_path traffic.csv --seq_len 168 --pred_len 720 --d_model 256 --learning_rate 3e-5 --chunk_size 14 --batch_size 2 --model 'LightTS' --train_epochs 6 --is_training 1 --itr 1 --model_id AUG_LightTS'_'$rate'_'$aug --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/lightTS/$aug'_'$rate'_'traffic_720.log 


done
done