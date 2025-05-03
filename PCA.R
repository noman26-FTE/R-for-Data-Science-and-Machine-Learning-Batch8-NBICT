library(readxl)

data=read_excel('Data_chuijhal.xlsx', sheet = 'pca_data', range = 'c3:s18')
data
library(ggplot2)
library(FactoMineR)
library(factoextra)
library(ggrepel)


PCA(data[c(2:17)], graph = FALSE)
mypca=PCA(data[c(2:17)], graph = FALSE)
print(mypca)
View(mypca)

chui_jhal=data$Plant_parts
chui_jhal

fviz_pca_biplot(mypca,geom="point",
                axes=c(1,2),
                col.var='blue',
                ggtheme=theme_minimal())+
  geom_text_repel(data=data.frame(mypca$ind$coord, chui_jhal),
                  aes(x=Dim.1, y=Dim.2, label=chui_jhal),
                  size=3, color='brown')

