#central limit THEORUM

# The Central Limit Theorem states that the sampling distribution of the sample mean will be normally distributed, regardless of the shape of the population distribution, provided that the sample size is sufficiently large (usually n > 30).

#CLT IS THE FOUNDATION OF INFEREENTIAL STATISTICS

#Uniform distribution means every value in the range has an equal probability of occurring.

#Normal distribution also known as gaussian distribution

#Demonstration of CLT

#Generating 10000 numbers of uniform distribution

r = runif(10000)
hist(r)
meanr = mean(r)
sdr = sd(r)

#Draw three random samples from the distribution

samples1 = sample(r, 4)
samples2 = sample(r, 4)
samples3 = sample(r, 4)
#Calculate the means of the samples
mean(samples1)
mean(samples2)
mean(samples3)

#Run a for loop to calculate the means of 1000 samples of size 4

cl4 = mean(sample(r, 4))
for (i in 1:1000) {
  cl4 = c(cl4, mean(sample(r, 4)))}

hist(cl4)

cl10 = mean(sample(r, 10))
for (i in 1:1000) {
  cl10 = c(cl10, mean(sample(r, 4)))}

hist(cl10)

cl100 = mean(sample(r, 100))
for (i in 1:1000) {
  cl100 = c(cl100, mean(sample(r, 4)))}

hist(cl100)