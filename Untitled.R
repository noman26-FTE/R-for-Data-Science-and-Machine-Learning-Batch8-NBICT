library(readxl)
data = read_excel("data MoST 24-25.xlsx",  sheet = "Sheet3", range = "A2:AA88")
View(data)
pcn= prcomp(data[-1],
           center = TRUE, 
           scale. = TRUE)
pcn$scale

print(pcn)
summary(pcn)
library('ggplot2')
library('devtools')
library('ggbiplot')
g = ggbiplot(pcn, 
             obs.scale = 1,
             var.scale = 1,
             groups = data$Water_Source,
             ellipse = TRUE,
             circle = TRUE,
             ellipse.prob = 0.68)
#g = g + scale_color_manual(values = c("#FF0000", "#00FF00", "#0000FF", "#FFFF00", "#FF00FF"))
#g= g + theme(legend.direction = 'horizontal',
             legend.position = 'top')
g = g + scale_colour_discrete(name = 'Water Source',
                              breaks = c("Groundwater", "Surface Water", "Rainwater Harvesting", "Desalination", "Other"),
                              labels = c("Groundwater", "Surface Water", "Rainwater Harvesting", "Desalination", "Other"))

print(g)

#removing overlaping in the plot
g = g + theme(legend.direction = 'horizontal',
              legend.position = 'top',
              panel.background = element_blank(),
              panel.grid.major = element_blank(),
              panel.grid.minor = element_blank(),
              axis.line = element_line(colour = "black"),
              axis.text.x = element_text(angle = 45, hjust = 1))
print(g)
