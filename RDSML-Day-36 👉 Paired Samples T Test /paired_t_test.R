#paired sample t test means when same person received two different treatments

#Ho: mean of before treatment = mean of after treatment
#Ha: mean of before treatment != mean of after treatment
#alpha = 0.05

#Requirement for paired sample t test
#1. Dependent variable should be continuous/quantitative data
#2. Independent variable should consist of two categorical, "related groups" or "matched pairs"
#3. No significant outliers in the differences between the two related groups

#4. The distribution of the differences in the two related groups should be approximately normally distributed


View(paired_samples_t_test)
data= paired_samples_t_test
View(data)

#Checking the normality of the differences
differ = data$carb - data$carb_protein
shapiro.test(differ)

#p value = 0.7797>0.05, we can assume that the differences are approximately normally distributed

#checking for outliers using boxplot

boxplot(differ)

#No significant outliers found
#If found any significant outliers, we have to remove them before performing the paired sample t test

#Performing the paired sample t test

t.test(x= data$carb, 
       y = data$carb_protein, 
       paired=TRUE)

#p value = 0.0001742 < 0.05, we reject the null hypothesis
#We can conclude that there is a significant difference between the means of two treatments

#If the differences are not normally distributed, we can use the wilcoxon signed rank test

wilcox.test(x= data$carb, 
            y = data$carb_protein, 
            paired=TRUE)
#p value = 0.0002441 < 0.05, we reject the null hypothesis

#Calculating mean and sd

mean(data$carb)
sd(data$carb)
mean(data$carb_protein)
sd(data$carb_protein)

#Calculating effect size (Cohen's d)
install.packages("effsize")
library(effsize)
cohen.d(data$carb, data$carb_protein, paired=TRUE)

#Cohen's d = -0.186, which indicates a small effect size

#0.2~small effect
#0.5~medium effect
#0.8~large effect

#Writing the result in APA format
#A paired sample t test was conducted to whether there is a significant difference between the distance ran when participants imbibed carbohydrate drink and carbohydrate-protein drink. No outliers were detected in the differences between the two related groups as assessed by boxplot. The differences between the two related groups were approximately normally distributed, as assessed by Shapiro-Wilk's test (p = 0.77). There was a significant difference in the distance ran when participants imbibed carbohydrate drink (M = 11.16, SD = 0.726) and carbohydrate-protein drink (M = 11.30225, SD = 0.7136793); t(14) = -4.49, p = 0.0001742, Cohen's d = -0.186, indicating a small effect size. These results suggest that the type of drink consumed has a significant effect on the distance ran by participants.