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
