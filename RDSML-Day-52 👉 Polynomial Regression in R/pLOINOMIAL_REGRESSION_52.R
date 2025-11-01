#wHAT IS POLINOMIAL REGRESSION?
#Polynomial regression is a type of regression analysis in which the relationship between the independent variable (X) and the dependent variable (Y) is modeled as an nth degree polynomial. It is used when the data shows a curvilinear relationship, meaning that the change in Y is not constant for a unit change in X.

# equation of polynomial regression:
# Y = b0 + b1*X + b2*X^2 + b3*X^3 + ... + bn*X^n

# Importing the dataset
dataset = read.csv('polynom_data.csv')
attach(dataset)

#Plot the dataset
plot(x, y, main = 'Polynomial Regression Example', xlab = 'Independent Variable (X)', ylab = 'Dependent Variable (Y)', pch = 19, col = 'blue')

#Fit a quadratic (degree 2) polynomial regression model to the dataset. #quadratic (degree 2) means we are fitting a polynomial of degree 2
#y = a + b1*x + b2*x^2

polynom_model = lm(y ~ poly(x, 2, raw = TRUE), data = dataset)

#summary of the model
summary(polynom_model)

#Create new data for prediction
x_new = seq(min(x), max(x), length.out = 100)
y_pred = predict(polynom_model, newdata = data.frame(x=x_new))
pred_data = data.frame(x_new, y_pred)

#Add fitted curve to the plot
lines(x_new, y_pred, col = 'blue', lwd = 2)


#Visualizing the Polynomial Regression results (for higher resolution and smoother curve)
library(ggplot2)
ggplot() +
  geom_point(aes(x = x, y = y), color = 'blue') +
  geom_line(aes(x = x_new, y = y_pred), color = 'blue', size = 1) +
  ggtitle('Polynomial Regression Results') +
  xlab('Independent Variable (X)') +
  ylab('Dependent Variable (Y)') +
  theme_minimal()

#Fit a cubic (degree 3) polynomial regression model to the dataset. #y = a + b1*x + b2*x^2 + b3*x^3. How much degrre we have to fit the model

polynom_model3 = lm(y ~ poly(x, 3, raw = TRUE))
summary(polynom_model3)
lines(x_new, 
      predict(polynom_model3, newdata = data.frame(x=x_new)), 
      col = 'red', lwd = 5, lty = 2)


#Instructor Repository
# Importing the dataset
dataset <- read.csv("polynom_data.csv")
attach(dataset)

# Plot the data
plot(x, y, main = "Polynomial Regression Example", pch = 19)

# Fit a quadratic (degree 2) polynomial regression
polynom_model <- lm(y ~ poly(x, 2, raw = TRUE))

# View the model summary
summary(polynom_model)

# Create new data for prediction
x_new <- seq(min(x), max(x), length.out = 100)
# x_new <- data.frame(x_new)
y_pred <- predict(polynom_model, newdata = data.frame(x = x_new))
pred_data <- data.frame(x_new, y_pred)

# Add fitted curve to the plot
lines(x_new, y_pred, col = "blue", lwd = 2)


# Fit a cubic (degree 3) polynomial regression
polynom_model3 <- lm(y ~ poly(x, 3, raw = TRUE))
summary(polynom_model3)
lines(x_new, 
      predict(polynom_model3, newdata = data.frame(x = x_new)), 
      col = "red", lwd = 2, lty = 2)

legend("topright", legend = c("Degree2", "Degree3"),
       col = c("blue", "red"),
       lty = c(1, 2),
       lwd = 2)

# Fit a cubic (degree 4) polynomial regression
polynom_model4 <- lm(y ~ poly(x, 4, raw = TRUE))
summary(polynom_model4)
lines(x_new, 
      predict(polynom_model4, newdata = data.frame(x = x_new)), 
      col = "orange", lwd = 2, lty = 2)

legend("topright", legend = c("Degree2", "Degree3", "Degree4"),
       col = c("blue", "red", "orange"),
       lty = c(1, 2),
       lwd = 2)
# Fit a cubic (degree 5) polynomial regression
polynom_model5 <- lm(y ~ poly(x, 5, raw = TRUE))
summary(polynom_model5)
lines(x_new, 
      predict(polynom_model5, newdata = data.frame(x = x_new)), 
      col = "grey", lwd = 2, lty = 2)

legend("topright", legend = c("Degree2", "Degree3", "Degree4", "Degree5"),
       col = c("blue", "red", "orange", "grey"),
       lty = c(1, 2),
       lwd = 2)