# to test normality of data and distribution of data, basically used histogram
#importing the data set
dataset= read.csv('data.csv')
dataset
library(ggplot2)

#Basic histogram using ggplot2
ggplot(dataset, aes(x= weight)) + 
  geom_histogram()

#Histogram with custom bin width
ggplot(dataset, aes(x= weight)) + 
  geom_histogram(binwidth= 1, color= 'black')

#Histogram with custom bin width and fill color

ggplot(dataset, aes(x= weight)) + 
  geom_histogram(binwidth= 1, color= 'black', fill= 'lightblue')

#Histogram basically used with continuous data, like weight, height 

#Bar graph used for discrete data, without fragmentation data like 1, 2, 10 etc.

#Adding the mean line in the histogram

myplot=ggplot(dataset, aes(x= weight)) + 
  geom_histogram(color= 'black', fill= "white")

myplot+ geom_vline(aes(xintercept= mean(weight)), color='blue', linetype='dashed', size= .5)

#Histogram with density plot

ggplot(dataset, aes(x= weight)) + 
  geom_histogram( aes(y=after_stat(density)),color= 'black', fill= 'white')+
  geom_density(fill='blue', alpha=0.3)

#Density plot mainly smooth plot of histogram, it is used to see the distribution of data

#Changing the line color and bar color

ggplot(dataset, aes(x= weight)) + 
  geom_histogram(binwidth= 1, color= 'darkblue', fill= 'lightblue')

