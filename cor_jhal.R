pacman::p_load(readxl, tidyverse, lme4, lmerTest, BSDA, kableExtra, car, agricolae, sjstats, jtools)
library(readxl)
data=read_excel("Data_chuijhal.xlsx", sheet = "data_mineral", range = "d3:o33") 
data
str(data)
head(data)
spice=data %>% select('Ca','Mg','Fe','Cu','Zn','Na','K','vit_c','ash')
spice

cor_matrix=cor(spice, use = "complete.obs", method = "pearson")
print("Correlation Matrix:")
print(cor_matrix)

# Visualize correlation matrix with corrplot

library(corrplot)
library(ggcorrplot)
corrplot(cor_matrix, method = "color", type = "upper", order = "hclust", addCoef.col = "black")

# Visualize correlation matrix with ggcorrplot
ggcorrplot(cor_matrix, hc.order = TRUE, type = "lower", lab = TRUE)

library(rcorr)
# Perform significance test
cor_test <- rcorr(as.matrix(spice))  
print("P-Values:")
print(cor_test$P)


ggsave('cor_jhal.png')


data=read_excel("Data_chuijhal.xlsx", sheet = "data_mineral", range = "d3:o33") 
data
install.packages("metan")
library(metan)
corrl=corr_coef(data[,-1:-3])
corrl
plot(corrl)
ggsave('corrl_jhal.png')
sink('corrl.text')
print(corrl)
