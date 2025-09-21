#Two way anova 
cropdata
str(cropdata)
View(cropdata)
#If we have two types grouping varaibles and one continuous response variable, we can use two way anova

#Installing packages
install.packages(c("dplyr","ggplot2","car", 'tidyverse', 'ggpubr', 'emmeans', 'effectsize','performance', 'broom', 'kableExtra'))

#Loading packages
library(dplyr)
library(ggplot2)
library(car)
library(tidyverse)
library(ggpubr)
library(emmeans)
library(effectsize)
library(performance)
library(broom)
library(kableExtra)

#Importing data
d = cropdata

#Quick EDA- exploratory descriptive analysis
summs = d %>%
  group_by(fert, irr) %>%
  summarise(
    mean = mean(y),
    se = sd(y)/sqrt(n()),
    .groups = 'drop')

#Quick data summary visualization
ggplot(summs, aes(x = irr, y = mean, group = fert , color = fert)) +
  geom_line() +
  geom_point(size = 2) +
  geom_errorbar(aes(ymin = mean - se, ymax = mean + se), width = 0.2) +
  facet_wrap(~ fert, nrow = 1) +
  labs(title = "Mean Crop Yield by Irrigation",
       x = "Irrigation",
       y = "Mean Crop Yield") +
  theme_classic(base_size = 12)


#Part-2 of Two Way Anova

#Fitting the two way anova model

m = aov(y ~ fert + irr + fert * irr, data = d)
summary(m)

#Checking anova assumptions visually
par(mfrow = c(2,2))
plot(m)
par(mfrow = c(1,1))

#Checking the residulas normality
res = residuals(m)
shapiro.test(res)
#p-value > 0.05, we can assume normality

#Checking homogeneity of variance
library(car)
leveneTest(y~fert * irr, data = d, center = median)
#p-value > 0.05, we can assume homogeneity of variance
#If the assumptions are not met, we can use transformations or non-parametric tests

#For example, we can use log transformation
d$log_y = log(d$y)
m2 = aov(log_y ~ fert + irr + fert * irr, data = d)
summary(m2)
par(mfrow = c(2,2))
plot(m2)
par(mfrow = c(1,1))
res2 = residuals(m2)
shapiro.test(res2)
leveneTest(log_y~fert * irr, data = d, center = median)

#Interaction contrasts (simple effects): effect of fert at each level of irr
library(emmeans)
contrast(emmeans(m, ~ fert | irr), method = "pairwise", adjust = "tukey")

#Interaction contrasts (simple effects): effect of irr at each level of fert
library(emmeans)
contrast(emmeans(m, ~ irr | fert), method = "pairwise", adjust = "tukey")

#Main effect comparison (only if interation is negligible)

contrast(emmeans(m, ~ fert), method ="tukey")
contrast(emmeans(m, ~ irr), method ="tukey")

#CLD LETTERS

library(multcomp)
#install.packages("multcompView")
library(multcompView)

group_letters = cld(emmeans(m, ~ fert * irr), Letters = letters)
group_letters
