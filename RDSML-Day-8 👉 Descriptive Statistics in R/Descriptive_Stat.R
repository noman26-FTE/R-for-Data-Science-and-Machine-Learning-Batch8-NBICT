#Descriptive statistics using the psych package
library(psych)
data
AirPassengers
BOD
cars

#packages THAT HELP TO FIND DATASET

install.packages("nycflights13")
attach(nycflights13::flights)

#Lets look at the first 6 rows of the data set

head(nycflights13::flights)
summary(distance)
sd(distance)
describe(distance)

#To see 3 or more variable descriptive statistics

demo=cbind(distance, dep_delay, arr_delay) 
describe(demo)

