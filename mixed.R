library(pacman)
#Mixed effects model
#Load multiple packages through pacman
#Pacman function can load multiple packages at once automatically

pacman::p_load(readxl, tidyverse, lme4, lmerTest, BSDA, kableExtra, car, agricolae, sjstats, jtools)


#Read the data using file> import data set

plum=datasets <- read_excel("datasets.xlsx", sheet = "anova", 
                       range = "Ac13:AF45")
plum
glimpse(plum)
head(plum)
tail(plum)
factors=c('Replication', 'Irrigation', 'Variety')
glimpse(plum)
plum[factors]=lapply(plum[factors], as.factor)
table(plum$Irrigation, plum$Variety)
ggplot(plum, aes(x=Variety, y=Replication, color=Replication))+
  geom_tile()+
  facet_grid(~Irrigation)
#Fit Anova model
fixed=aov(Yield~Irrigation+Variety, data=plum)
summary(fixed)

#Replication and Irrigation*Variety are not significant

mixed= lmer(Yield~Irrigation+Variety+(1|Irrigation), data=plum)
summary(mixed)

#From random part
8.121/(8.121+2.122)*100
#79.3% of the total variance in the random part explained by Irrigation

#Fixed effcts R^2
jtools::summ(mixed)

#Anova of mixed model
anova(mixed)

#Comparing the fixed and mixed model
anova(mixed, fixed)
#Is the difference between the AIC AND BIC of fixed and mixed models is significant?
#P>0.05, sufficient evidence to support the Ho (fixed=mixed)

#Principle of parsimony: simple is better
#AIC and BIC are lower for fixed model, so fixed model is better

