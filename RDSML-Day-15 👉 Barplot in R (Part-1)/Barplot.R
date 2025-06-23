#creating a data frame for the barplot

dataset= data.frame(dose= c('D0.5','D1', 'D2'), 
                    len= c(4.2,10,29.5))

library(ggplot2)

#creating the barplot

ggplot(data=dataset, aes(x=dose, y=len))+
  geom_bar(stat='identity')


#Horizontal Bar plot

ggplot(data=dataset, aes(x=dose, y=len))+
  geom_bar(stat='identity')+
  coord_flip()

#Thin Bars, reducing width of Bars
ggplot(data=dataset, aes(x=dose, y=len))+
  geom_bar(stat='identity', width=0.5) 

#Adding color to the bars

ggplot(data=dataset, aes(x=dose, y=len))+
  geom_bar(stat='identity', width=0.5, fill='blue', color='black')

#Minimal theme with blue fill and black border

ggplot(data=dataset, aes(x=dose, y=len))+
  geom_bar(stat='identity', fill='steelblue')+
  theme_minimal()

#Adding labels to the outside of bars

ggplot(data=dataset, aes(x=dose, y=len))+
  geom_bar(stat='identity', fill='steelblue')+
  geom_text(aes(label=len), vjust=-0.5, size=3, color='#9F9F9F')+
  theme_minimal()

#Adding labels to the INside of bars

ggplot(data=dataset, aes(x=dose, y=len))+
  geom_bar(stat='identity', fill='steelblue')+
  geom_text(aes(label=len), vjust=1.6, size=3, color='white')+
  theme_minimal()

#Using mtcars dataset for barplot
myCarData= mtcars

#Creating Bar plot of count
#To make a bar plot of counts, will use mtcars of data set

ggplot(data=myCarData, aes(x=factor(cyl)))+
  geom_bar(stat='count', width=0.5, fill='steelblue', color='black')+
  theme_minimal()

#Adding labels to the bar plot of counts
ggplot(data=myCarData, aes(x=factor(cyl)))+
  geom_bar(stat='count', width=0.5, fill='steelblue', color='black')+
  geom_text(stat='count', aes(label=..count..), vjust=-0.5, size=3, color='#9F9F9F')+
  theme_minimal()

#Adding labels to the bar plot of counts inside the bars
ggplot(data=myCarData, aes(x=factor(cyl)))+
  geom_bar(stat='count', width=0.5, fill='steelblue', color='black')+
  geom_text(stat='count', aes(label=..count..), vjust=1.6, size=3, color='white')+
  theme_minimal()

#Changing the x-axis label
ggplot(data=myCarData, aes(x=factor(cyl)))+
  geom_bar(stat='count', width=0.5, fill='steelblue', color='black')+
  geom_text(stat='count', aes(label=..count..), vjust=-0.5, size=3, color='#9F9F9F')+
  labs(x='Number of Cylinders')+
  theme_minimal()
#Changing the y-axis label
ggplot(data=myCarData, aes(x=factor(cyl)))+
  geom_bar(stat='count', width=0.5, fill='steelblue', color='black')+
  geom_text(stat='count', aes(label=..count..), vjust=-0.5, size=3, color='#9F9F9F')+
  labs(x='Number of Cylinders', y='No. of Cars')+
  theme_minimal()

#Changing the title of the plot
ggplot(data=myCarData, aes(x=factor(cyl)))+
  geom_bar(stat='count', width=0.5, fill='steelblue', color='black')+
  geom_text(stat='count', aes(label=..count..), vjust=-0.5, size=3, color='#9F9F9F')+
  labs(x='Number of Cylinders', y='No. of Cars', title='Bar Plot of Number of Cars Based on Cylinders Type')+
  theme_minimal()


