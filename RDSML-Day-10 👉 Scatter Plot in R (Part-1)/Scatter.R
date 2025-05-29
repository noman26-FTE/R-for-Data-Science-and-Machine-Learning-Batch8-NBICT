#install.packages('gggplot2')
library(ggplot2)

# Create a scatter plot with ggplot2
dataset=mtcars
dataset

#to see the relationship between two variable then scatter plot is good for visualization

#Generating a basic scatter plot

#independent x axis and dependent y axis

ggplot(dataset, aes(x= wt, y= mpg))+
         geom_point()

#Adding things to the scatter plot for final publication
#size and shape of dots
ggplot(dataset, aes(x= wt, y= mpg))+
  geom_point(size=1, shape=18)

#Adding the regression line

ggplot(dataset, aes(x= wt, y= mpg))+
  geom_point(size=1, shape=18)+
  geom_smooth(method = "lm", se = F, color = "red") 

