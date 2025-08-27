#Two sample z test need to know population standard deviation

#Null hypothesis: mean1 and mean2 is equal
#Alternative hypothesis: mean1 and mean2 is not equal

#Condition: population sd is known
#Condition: sample size is large (n1>30, n2>30)
#Condition: random sampling

#Difference with two sample t test: sample standard deviation will be known

#Import library
library(BSDA)

#Importing the dataset
dataset = read.csv('Perfume_Two_Sample.csv')
View(dataset)

#Machine 1 SD

MACHINE1SD = sd(dataset$Machine.1)
MACHINE2SD = sd(dataset$Machine.2)


#Running the z test
z.test(x = dataset$Machine.1, 
       y = dataset$Machine.2, 
       sigma.x = MACHINE1SD, 
       sigma.y = MACHINE2SD)

#P value is less than 0.05 reject null hypothesis

#Interpret the result z test result: There is no significant difference between the production size between two machines

