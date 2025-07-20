#anova= analysis of variance
#variance=SD*SD
#VARIANCE= sum((X-MEAN(X))^2)/(n-1)
#variance= mean sum of square

#SD= sqrt(variance)



#variance in dependent variable
#dependent variable(y)= yield

#Treatments= x1, x2
#Design: CRD, RCBD, FACTORIAL DESIGN(>1 FACTOR)

#sPLIT PLOT DESIGN= one factor difficult to manage

#Replication= number of repeating the same treatment
#Randomization= unbiased 
#Local control: keeping the same practice except the treatment
# control group is compared with treatment group

# Statistical analysis

#Ho: survival with breast cancer= survival with colon cancer= survival with ovary

#Assumption: data normally distributed, equal variance. More importantly residual distribution must be normal
#rESIDUAL= ERROR, IF NOT RANDOM, IT CONTAINS VARIANCE. I.E VARIANCES HAVE NOT BEEN ATTRIBUTED TO THE INDEOPENDNET VARIABLES PROPERLY

library(readxl)
library(car)
library(agricolae)
library(tidyverse)
library(sjstats)
cancer=read_excel('datasets.xlsx', sheet='anova', range = 'b11:d45')
cancer
glimpse(cancer)


#For anova, independent variables must be factor(categorial)

cancer$organ=as.factor(cancer$Organ)
glimpse(cancer)

#anova model

mod=aov(Survival~Organ, data = cancer)
summary(mod)
library(stargazer)

#P<0.05, H0 is rejected. At least one mean is different from others

#Assumption

boxplot(Survival~Organ, data = cancer)
qqPlot(Survival~Organ, data = cancer)

#Equal variance

leveneTest(Survival~Organ, data = cancer)

#P>0.05, Ho not rejected, variances are equal for all groups

#Residuals analysis, 4 figures in 1 plot
par(mfrow=c(2,2))
plot(mod)
par(mfrow=c(1,1))

read_excel('sensory_cookies.xlsx', range = 'a1:f61')
sensory=read_excel('sensory_cookies.xlsx', range = 'a1:f61')
sensory
str(sensory)


#Recall the anova model

mod
summary(mod)

#Model CV and Response variable CV
#CV(%)= (SD/mean)*100

#Model CV= ((RMSE)/mean)*100
#RMSE=sqrt(MSE)= residual standard error
#Response variable CV=(SD(y)/mean)*100

#SD is larger than mean, so CV will be grater than 100%

cv_response= (sd(cancer$Survival)/mean(cancer$Survival))*100
cv_model=(sqrt(784011)/mean(cancer$Survival))*100

cv_response
cv_model

#VARIANCE reduced by the model= cv_response-cv_model
cv_response-cv_model

#8.5% of varance has been reduced by the independent variables 
#Another explanation
#eta squared= sum of square of dependent variable/total sum of square

#eta squared= (5899086)/(5899086+24304330)= 0.1953119

#Model cv indicates the goodness of the model
#model cv>10%, good fit
#model cv>20%, acceptable fit
#model cv>30%, poor fit

#Post hoc test: WILL BE TELL US which independent variable is different from others
#Ho: Breast cancer= ovary cancer
#Ho:colon cancer= ovary cancer
#Ho: breast cancer and colon cancer are not equal


#H1: Atleast one mean is different from others
#But which means: answer will be given by post hoc test
#Post hoc test: Tukey HSD, lsd (least significant difference), Bonferroni, DMRT (Duncan's multiple range test)
#fOR LARGE SAMPLE: TUKEY HSD  is used
#for small sample: lsd is used dmrt is used

#Bonferroni correction:
agricolae::LSD.test(mod, 'Organ', alpha = 0.05, console=TRUE, p.adj='bonferroni')

#DMRT

agricolae::duncan.test(mod, 'Organ', alpha = 0.05, console=TRUE)
#Identical to bonferroni correction


#Tukey HSD
post_hoc=agricolae::HSD.test(mod, 'Organ', alpha = 0.05, console=TRUE)
#Identical to bonferroni correction
