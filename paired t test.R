#paired t test using weight loss data


library(readxl)
library(car)
library(tidyverse)
library(sjstats)
library(agricolae)

weight=read_excel('datasets.xlsx', sheet='z_t_test', range='c31:e61')
weight

head(weight)
tail(weight)
dim(weight)
str(weight)
names(weight)
summary(weight)
boxplot(weight$before, weight$after, col = 'brown')
qqnorm(weight$before)
qqline(weight$before)
boxplot(weight$after, col = 'red')
qqnorm(weight$after)
qqline(weight$after)




#for paired t test we have require two variables

before=weight$before
after=weight$after

t.test(before,after,paired=TRUE)

#P VALUE <0.05, INSUFFICIENT EVIDENCE TO SUPPORT NULL HYPOTHESIS

#H0: wt before=after
#null hypothesis rejected
#diet has decreased their wts by 0.74kgs which is statistically significant at 0.1%
# level of significance

#Assumption: normality-boxplot, qqplot

difference=weight$before-weight$after
Boxplot(difference)
qqPlot(difference)

#Data is normally distributed so assumption are met. Equal variances usually are not checked because same individuals have two readings
library(ggplot2)
