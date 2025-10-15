#Multiple linear regression 

#Importing the data set
dataset = read.csv('50_Startups.csv')

#What is multiple linear regression?
#Multiple linear regression is an extension of simple linear regression that allows us to model the relationship between one dependent variable and two or more independent variables.

#Through multiple linear regression, we can analyze how multiple factors simultaneously influence a single outcome.
#This technique helps us understand the combined effect of several predictors on the response variable.
#It is commonly used in various fields such as economics, finance, social sciences, and healthcare to make predictions and infer relationships between variables.

#In multiple linear regression, statistically significant independent variables are identified, and their coefficients indicate the strength and direction of their impact on the dependent variable.

#Encoding categorical data
dataset$State = factor(dataset$State, levels = c('New York', 'California', 'Florida'), labels = c(1, 2, 3))

#Splitting the dataset into the Training set and Test set
install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Fitting Multiple Linear Regression to the Training set

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, data = training_set)
summary(regressor)

#Multiple r squared:  0.9507,	Adjusted R-squared:  0.9348 means that 93.48% of the variance in the dependent variable (Profit) can be explained by the independent variables (R.D.Spend, Administration, Marketing.Spend, and State) in the model.

