# Prediction of cell type in mouse

# Task

This is a KaggleInClass challenge, you can find at https://www.kaggle.com/c/antechinus/. 

Your task is to predict the celltype of the samples based on the gene expression values. Celltype is one of 10 possibilities (cardiomyocyte, endothelium, erythroid, forebrain, gut, mesenchyme, mid_hindbrain,   neural_crest, somitic_mesoderm, spinalCord). The classes are a little imbalanced. You are expected to build a model to predict which it is, as accurately as possible. 

It is also expected that you obtain some understanding of the variables that are most important for making an accurate prediction, and to detect any fires in the training set which might have be problematic, anomalies or misclassified.

## About the data

- See "Data" tab on the kaggle site to download training and test data: 
    - `mouse_tr.csv` contains the full training set.
    - `mouse_ts_mask.csv` contains the test set that you need to predict, has all of the same variables as the training set except for the `celltype` variable
    - `mouse_ts_samp.csv` contains a sample set of predictions, with random values for the cell type, so you can see the format needed for your submission `csv` file.
    
The training set has 1003 variables. The first variable `location` is a unique label for each sample, and should not be used in the modelling. There ten cell types: 

```
 1 cardiomyocyte      663
 2 endothelium       1321
 3 erythroid          753
 4 forebrain          338
 5 gut                487
 6 mesenchyme         389
 7 mid_hindbrain      303
 8 neural_crest       480
 9 somitic_mesoderm   793
10 spinalCord         797
```

The predictors are all different gene motifs, a nucleic acid sequence pattern that has some biological significance. 
