dbinom(x=4, size=10, prob=0.5)
pbinom(q=4, size=10, prob=0.5)

n = c(0:10)

p = dbinom(x= n, size = 10, prob = 0.5)
barplot(p)

library(visualize)

visualize.binom(stat = 4, size = 10, prob = 0.5, section = 'lower')

pbinom(q = 4, size = 10, prob = 0.5)

visualize.binom(stat = 4, size = 10, prob = 0.5, section = 'upper')

visualize.binom(stat = c(4,6), size = 10, prob = 0.5, section = 'bounded')

visualize.binom(stat = c(3,7), size = 10, prob = 0.5, section = 'tails')

visualize.binom(stat = 4, size = 10, prob = 0.5)

#To know exact probability of 4, often uses grid lines

grid(nx= NULL, ny= NULL, col = 'grey', lty = 'dotted')

