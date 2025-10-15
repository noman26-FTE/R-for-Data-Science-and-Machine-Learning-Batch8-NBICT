#Simple linear regression in R basically to predict the salary based on the years of experience
#When one variable is independent and the other is dependent in simple linear regression

#How does simple linear regression work?
#It works by finding the best fit line that minimizes the distance between the actual data points and the predicted data points

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

#Straight line equation is y = a + bx
#y is the dependent variable
#x is the independent variable
#a is the constant or y intercept
#b is the slope of the line or coefficient of the independent variable

#Checking the summary of the model
summary(regressor)

#How to know the model is good or not?

#In this case, the R-squared value is 0.974, which means that 97.4% of the variation in the dependent variable (Salary) can be explained by the independent variable (YearsExperience).

#In this case, the p-value is less than 0.05, which means that the independent variable (YearsExperience) is statistically significant.

#Predicting the test set results
y_pred = predict(regressor, newdata = training_set)
y_pred

#Independant sample t test to compare the means of two independent groups
t.test(test_set$Salary, y_pred)
#Null hypothesis: The means of the two groups are equal
#Alternative hypothesis: The means of the two groups are not equal
#If the p value is less than 0.05, we reject the null hypothesis and accept the alternative hypothesis
#If the p value is greater than 0.05, we accept the null hypothesis and reject the alternative hypothesis
#In this case, the p value is 0.86, which is greater than 0.05, so we accept the null hypothesis and reject the alternative hypothesis. This means that there is no significant difference between the means of the two groups.

#So model predict is good from the test set

#Visualizing the training set results
install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary), colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = y_pred), colour = 'blue')+
  ggtitle('salary vs Experience')+
  xlab('years of Experience')+
  ylab('salary')

#Visualizing the test set results
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary), colour = 'red') +
  geom_line(aes(x = test_set$YearsExperience, y = predict(regressor, newdata = test_set)), colour = 'blue')+
  ggtitle('salary vs Experience')+
  xlab('years of Experience')+
  ylab('salary')

#How to score model accuracy
