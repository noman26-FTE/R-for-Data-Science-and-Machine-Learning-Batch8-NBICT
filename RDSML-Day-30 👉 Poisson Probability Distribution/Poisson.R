#poisson distribution
#condition of Poisson distribution
#1. The number of events in a fixed interval of time or space is counted.
#2. The events occur with a known constant mean rate.
#3. The events occur independently of the time since the last event.
#4. The number of events in non-overlapping intervals is independent.
#5. The probability of more than one event occurring in an infinitesimally small time interval is negligible.

#e = eulers number= 2.718281828459045

#When to use Poisson distribution?
#1. When the events are rare (accidents, defects, arrivals) in a large population.
#2. When the events are independent of each other.
#3. When the events occur at a constant average rate.

#first part for 3 or less than 3
#second part for exact 3 calls

ppois(q = 3, lambda = 5)- ppois(q = 2, lambda = 5)

#q: quantile, lambda: average rate of occurrence  

dpois(x = 3, lambda = 5)

#x: number of events, lambda: average rate of occurrence
#dpois function used for calculating the probability of exactly x events occurring in a Poisson distribution with a given average rate (lambda).

n = seq (0,5)
barplot(dpois(n, lambda = 5))

library(visualize)

visualize.pois(stat = 8, lambda = 10, section = 'upper')
visualize.pois(stat = c(4,6), lambda = 10, section = 'bounded')
visualize.pois(stat = c(2,4), lambda = 5, section = 'bounded')
visualize.pois(stat = c(3,3), lambda = 7, section = 'bounded')
visualize.pois(stat = c(2,5), lambda = 8, section = 'tails')
