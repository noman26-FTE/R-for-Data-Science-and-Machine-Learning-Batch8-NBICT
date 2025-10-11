#Simple linear regression in R basically to predict the salary based on the years of experience
#When one variable is independent and the other is dependent in simple linear regression

#Multiple linear regression is when there are multiple independent variables and one dependent variable

#Machine learning means the ability of a machine to learn from data and make predictions or decisions without being explicitly programmed

#Importing the data set

dataset = read.csv('Salary_Data.csv')

#Splitting the dataset into training set and test set. Training set is used to train the model and test set is used to test the model.

install.packages('caTools')
library(caTools)
#Setting seed to get the same random numbers every time
set.seed(123) 
split = sample.split(dataset$Salary, SplitRatio = 2/3)
split

#True means the row goes in the training set and false means it goes in the test set

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Fitting simple linear regression model to the training set
regressor = lm(formula = Salary ~ YearsExperience, data = training_set)

#Salary is the dependent variable and YearsExperience is the independent variable