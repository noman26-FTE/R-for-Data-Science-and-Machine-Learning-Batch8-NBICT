library(car)
library(readxl)
library(tidyverse)

apple=read_excel('datasets.xlsx', sheet='z_t_test', range='B4:c24')
apple
view(apple)
#H0: mean wt of apples =90g
mean(apple$wts)

#Assumption, normality=boxplot
boxplot(apple$wts, col = 'red')
qqnorm(apple$wts)
qqline(apple$wts)

#data seems not to be normal, can run t test for demo

t.test(apple$wts, mu=90)

#p>.05, sufficient evident to support to null hypothesis, cant not be rejected. 


#If population parameter is known and sample size is large
#(n>=30),z test can be done

library(BSDA)
z.test(apple$wts, mu=92, sigma.x =5)

#Ho: true mean equal to 90, insufficient evidence, Ho rejected
#conclusion: true mean is not equal to 92
#check the CI: 86.76219 91.14481, does not contain 92

#Q2:
Baby=read_excel('datasets.xlsx', sheet='z_t_test', range='L23:Q498')
Baby
str(Baby)
#Add a variable BMI, using mutate ()

Baby=Baby %>% mutate(BMI=Weight/(Height/100)^2)
head(Baby)
str(Baby)


library(kableExtra)
kbl(head(Baby))


#Add z score variable

Baby=Baby %>% mutate(z_weight=(Weight-mean(Weight))/sd(Weight))
head(Baby)
summary(Baby$z_weight)

#Count the number of babies with z score less than -2

Category=cut(Baby$z_weight, breaks = c(-Inf, -2, +Inf),
    labels = c('Wasted','Normal'),
    right=FALSE)

#Frequency or percentage table of category

table(Category)*100/length(Category)

#Answer: 2.11% of the babies are wasted



#Ho: Average age of mothers of female babies and male babies are equal
#Two sample T test
#Assumption: normal distribution
# Equal Vaiance

Baby$Sex=as.factor(Baby$Sex)
str(Baby)
boxplot(Age_mothers~Sex, data=Baby)

#Bring two plots in a single canvus, 1 row, 2 colums


#For male
qqnorm(Baby$Age_mothers[Baby$Sex==1])
qqline(Baby$Age_mothers[Baby$Sex==1])

#For females
qqnorm(Baby$Age_mothers[Baby$Sex==2])
qqline(Baby$Age_mothers[Baby$Sex==2])
par(mfrow=c(1,1))

#For large sample we can consider as normally

#Check equality of variance (Levene Test)

car::leveneTest(Age_mothers~Sex, data=Baby)

#P<0.05, variances are not equal
# t test is not applicable, wlch test is suggested

t.test(Age_mothers~Sex, data=Baby, var.equal= TRUE)

#wLCH TEST

t.test(Age_mothers~Sex, data=Baby, var.equal= FALSE)

#wILCOXON TEST, DATA WHEN NOT NORMAL

wilcox.test(Age_mothers~Sex, data=Baby)
