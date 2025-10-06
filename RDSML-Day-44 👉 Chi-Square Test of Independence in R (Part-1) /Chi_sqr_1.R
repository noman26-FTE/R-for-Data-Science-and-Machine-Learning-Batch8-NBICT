#Importing the data set
housetasks = read.delim("housetasks.txt", row.names=1)
View(housetasks)

#What is the chi square test of independence?
#The chi square test of independence is a statistical test used to determine if there is a significant association between two categorical variables. It compares the observed frequencies in each category to the frequencies that would be expected if there were no association between the variables.

#Null hypothesis (H0): There is no association between the two categorical variables.
#Alternative hypothesis (H1): There is an association between the two categorical variables.

#Contingency table can be visualize using the function balloon plot from the ggplot2 package. This function draws a graphical matrix where the each cell contains a dot whose size reflects the relative magnitude of the corresponding cell frequency.

install.packages('gplots')
library(gplots)

dt = as.table(as.matrix(housetasks))

balloonplot(t(dt), main ="Housetasks Visualization", 
            label = F, 
            show.margins = F, 
            xlab = "",
            ylab = "")

#Its also possible to visualize a contingency table using the mosaic plot. The mosaic plot is a graphical representation of the data in a contingency table. It displays the proportions of each category in the table using rectangles, where the area of each rectangle is proportional to the frequency of the corresponding category.

library('graphics')

mosaicplot(dt, shade = T, las= 3, main="Housetasks")


            
#Blue color indicates that the observed value is greater than the expected value, while the red color indicates that the observed frequency is less than the expected frequency. The intensity of the color reflects the magnitude of the difference between the observed and expected frequencies.

#Computing the chi square test in R
chisq = chisq.test(dt)
chisq

#df = rows - 1 * columns - 1

#p-value < 0.05, we reject the null hypothesis and conclude that there is a significant association between the row and column variables.

#Examining the results
chisq$observed
round(chisq$expected,2)
chisq$residuals
chisq$stdres

#The standardized residuals can be used to identify which cells in the contingency table contribute the most to the overall chi square statistic. Cells with standardized residuals greater than 2 or less than -2 are considered to be significant contributors to the chi square statistic.

#Visualizing the standardized residuals
library('corrplot')
corrplot(chisq$stdres, is.corr=FALSE, tl.col="black")
