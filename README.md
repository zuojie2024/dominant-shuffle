# dominant shuffle


## Getting Started
### Environment Requirements

First, please make sure you have installed Conda. Then, our environment can be installed by:
```
conda create -n domshuffle python=3.7
conda activate domshuffle
pip install -r requirements.txt
```

### Data Preparation
You can obtain all the eight benchmarks from [Google Drive](https://drive.google.com/drive/folders/1ZOYpTUa82_jCcxIdTmyr0LXQfvaM9vIy) provided in Autoformer. All the datasets are well pre-processed and can be used easily.

```
mkdir dataset
```
**Please put them in the `./dataset` directory**

## To reproduce the results in our paper

### Original performance of models
We provide scripts to facilitate reproducing main experiment results in our paper.

You can get the Original performances of iTransformer by running scripts in `scripts/Original/iTransformer`. For example, to get the original performance(without augmentations) of iTransformer in weather, you can run

```
sh scripts/Original/iTransformer/weather.sh
```

For Autoformer, Lightts, MICN, SCINet and TiDE, you can use scripts from: `scripts/Original/`. 

### Performance of models with dominant shuffle
This experiment shows the performance of model with dominant shuffle.

For iTransformer, you can run the scripts in `scripts/Augmentation/iTransformer`. For Autoformer, Lightts, MICN, SCINet and TiDE, you can use scripts from `scripts/Augmentation/`. 

There are few hyperparameters in this part:
| Parameter      |                              Interpretation                          |
| ------------- | -------------------------------------------------------| 
| aug            | Set it to dom_shuffle for dominant shuffle, you can alse set it to f_mask or f_mix for FrAug.                  |
| aug_rate      | The corresponding K dominant frequencies to be shuffled.  | 
| in_batch_augmentation | Augment data in training batch  (save memory) |


