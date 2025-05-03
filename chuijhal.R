pacman::p_load(readxl, tidyverse, lme4, lmerTest, BSDA, kableExtra, car, agricolae, sjstats, jtools)
library(readxl)
data=read_excel("Data_chuijhal.xlsx", sheet = "data_jhal", 
                range = "d3:m33") 
data
str(data)
spice=data %>% select(Ca, Mg, Fe, Cu, Zn, Na, K, vit_c )
spice
head(spice)
cor.test(spice$Ca, spice$Mg)

plot(spice, gap=1/10)
scatterplotMatrix(formula=~Ca+Mg+Fe+Cu+Zn+Na+K+vit_c, data=spice, smooth=F, regLine=T, ellipse=FALSE)


cor_mat=cor(spice)
cor_mat
round(cor_mat, 2)



pacman::p_load(GGally, corrplot, ggcorrplot)
p_mat=cor_pmat(spice)
p_mat
round(p_mat, 2)
ggcorrplot(cor=cor_mat, p.mat = p_mat, method = 'square', type='lower', insig='pch', ggtheme=ggplot2::theme_test)

corrplot(cor_mat)

ggpairs(spice)+theme_test()
