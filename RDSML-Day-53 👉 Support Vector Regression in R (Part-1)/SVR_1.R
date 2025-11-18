#What is support vector regression (SVR) and how to implement it in R
#Support Vector Regression (SVR) is a type of Support Vector Machine (SVM) that is used for regression tasks. It aims to find a function that approximates the relationship between input features and continuous output values while maintaining a margin of tolerance (epsilon) around the predicted values.
#Difference between multiple linear regression and SVR
#Multiple linear regression assumes a linear relationship between the input features and the output variable, while SVR can model non-linear relationships using kernel functions.

View(day)

#Setup packages and data loading
#install.packages(c("e1071", "ggplot2", 'dplyr'))
library(e1071)
library(ggplot2)
library(dplyr)

dataset = day

#Basic cleaning and feature selection

bike = dataset %>%
  select(cnt, temp, atemp, hum, windspeed, season, yr, mnth, holiday, 
         weekday, workingday, weathersit)

#Convert categorical variables to factors
bike = bike %>%
  mutate(season = as.factor(season),
         yr = as.factor(yr),
         mnth = as.factor(mnth),
         holiday = as.factor(holiday),
         weekday = as.factor(weekday),
         workingday = as.factor(workingday),
         weathersit = as.factor(weathersit))

#To check the structure of the data
str(bike)

#Splitting the data into training and testing sets
set.seed(123)
n = nrow(bike)
indices = seq_len(n)
train_idx = sample(indices, size = 0.7*n)
train_set = bike[train_idx, ]

test_set = bike[-train_idx, ]

