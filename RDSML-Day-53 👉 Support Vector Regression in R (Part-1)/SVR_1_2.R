#What is support vector regression (SVR) and how to implement it in R
#Support Vector Regression (SVR) is a type of Support Vector Machine (SVM) that is used for regression tasks. It aims to find a function that approximates the relationship between input features and continuous output values while maintaining a margin of tolerance (epsilon) around the predicted values.
#Difference between multiple linear regression and SVR
#Multiple linear regression assumes a linear relationship between the input features and the output variable, while SVR can model non-linear relationships using kernel functions.

# Setup: packages and data loading
install.packages(c("e1071","ggplot2","dplyr"))

library(e1071)
library(ggplot2)
library(dplyr)

# Loading the dataset
dataset <- read.csv("day.csv")

# Basic cleaning and feature selection
bike <- dataset %>%
  select(cnt, temp, atemp, hum, windspeed, season, yr, mnth, 
         holiday, weekday, workingday, weathersit)

str(bike)

# Convert categorical variables to factors
bike <- bike %>%
  mutate(
    season = factor(season),
    yr = factor(yr),
    mnth = factor(mnth),
    holiday = factor(holiday),
    weekday = factor(weekday),
    workingday = factor(workingday),
    weathersit = factor(weathersit)
  )

str(bike)

# Train/Test Split
set.seed(123)
n <- nrow(bike)
indices <- seq_len(n)
train_idx <- sample(indices, size = 0.7 * n)
train_set <- bike[train_idx, ]
test_set <- bike[-train_idx, ]

#Feature Scaling for numeric numbers

#Identify numeric predictors

num_cols = c("temp", "atemp", "hum", "windspeed")

#Compute scaling parameters on training set

train_means = sapply(train_set[, num_cols], mean)
train_sds = sapply(train_set[, num_cols], sd)

#Scale function
scale_num = function(df){
  df[, num_cols] = sweep(df[, num_cols], 2, train_means, FUN = "-")
  df[, num_cols] = sweep(df[, num_cols], 2, train_sds, FUN = "/")
  return(df)
}

#Apply scaling
train_scaled = scale_num(train_set)
