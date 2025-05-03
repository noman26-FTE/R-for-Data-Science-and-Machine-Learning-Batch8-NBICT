
pacman::p_load(readxl, tidyverse, lme4, lmerTest, BSDA, kableExtra, car, agricolae, sjstats, jtools)
library(readxl)
data=read_excel("datasets.xlsx", sheet = "wrangling", 
                       range = "V7:AG39")         
str(data)
head(data)               
car=data %>% select(mpg, disp, hp, drat, wt, qsec)
head(car)
cor.test(car$mpg, car$hp)

cor.test(data$mpg, data$cyl, method = 'spearman')

cont_table=table(data$gear, data$carb)
cont_table
chisq.test(cont_table)


fisher.test(cont_table)

plot(car, gap=1/10)
scatterplotMatrix(formula=~mpg+disp+hp+drat+wt+qsec, data=car, smooth=F, regLine=T, ellipse=FALSE)


cor_mat=cor(car)
cor_mat
round(cor_mat, 2)

pacman::p_load(GGally, corrplot, ggcorrplot)
p_mat=cor_pmat(car)
p_mat
round(p_mat, 2)

ggcorrplot(cor=cor_mat, p.mat = p_mat, method = 'square', type='lower', insig='pch', ggtheme=ggplot2::theme_test)


corrplot(cor_mat)

ggpairs(car)+theme_test()

