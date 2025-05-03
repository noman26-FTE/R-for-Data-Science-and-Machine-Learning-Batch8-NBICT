#Normal Distribution

#generate random numbers from a normal distribution
#Suppose we have interviewed n number of farmers to know their age

# to have same random number we use set.seed

sample=rnorm(n=10, mean = 50, sd= 5)
sample

set.seed(1)

#round the value to the nearest full integer


floor(sample) 
ceiling(sample)

age=round(sample)
age


# Now make samples of higher numbers of farmers-10k
set.seed(1)
ages= round(rnorm(10000, 50, 5))
summary(ages)

#Check normality through boxplot and QQplot

boxplot(ages)
qqnorm(ages)
qqline(ages)

#check statistically, shapiro test (n<5000 should be), smirnov-kolmogorov test (works for two variables)

#HO: Distribution is normal
#P-value>.05, HO not rejected, otherwise rejected when 'p<=0.05'
#p-value= evidence to support the null hypothesis
#p-value= type I error, extent error can happen in future trials

shapiro.test(ages[1:5000])

#as p<0.05, data is not normal

#visualize the distribution
hist(ages, breaks = 20)

#Density plot

plot(density(ages))

#Descriptive statistics

mean(ages)
median(ages)
sd(ages)


#Calculate standard error

length(ages)
se=sd(ages)/sqrt(length(ages))
se

#Confidence interval, mean+-1.96*se
#Z-score at 95% level, for normal distribution

mean(ages)-1.96*se
mean(ages)+1.96*se
paste('95% ci is 49.89, 50.07')

#To determine CI
t.test(ages)

range(ages)


