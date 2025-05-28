# Descriptive statistics using the psych package

install.packages("psych")
library(psych)

data()
AirPassengers
BOD

# Using the New York airport flight data
install.packages("nycflights13")
attach(nycflights13::flights)

 # Lets look at the first 6 records using the head() function
head(nycflights13::flights)
distance
summary(distance)
describe(distance)

#Cfind uses to describe the data of several variables

demo = cbind(arr_delay, dep_delay, distance)
describe(demo)

#Introducing the call names function to rename the columns name clearly

colnames(demo)= c('Arrival dealy', 'Departure delay', 'Distance travelled')
describe(demo)

#plot for the descriptive statistics through hist function
dep_delay
hist(dep_delay)

#How to group descriptive statistics
head(nycflights13::flights)
summary(carrier)
carrierFact= factor(carrier)
summary(carrierFact)


describeBy(distance, group = carrier)


# Two levels of aggregation 

aggregate(distance, by = list(carrier, month), FUN = mean, na.rm = TRUE)
aggregate(distance, by = list(carrier, month), FUN = sd, na.rm = TRUE)

#na.rm= TRUE is used to remove the NA values from the data