#Importin the dataset
dataset=read.csv('data.csv')
dataset

#Importing the ggplot2 library
library(ggplot2)

#Creating Basic Histogram

ggplot(dataset, aes(x=weight))+
  geom_histogram(color='white')

#Changing histogram plot line colors by groups

ggplot(dataset, aes(x=weight, fill= sex))+
  geom_histogram(color='white', alpha=1, position='identity')

#we can change the position adjustment to use for overlapping points on the layer

#Possible values for the argument position are: 'stack', 'dodge', 'fill', 'identity', and 'jitter'. Default value is 'stack

#Interleaved Histogram
ggplot(dataset, aes(x=weight, fill= sex))+
  geom_histogram(color='white', alpha=1, position='dodge')+ theme(legend.position = "top")

#Plyr package helped to have mean group wise
intall.packages("plyr")
library(plyr)

group_means= ddply(dataset, 'sex', summarise, grp.mean= mean(weight))
group_means

#Adding mean lines
myplot=ggplot(dataset, aes(x=weight, fill= sex))+
  geom_histogram(color='white', alpha=0.7, position='dodge')+ 
  geom_vline(data=group_means, aes(xintercept = grp.mean, color= sex), linetype='dashed')+
  theme(legend.position = "top")
  

myplot

#Using custom color pallets

myplot+ scale_color_manual(values= c('#999999', '#E69F00'))+ scale_fill_manual(values= c('#999999', '#E69F00'))
 

#Using custom color brewer color palletes

myplot+ scale_color_brewer(palette = 'Dark2' )+
  scale_fill_brewer(palette = 'Dark2')+ 

#Using a grey scale

myplot+ scale_color_grey() + scale_fill_grey()+ theme_classic()
