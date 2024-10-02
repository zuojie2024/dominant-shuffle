
## Dominant shuffle

The proposed augmentation is defined in [utils/augmentations.py](https://github.com/zuojie2024/dominant-shuffle/blob/619fa1a01707cd4811dbad206482c8ab7aee00cf/utils/augmentations.py#L127-L146).
```
def dom_shuffle(self, x, y, rate=4, dim=1):
    xy = torch.cat([x,y],dim=1)
    xy_f = torch.fft.rfft(xy,dim=dim)
    magnitude = abs(xy_f)
    topk_indices = torch.argsort(magnitude, dim=1, descending=True)[:, 1:int(rate+1)]        
    #minor_indices = torch.argsort(magnitude, dim=1, descending=True)[:, 10:]  
    new_xy_f = xy_f
    for i in range(topk_indices.size(2)):
        for j in range(xy.size(0)):  
            random_indices = torch.randperm(topk_indices.size(1))                
            shuffled_tensor1 = topk_indices[:,:,i][j][random_indices]   
            new_xy_f[:,:,i][j][topk_indices[:,:,i][j]] = new_xy_f[:,:,i][j][shuffled_tensor1]
    xy = torch.fft.irfft(new_xy_f,dim=dim)
    return xy
```


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


