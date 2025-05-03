pacman::p_load(readxl, jtools, tidyverse)

cheese=read_excel("datasets.xlsx", sheet = "coerrelation_regression", 
                       range = "c14:f44")
mod=lm(Taste~Acetic, cheese)
summ(mod, confint= T)


actual=cheese$Taste
cheese$predicted=predict(mod)
cheese$residuals= actual-cheese$predicted
cheese$residuals


ggplot(cheese, aes(x = Acetic, y = Taste)) +
  geom_smooth(method = 'lm', formula = y ~ x, se = FALSE, linewidth = 2, color = 'red') +  
  geom_segment(aes(xend = Acetic, yend = predicted), color = 'grey50', linewidth = 1, 
               arrow = arrow(type='open', ends = 'first', length = unit(0.1, 'inches'))) +
  geom_point(color = 'blue', shape = 19, size = 5, alpha = 0.5) + theme_test()


names(mod)
boxplot(mod$residuals,col="red")
library(car)
qqPlot(mod)


plot(mod, which=1)

ggplot(cheese, aes(y = residuals, x = predicted)) +
  geom_point(shape = 1, size = 2) + theme_test() +
  geom_hline(yintercept = 0, linetype = 'dotted', linewidth = 1) +
  geom_hline(yintercept = 15, linetype = 'dashed', linewidth = 1, color = 'blue') +
  geom_hline(yintercept = -15, linetype = 'dashed', linewidth = 1, color = 'blue') +
  geom_abline(intercept = -7, slope = 1.1) +
  geom_abline(intercept = 1, slope = -1.0)


summ(mod, robust=T, confint=T)

model = lm(Taste ~ Acetic + H2S + Lactic, cheese)
summ(model, confint = T, vif = T)

model_reduced = lm(Taste ~ H2S + Lactic, cheese)
summ(model_reduced, confint = T, vif = T, scale = T)


plot(model_reduced, which = 1)
plot(model_reduced, which = 2)
boxplot(cheese$Taste)
qqPlot(cheese$Taste)
