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
for rate in 2.0 7.0
do


python run_longExp.py --task_name long_term_forecast --batch_size 16 --data_path ETTm1.csv --data ETTm1 --features M  --seq_len 192 --pred_len  96 --chunk_size  48 --d_model 128 --learning_rate 1e-4 --model 'LightTS'  --is_training 1 --itr 1 --train_epochs 5 --model_id AUG_LightTS'_'$rate'_'$aug --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/lightTS/$aug'_'$rate'_'ETTm1_96.log 
python run_longExp.py --task_name long_term_forecast --batch_size 16 --data_path ETTm1.csv --data ETTm1 --features M  --seq_len 720 --pred_len 192 --chunk_size  72 --d_model 128 --learning_rate 1e-4 --model 'LightTS'  --is_training 1 --itr 1 --train_epochs 5 --model_id AUG_LightTS'_'$rate'_'$aug --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/lightTS/$aug'_'$rate'_'ETTm1_192.log 
python run_longExp.py --task_name long_term_forecast --batch_size 16 --data_path ETTm1.csv --data ETTm1 --features M  --seq_len 720 --pred_len 336 --chunk_size  72 --d_model 128 --learning_rate 1e-5 --model 'LightTS'  --is_training 1 --itr 1 --train_epochs 5 --model_id AUG_LightTS'_'$rate'_'$aug --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/lightTS/$aug'_'$rate'_'ETTm1_336.log 
python run_longExp.py --task_name long_term_forecast --batch_size 16 --data_path ETTm1.csv --data ETTm1 --features M  --seq_len 720 --pred_len 720 --chunk_size  72 --d_model 128 --learning_rate 1e-5 --model 'LightTS'  --is_training 1 --itr 1 --train_epochs 5 --model_id AUG_LightTS'_'$rate'_'$aug --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/lightTS/$aug'_'$rate'_'ETTm1_720.log 

python run_longExp.py --task_name long_term_forecast --batch_size 16 --data_path ETTm2.csv --data ETTm2 --features M  --seq_len 192 --pred_len  96 --chunk_size  48 --d_model 128 --learning_rate 1e-4 --model 'LightTS'  --is_training 1 --itr 1 --train_epochs 5 --model_id AUG_LightTS'_'$rate'_'$aug --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/lightTS/$aug'_'$rate'_'ETTm2_96.log 
python run_longExp.py --task_name long_term_forecast --batch_size 16 --data_path ETTm2.csv --data ETTm2 --features M  --seq_len 720 --pred_len 192 --chunk_size  72 --d_model 128 --learning_rate 1e-4 --model 'LightTS'  --is_training 1 --itr 1 --train_epochs 5 --model_id AUG_LightTS'_'$rate'_'$aug --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/lightTS/$aug'_'$rate'_'ETTm2_192.log 
python run_longExp.py --task_name long_term_forecast --batch_size 16 --data_path ETTm2.csv --data ETTm2 --features M  --seq_len 720 --pred_len 336 --chunk_size  72 --d_model 128 --learning_rate 1e-5 --model 'LightTS'  --is_training 1 --itr 1 --train_epochs 5 --model_id AUG_LightTS'_'$rate'_'$aug --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/lightTS/$aug'_'$rate'_'ETTm2_336.log 
python run_longExp.py --task_name long_term_forecast --batch_size 16 --data_path ETTm2.csv --data ETTm2 --features M  --seq_len 720 --pred_len 720 --chunk_size  72 --d_model 128 --learning_rate 1e-5 --model 'LightTS'  --is_training 1 --itr 1 --train_epochs 5 --model_id AUG_LightTS'_'$rate'_'$aug --in_batch_augmentation --aug_method  $aug --aug_rate $rate >logs/Aug/lightTS/$aug'_'$rate'_'ETTm2_720.log 


done
done