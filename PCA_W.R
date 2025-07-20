library(readxl)
data = read_excel("data MoST 24-25.xlsx",  sheet = "Sheet3", range = "A2:AA88")
View(data)
head(data)
# Remove the first column
newdata = data[,-1]
head(newdata)

#Scatter plot and correlation

library('GGally')
ggpairs(newdata)

#Principle component analysis

pc = prcomp(newdata, center = TRUE, scale = TRUE)
summary(pc)
 
attributes(pc)

print(pc)

var1 = round(pc$sdev[1]^2/sum(pc$sdev^2)*100,2)
var2 = round(pc$sdev[2]^2/sum(pc$sdev^2)*100,2)
var3 = round(pc$sdev[3]^2/sum(pc$sdev^2)*100,2)
var4 = round(pc$sdev[4]^2/sum(pc$sdev^2)*100,2)
var5 = round(pc$sdev[5]^2/sum(pc$sdev^2)*100,2)
var6 = round(pc$sdev[6]^2/sum(pc$sdev^2)*100,2)
var7 = round(pc$sdev[7]^2/sum(pc$sdev^2)*100,2)
var8 = round(pc$sdev[8]^2/sum(pc$sdev^2)*100,2)
var9 = round(pc$sdev[9]^2/sum(pc$sdev^2)*100,2)
var10 = round(pc$sdev[10]^2/sum(pc$sdev^2)*100,2)
var11 = round(pc$sdev[11]^2/sum(pc$sdev^2)*100,2)
var12 = round(pc$sdev[12]^2/sum(pc$sdev^2)*100,2)



# Scree plot
plot(pc)

screeplot(x=pc, type = 'line', main = 'Scree Plot')
library('factoextra')
fviz_eig(pc, addlabels = TRUE, ylim = c(0, 30), 
         xlab = 'Dimensions', ylab = 'Percentage of Explained Variance',
         title = 'Scree Plot')

#PCA PLOT
#USING BIPLOT
biplot(pc, cex= 0.6, scale= 0) 
library('ggfortify')

autoplot(pc, data= data, color = 'Water_Source')

#data$Water_Source= factor(data$Water_Source)


autoplot(pc, data= data, color = 'Water_Source', 
         loadings= TRUE, loadings.colour= 'blue',
         loadings.label= TRUE,
         loadings.label.size=3)
#PCA PLOT USING FACTO EXTRA
library('factoextra')
library('viridis')
n = fviz_pca_var(pc,
             col.var= 'contrib',
             gradient.cols = c("orange", "lightgreen"),
             repel= TRUE,
             xlab = paste("Dim1(",var1,"%)", sep=""),
             ylab = paste("Dim2(",var2,"%)", sep=""),
             title = 'Principle Componenet Analysis (PCA)')+
#theme_classic(base_size = 14, base_family = "serif")+
  theme(plot.title= element_text(face='bold', size = 16, hjust= 0.5), 
        axis.title= element_text(face='bold', size=14, hjust=0.5),
        axis.text= element_text(size= 12),
        legend.position = "right", 
        legend.title= element_text(face='bold'), legend.text= element_text(size=12))
#Save the plot
ggsave('PCA_NEW.png', n, width=6, height=4, dpi=300)














