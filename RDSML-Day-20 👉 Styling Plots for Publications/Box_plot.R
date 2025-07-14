#Box plot help us to understand the data
#Load the data set for box plot
myData= ToothGrowth
myData

# Convert the 'dose' variable to a factor for better visualization
myData$dose=as.factor(myData$dose)
class(myData$dose)

# Load the ggplot2 package for visualization
library(ggplot2)

# Create a box plot using ggplot2
ggplot(myData, aes(x=dose, y=len)) +
  geom_boxplot()

#Q1, Q2, AND Q3 FOR BOX PLOT
#Q3-Q1= Inter quartile range (IQR)

#Rotate the box plot for better visibility
ggplot(myData, aes(x=dose, y=len)) +
  geom_boxplot() +
  coord_flip()

#Notch box plot
ggplot(myData, aes(x=dose, y=len)) +
  geom_boxplot(notch=TRUE)

#Highlight the outlier
ggplot(myData, aes(x=dose, y=len)) +
  geom_boxplot(outlier.colour="red", outlier.size=3, outlier.shape=8)

#Choosing which item/ only one item to display

ggplot(myData, aes(x=dose, y=len)) +
  geom_boxplot(outlier.colour="red", outlier.size=3, outlier.shape=8)+
  scale_x_discrete(limits = c('0.5'))


#Changing box plot line colors by groups
ggplot(myData, aes(x=dose, y=len, color= dose)) +
  geom_boxplot()

#Changing the item order in the box plot

ggplot(myData, aes(x=dose, y=len, color= dose)) +
  geom_boxplot() +
  scale_x_discrete(limits = c('2', '0.5', '1'))

#Box plot with multiple groups
ggplot(myData, aes(x=dose, y=len, fill = supp)) +
  geom_boxplot()

#Changing the position of box plots

ggplot(myData, aes(x=dose, y=len, fill = supp)) +
  geom_boxplot(position = position_dodge(1))

#Box plot with multiple groups and colors
ggplot(myData, aes(x=dose, y=len, fill = supp)) +
  geom_boxplot(position = position_dodge(1)) +
  scale_fill_manual(values = c("orange", "lightblue"))+
  theme_classic()

#removing the outliers

ggplot(myData, aes(x=dose, y=len, fill = supp)) +
  geom_boxplot(outlier.shape = NA) +
  scale_fill_manual(values = c("orange", "lightblue")) +
  theme_classic()

#Save as publication quality

ggsave("Box_plot.png", width = 8, height = 6, dpi = 300)

# Loading data set

library(readr)
Book1 <- read_csv("Book1.csv")
View(Book1)
View(Book1)

# Load required package
library(ggplot2)

# Create the dataset
data <- data.frame(
  Time = rep(seq(0, 3.5, by = 0.5), 3),
  Force = c(
    50, 150, 300, 500, 600, 0, 0, 0,        # Nutrinos
    60, 850, 30, 20, 10, 0, 0, 0,           # Safari
    55, 450, 600, 900, 900, 900, 0, 0       # Cerea
  ),
  Sample = rep(c("Nutrinos", "Safari", "Cerea"), each = 8)
)
library(ggplot2)
install.packages("ggthemes")
library(ggthemes)
install.packages("viridis")
library(viridis)
# Plot using ggplot2
n= ggplot(data, aes(x = Time, y = Force, color = Sample)) +
  geom_line(size = 0.5) +
  geom_point(size = 2) +
  scale_color_viridis_d(name='Cookies') +
  labs(
    title = "Hardness Test of Cookies",
    x = "Time (Seconds)",
    y = "Force (g)",
    color = "Sample"
  ) +
  theme_classic(base_size = 14, base_family = "serif")+ 
  theme(plot.title= element_text(face='bold', size = 16, hjust= 0.5), 
        axis.title= element_text(face='bold', size=14, hjust=0.5),
        axis.text= element_text(size= 12),
        legend.position = "right", 
        legend.title= element_text(face='bold'), legend.text= element_text(size=12))
# Save the plot
ggsave("Three_Point_Bend_Test.png", n, width = 6, height = 4, dpi = 300)
