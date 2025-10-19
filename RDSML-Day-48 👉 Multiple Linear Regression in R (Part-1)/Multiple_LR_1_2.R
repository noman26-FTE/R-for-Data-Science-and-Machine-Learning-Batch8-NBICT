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

#Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)
print(y_pred)

#Step wise Backward Elimination means removing the least significant variable one by one based on p-value until all variables are statistically significant.
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend, data = training_set)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend+ Marketing.Spend, data = training_set)
summary(regressor)

#Automated stepwise Backward Elimination
full_model = lm(Profit ~ ., data = training_set)
summary(full_model)

final_model = step(full_model, direction = "backward")
summary(final_model)

#Assumption checking
cor(training_set$R.D.Spend, training_set$Profit, method = "pearson")

cor.test(training_set$Marketing.Spend, training_set$Profit, method = "pearson")

cor.test(training_set$R.D.Spend, training_set$Profit, method = "pearson")

plot(training_set$R.D.Spend, training_set$Profit) 

plot(training_set$Marketing.Spend, training_set$Profit)

plot(final_model)
par(mfrow=c(2,2))
plot(final_model)
#Linearity: The residuals vs. fitted values plot should show no clear pattern, indicating that the relationship between the independent and dependent variables is linear.

# Checking for the Independence of errors assumption
install.packages("lmtest")
library(lmtest)
dwtest(final_model)
# A Durbin-Watson statistic close to 2 suggests that the residuals are uncorrelated. It should be non significant (p-value > 0.05) to confirm independence of errors. So if p-value > 0.05, we fail to reject the null hypothesis of independence. should include more explanatory variables or use time series modeling techniques.

#Checking the normality of residuals assumption
shapiro.test(rstandard(final_model))
qqnorm(rstandard(final_model))
qqline(rstandard(final_model))

#Checking the multicollinearity assumption
install.packages("car")
library(car)
vif(final_model)
# VIF values greater than 5 or 10 indicate a multicollinearity problem. In such cases, consider removing or combining correlated predictors.

#Checking the homoscedasticity assumption
install.packages("lmtest")
library(lmtest)
bptest(final_model)

plot(final_model$fitted.values,rstandard(final_model))
abline(h=0,col="red")

#As bptest p-value > 0.05, we fail to reject the null hypothesis of homoscedasticity. Thus, the assumption of homoscedasticity is met.

summary(final_model)

# Multiple Linear Regression Analysis Report
# 1. Objective
# To develop a multiple linear regression model to predict Profit based on R&D Spend, Administration, Marketing Spend, and State using the 50_Startups dataset.
# 
# 2. Model Summary
# The final model (after backward elimination) was:
#   
# Profit = b0 + b1 x R&D Spend + b2 x Marketing Spend 
# Dependent variable: Profit
# 
# 
# Significant predictors: R&D Spend (p < 0.001), Marketing Spend (p < 0.05)
# 
# 
# Removed predictors: Administration and State (p > 0.05)
# 
# 
# Interpretation:
#   For every $1 increase in R&D Spend, Profit increases by approximately β₁ units, holding other factors constant.
# 
# 
# Marketing Spend also shows a positive but smaller contribution to Profit.
# 
# 
# 
# 3. Model Fit
# R² ≈ 0.95 → The model explains about 95% of the variation in Profit.
# 
# 
# Adjusted R² ≈ 0.948 → Still very high after adjusting for the number of predictors.
# 
# 
# F-statistic p-value < 0.001 → The overall regression model is statistically significant.
# 
# 
# 
# 4. Assumption Tests
# Assumption Test/Plot Result Interpretation
# Linearity
# Residual vs Fitted Plot
# No strong curve
# Linear assumption reasonable
# Independence
# Durbin–Watson = 1.26, p = 0.0018
# Violated
# Some positive autocorrelation detected
# Homoscedasticity
# Breusch–Pagan p > 0.05
# Met
# Residuals have constant variance
# Normality
# Shapiro–Wilk p = 0.0106; QQ plot nearly linear
# Mild deviation
# Slight non-normality due to tails
# Multicollinearity
# All VIF < 5
# Met
# Predictors are independent enough
# 
# 
# 5. Conclusion
# R&D Spend is the strongest and most significant predictor of Profit.
# Marketing Spend has a secondary but positive effect.

# Administration and State do not significantly influence Profit once other factors are considered.

# The model fits the data very well overall, though slight autocorrelation and mild non-normality were noted.

# 6. Recommendations
# Focus on increasing R&D investment to improve profits.

# Consider collecting more data or exploring time-series methods if autocorrelation persists (suggesting a trend or ordering effect).

# Investigate potential outliers that might influence the normality of residuals.
