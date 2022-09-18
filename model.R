# Here is where you need to add the code that
# produced your best model, or close to best model.
# This will be used to check that the predictions you
# made match your code.
# THUS WE NEED TO BE ABLE TO RUN YOUR CODE USING
# JUST THE DATA PROVIDED TO THE TRAINING DATA PROVIDED

# loading libraries
library(tidyverse)
library(tidymodels)
library(themis)
library(caret)

# Read data
tr <- read_csv("data/mouse_tr.csv") %>%
  mutate(celltype = factor(celltype))

ts <- read_csv("data/mouse_ts_mask.csv")

# xgboost method
xgb <- boost_tree() %>% 
  set_engine('xgboost') %>% 
  set_mode('classification') %>% 
  translate()

# recipe with preprocessing
trRec <- recipe(celltype~., data = tr[,-1]) %>% 
  step_zv(all_predictors()) %>% 
  step_nzv(all_predictors()) %>% 
  step_normalize(all_predictors())  

trx <- prep(trRec) %>% juice()
dim(trx)

# creating a workflow
xgb.wf <- workflow() %>% add_model(xgb)

# adding recipe to the workflow
xgb.rec.wf <- add_recipe(xgb.wf, trRec)

# fit a model
xgbMod <- fit(xgb.rec.wf, data = tr[,-1])

xgbPred <- predict(xgbMod, new_data = ts)
xgbPred <- data.frame(celltype=xgbPred$.pred_class)

pred <- cbind(location = ts$location, celltype = xgbPred)
#write.csv(pred, file = 'pjai0005_14.csv')

xgbMod %>%
  pull_workflow_fit() %>%
  vip::vip()
