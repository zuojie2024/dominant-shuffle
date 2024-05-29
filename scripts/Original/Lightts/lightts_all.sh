
if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/origin" ]; then
    mkdir ./logs/origin
fi

if [ ! -d "./logs/origin/lightTS" ]; then
    mkdir ./logs/origin/lightTS
fi

python run_longExp.py --task_name long_term_forecast --data_path ETTh1.csv --data ETTh1 --features S  --seq_len 192 --pred_len  96 --chunk_size  48 --d_model 128 --learning_rate 1e-4 --model 'LightTS'  --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/ETTh1_96.log 
python run_longExp.py --task_name long_term_forecast --data_path ETTh1.csv --data ETTh1 --features S  --seq_len 720 --pred_len 192 --chunk_size  72 --d_model 128 --learning_rate 1e-4 --model 'LightTS'  --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/ETTh1_192.log 
python run_longExp.py --task_name long_term_forecast --data_path ETTh1.csv --data ETTh1 --features S  --seq_len 720 --pred_len 336 --chunk_size  72 --d_model 128 --learning_rate 1e-5 --model 'LightTS'  --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/ETTh1_336.log 
python run_longExp.py --task_name long_term_forecast --data_path ETTh1.csv --data ETTh1 --features S  --seq_len 720 --pred_len 720 --chunk_size  72 --d_model 128 --learning_rate 1e-5 --model 'LightTS'  --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/ETTh1_720.log 

python run_longExp.py --data_path ETTh2.csv --data ETTh2 --features M  --seq_len 192 --pred_len  96 --chunk_size  48 --d_model 128 --learning_rate 1e-4 --model 'LightTS'  --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/ETTh2_96.log 
python run_longExp.py --data_path ETTh2.csv --data ETTh2 --features M  --seq_len 720 --pred_len 192 --chunk_size  72 --d_model 128 --learning_rate 1e-4 --model 'LightTS'  --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/ETTh2_192.log 
python run_longExp.py --data_path ETTh2.csv --data ETTh2 --features M  --seq_len 720 --pred_len 336 --chunk_size  72 --d_model 128 --learning_rate 1e-5 --model 'LightTS'  --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/ETTh2_336.log 
python run_longExp.py --data_path ETTh2.csv --data ETTh2 --features M  --seq_len 720 --pred_len 720 --chunk_size  72 --d_model 128 --learning_rate 1e-5 --model 'LightTS'  --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/ETTh2_720.log 

python run_longExp.py --data_path ETTm1.csv --data ETTm1 --features M  --seq_len 192 --pred_len  96 --chunk_size  48 --d_model 128 --learning_rate 1e-4 --model 'LightTS'  --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/ETTm1_96.log 
python run_longExp.py --data_path ETTm1.csv --data ETTm1 --features M  --seq_len 720 --pred_len 192 --chunk_size  72 --d_model 128 --learning_rate 1e-4 --model 'LightTS'  --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/ETTm1_192.log 
python run_longExp.py --data_path ETTm1.csv --data ETTm1 --features M  --seq_len 720 --pred_len 336 --chunk_size  72 --d_model 128 --learning_rate 1e-5 --model 'LightTS'  --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/ETTm1_336.log 
python run_longExp.py --data_path ETTm1.csv --data ETTm1 --features M  --seq_len 720 --pred_len 720 --chunk_size  72 --d_model 128 --learning_rate 1e-5 --model 'LightTS'  --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/ETTm1_720.log 

python run_longExp.py --data_path ETTm2.csv --data ETTm2 --features M  --seq_len 192 --pred_len  96 --chunk_size  48 --d_model 128 --learning_rate 1e-4 --model 'LightTS'  --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/ETTm2_96.log 
python run_longExp.py --data_path ETTm2.csv --data ETTm2 --features M  --seq_len 720 --pred_len 192 --chunk_size  72 --d_model 128 --learning_rate 1e-4 --model 'LightTS'  --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/ETTm2_192.log 
python run_longExp.py --data_path ETTm2.csv --data ETTm2 --features M  --seq_len 720 --pred_len 336 --chunk_size  72 --d_model 128 --learning_rate 1e-5 --model 'LightTS'  --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/ETTm2_336.log 
python run_longExp.py --data_path ETTm2.csv --data ETTm2 --features M  --seq_len 720 --pred_len 720 --chunk_size  72 --d_model 128 --learning_rate 1e-5 --model 'LightTS'  --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/ETTm2_720.log 

python run_longExp.py --enc_in 8 --data custom --data_path exchange_rate.csv --seq_len 98 --pred_len  96 --d_model 64 --chunk_size 7 --learning_rate 1e-3 --batch_size 32 --model 'LightTS' --train_epochs 200 --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/exchange_96.log 
python run_longExp.py --enc_in 8 --data custom --data_path exchange_rate.csv --seq_len 98 --pred_len 192 --d_model 64 --chunk_size 7 --learning_rate 1e-3 --batch_size 32 --model 'LightTS' --train_epochs 200 --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/exchange_192.log 
python run_longExp.py --enc_in 8 --data custom --data_path exchange_rate.csv --seq_len 98 --pred_len 336 --d_model 64 --chunk_size 7 --learning_rate 1e-3 --batch_size 32 --model 'LightTS' --train_epochs 100 --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/exchange_336.log 
python run_longExp.py --enc_in 8 --data custom --data_path exchange_rate.csv --seq_len 98 --pred_len 720 --d_model 64 --chunk_size 7 --learning_rate 1e-3 --batch_size 32 --model 'LightTS' --train_epochs 100 --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/exchange_720.log 

python run_longExp.py --enc_in 862 --data custom --data_path traffic.csv --seq_len 168 --pred_len  96 --d_model 256 --learning_rate 3e-5 --chunk_size 14 --batch_size 4 --model 'LightTS' --train_epochs 10 --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/traffic_96.log 
python run_longExp.py --enc_in 862 --data custom --data_path traffic.csv --seq_len 168 --pred_len 192 --d_model 256 --learning_rate 3e-5 --chunk_size 14 --batch_size 4 --model 'LightTS' --train_epochs 10 --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/traffic_192.log 
python run_longExp.py --enc_in 862 --data custom --data_path traffic.csv --seq_len 168 --pred_len 336 --d_model 256 --learning_rate 3e-5 --chunk_size 14 --batch_size 4 --model 'LightTS' --train_epochs 10 --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/traffic_336.log 
python run_longExp.py --enc_in 862 --data custom --data_path traffic.csv --seq_len 168 --pred_len 720 --d_model 256 --learning_rate 3e-5 --chunk_size 14 --batch_size 4 --model 'LightTS' --train_epochs 10 --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/traffic_720.log 

python -u run_longExp.py --enc_in 21 --data custom --model 'LightTS' --data_path weather.csv  --pred_len  96 --seq_len 192 --d_model 128 --learning_rate 1e-4 --chunk_size 48 --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/weather_96.log 
python -u run_longExp.py --enc_in 21 --data custom --model 'LightTS' --data_path weather.csv  --pred_len 192 --seq_len 720 --d_model 128 --learning_rate 1e-4 --chunk_size 72 --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/weather_192.log 
python -u run_longExp.py --enc_in 21 --data custom --model 'LightTS' --data_path weather.csv  --pred_len 336 --seq_len 720 --d_model 128 --learning_rate 1e-4 --chunk_size 72 --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/weather_336.log 
python -u run_longExp.py --enc_in 21 --data custom --model 'LightTS' --data_path weather.csv  --pred_len 720 --seq_len 720 --d_model 128 --learning_rate 1e-4 --chunk_size 72 --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/weather_720.log 

python -u run_longExp.py --enc_in 321 --data custom --model 'LightTS' --data_path electricity.csv  --pred_len  96 --seq_len 192 --d_model 128 --learning_rate 4e-4 --batch_size 128 --train_epochs 15 --chunk_size 48 --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/electricity_96.log 
python -u run_longExp.py --enc_in 321 --data custom --model 'LightTS' --data_path electricity.csv  --pred_len 192 --seq_len 720 --d_model 128 --learning_rate 4e-4 --batch_size 128 --train_epochs 15 --chunk_size 72 --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/electricity_192.log 
python -u run_longExp.py --enc_in 321 --data custom --model 'LightTS' --data_path electricity.csv  --pred_len 336 --seq_len 720 --d_model 128 --learning_rate 4e-4 --batch_size 128 --train_epochs 15 --chunk_size 72 --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/electricity_336.log 
python -u run_longExp.py --enc_in 321 --data custom --model 'LightTS' --data_path electricity.csv  --pred_len 720 --seq_len 720 --d_model 128 --learning_rate 3e-4 --batch_size 128 --train_epochs 15 --chunk_size 72 --is_training 1 --itr 1 --model_id LightTS >logs/origin/lightTS/electricity_720.log 
