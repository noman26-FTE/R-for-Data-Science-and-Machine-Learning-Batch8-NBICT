#One sample t test explanation
#If we know the population mean but dont know the standard mean then we have to do One sample t test.

#The data need to be normally distributed

#We required calculated t and tabulated t to perform the t-test

# If calculated t is greater than tabulated t then we reject the null hypothesis
# If calculated t is less than tabulated t then we cant reject the null hypothesis

#Importing the data set

mydata = read.csv('bottle_data.csv')
View(mydata)

#Checking the normality of the data
shapiro.test(mydata$value)

#As p value is greater than 0.05, we can assume that the data is normally distributed.

#Performing one sample t-test

t.test(x = mydata$value, mu = 150)

# Interpret the results: The t-test results show the t-value, degrees of freedom, p-value, confidence interval, and the mean of the sample.

# As p value is less than 0.05, we reject the null hypothesis and conclude that the sample mean is significantly different from the population mean of 150.


# Performing a t-test to compare the means of two groups
#Null hypothesis: sample mean is equal to population mean
