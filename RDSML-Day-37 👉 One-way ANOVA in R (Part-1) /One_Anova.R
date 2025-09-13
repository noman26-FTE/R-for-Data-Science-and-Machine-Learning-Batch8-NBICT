#One way anova means to compare means of more than two groups
#If there are two groups we can use t-test
#Requirement for one way anova
#1. Dependent variable should be continuous
#2. Independent variable should be categorical with two or more groups
#No outliers are expected in the variable

#Homoscedasticity: The variance among the groups should be approximately equal
#We can use Levene's test to check for homoscedasticity
#We can use Shapiro-Wilk test to check for normality

#Importing the dataset

PlantGrowth <- PlantGrowth
View(PlantGrowth)

#Ho: All the group means are equal
#Ha: At least one group mean is different

#Importing the dplyr package

install.packages("dplyr")
library(dplyr)

#Computing the grpoup means and standard deviations, SE

stats = PlantGrowth %>%
  group_by(group) %>%
  summarise(
    count = n(),
    mean = mean(weight),
    sd = sd(weight),
    se = sd (weight)/sqrt(n()))
print(stats)

#Visualizing the data

#Creating groupwise boxplots to see the outliers

boxplot(weight ~ group, 
        data = PlantGrowth, 
        main = "PlantGrowth data",
        ylab = "Dried weight of plants", col = "lightgray")
#From the boxplot we can see that there are no outliers

install.packages("ggpubr")
library(ggpubr)

#Creating groupwise violin plots to see the distribution of data
ggviolin(PlantGrowth, x = "group", y = "weight",
         fill = "group", palette = "jco",
         add = "boxplot", add.params = list(fill = "white")) +
  stat_compare_means(label.y = 9)

#Another plot
#Dependent variable always goes to y-axis

#Visualizing the data using mean plot
ggline(PlantGrowth,
       x = 'group',
       y = 'weight',
       add = c('mean_se', 'jitter'),
       fill = 'group',)

#rUNNING THE ANOVA TEST

anova = aov(weight ~ group, data = PlantGrowth)
summary(anova)

#From the summary we can see that the p-value is less than 0.05
#So we reject the null hypothesis and accept the alternative hypothesis
#So we can say that at least one group mean is different

#Tukey multiple pairwise comparison

TukeyHSD(anova)

#Homogeneity of variance test
plot(anova, 1)

#Homoscedasticity test
install.packages("car")
library(car)
leveneTest(weight ~ group, data = PlantGrowth)
#From the Levene's test we can see that the p-value is greater than 0.05
#So we accept the null hypothesis and say that the variances are equal

#If the variances are not equal we can use Welch ANOVA
#oneway.test(weight ~ group, data = PlantGrowth)
#Pairwise t test with no assumption of equal variances
#pairwise.t.test(PlantGrowth$weight, PlantGrowth$group,p.adjust.method = "BH", pool.sd = FALSE)

#Normality test
plot(anova, 2)

#Extracting residuals
aov_res = residuals(object = anova)
aov_res

#Running Shapiro-Wilk test

shapiro.test(aov_res)

#From the Shapiro-Wilk test we can see that the p-value is greater than 0.05
#So we accept the null hypothesis and say that the data is normally distributed

#If the data is not normally distributed we can use Kruskal-Wallis test
kruskal.test(weight ~ group, data = PlantGrowth)
#Pairwise wilcoxon test for post hoc analysis
pairwise.wilcox.test(PlantGrowth$weight, PlantGrowth$group, p.adjust.method = "BH")

#rnorm(3, mean = 104.28, sd = 0.38)

