#create data which belongs to standard normal distribution where mean=0 and standard deviation=1


#rnorm means random normal distribution

x = rnorm(10000, mean = 0, sd = 1)
mean(x)
sd(x)

y = rnorm(100, mean = 100, sd = 3)
mean(y)
sd(y)

#pnorm means cumulative distribution function
#at z = 0, then the value of probability is 0.5
#through pnorm we can find the probability of z value

pnorm(0)
pnorm(-1.96)
pnorm(-1.64)
pnorm(1.96)

#qnorm means quantile function, take pnorm value to find z value

qnorm(0.5)
qnorm(0.025)

#dnorm means density function, it gives the height of the curve at a given z value
#y axis value when z = 0
dnorm(0)

#lets use dnorm the normal distribution curve

zvalues = seq(-4.0, 4.0, by = 0.1)

dvalues = dnorm(zvalues)
plot(zvalues, dvalues)
