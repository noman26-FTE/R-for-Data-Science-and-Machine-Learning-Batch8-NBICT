library(ggplot2)
dataset= mtcars
#converting numeric cyl column to a factor variable
dataset$cyl= as.factor(dataset$cyl)

#Adding regression lines based on multiple groups
ggplot(dataset, aes(x=wt, y=mpg, color=cyl, shape= cyl,))+
  geom_point()+
  geom_smooth(method=lm, se=F)

#Extending THE REGRESSION LINES TO THE EDGES OF THE PLOT
ggplot(dataset, aes(x=wt, y=mpg, color=cyl, shape= cyl,))+
  geom_point()+
  geom_smooth(method=lm, se=F, fullrange=TRUE)

#Filling the color of the confidence interval

ggplot(dataset, aes(x=wt, y=mpg, color=cyl, shape= cyl,))+
  geom_point()+
  geom_smooth(method=lm, aes (fill=cyl))

#Changing point shapes manually
ggplot(dataset, aes(x=wt, y=mpg, color=cyl, shape= cyl))+
  geom_point()+
  geom_smooth(method=lm, se=F, fullrange=TRUE)+
  scale_shape_manual(values=c(3,16,17))

#changing the theme position
ggplot(dataset, aes(x=wt, y=mpg, color=cyl, shape= cyl))+
  geom_point()+
  geom_smooth(method=lm, se=F, fullrange=TRUE)+
  scale_shape_manual(values=c(3,16,17))+
  theme(legend.position='top')

#Changing point colors manually

ggplot(dataset, aes(x=wt, y=mpg, color=cyl, shape= cyl))+
  geom_point()+
  geom_smooth(method=lm, se=F, fullrange=TRUE)+
  scale_shape_manual(values=c(3,16,17))+
  scale_color_manual(values=c('brown', 'black', 'tan'))+
  theme(legend.position='top')

#Customizing scatter plots
ggplot(dataset, aes(x=wt, y=mpg, color=cyl, shape= cyl))+
  geom_point(size=3, alpha=0.7)+
  geom_smooth(method=lm, se=F, fullrange=TRUE)+
  scale_shape_manual(values=c(3,16,17))+
  scale_color_manual(values=c('brown', 'black', 'tan'))+
  theme(legend.position='top')+
  labs(title='Miles per Gallon \nAccording to Weight',
       x='Weight',
       y='Miles per Gallon')+
  theme_minimal()

#Customizing themes
plot=ggplot(dataset, aes(x=wt, y=mpg, color=cyl, shape= cyl))+
  geom_point(size=3, alpha=0.7)+
  geom_smooth(method=lm, se=F, fullrange=TRUE)+
  scale_shape_manual(values=c(3,16,17))+
  scale_color_manual(values=c('brown', 'black', 'tan'))+
  theme(legend.position='top')+
  labs(title='Scatter Plot of MPG vs Weight',
       x='Weight (1000 lbs)',
       y='Miles per Gallon (MPG)')+
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 15),
        axis.title.x = element_text(face = "italic", size = 10),
        axis.title.y = element_text(face = "italic", size = 10))

# Display the plot
print(plot)

plot+ theme_classic()
plot+ theme_minimal()
