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





#Instructor repositior
# Importing the dataset
housetasks <- read.delim("housetasks.txt", row.names = 1)

# Contingency table can be visualized using the function 
# balloonplot(). This function draws a graphical matrix where
# each cell contains a dot whose size reflects the relative
# magnitude of the corresponding component.

install.packages("gplots")
library("gplots")
dt <- as.table(as.matrix(housetasks))
balloonplot(t(dt), main = "Housetasks Visualization", 
            label = F, show.margins = F, 
            xlab = "", ylab = "")

# It's also possible to visualize a contingency table
# as a mosaic plot. This can be done using the function
# mosaicplot() from the built-in R package graphics.

library("graphics")
mosaicplot(dt, shade = T, las = 2,
           main = "Housetasks")

# Blue color indicates that the observed value is higher
# than the expected value. Red color indicates that the
# observed value is lower than the expected value.

# Computing chi-square test in R
chisq <- chisq.test(housetasks)
chisq

# Observed counts
chisq$observed

# Expected counts
round(chisq$expected,2)

# RAW Residuals calculation
chisq$observed - round(chisq$expected,2)

# Standardized (Pearson) residuals calculation
#Residuals means the difference between observed and expected values.

round(chisq$residuals, 3)

# Adjusted Standardized Residuals calculation (Not necessary for all cases)
chisq$stdres

# Visualize Pearson residuals using the package corrplot
install.packages("corrplot")
library(corrplot)
corrplot(chisq$residuals, is.cor = FALSE)

#Is.cor true when ranges -1 to 1 and false when ranges actual values

# Contribution in percentage (%) means the contribution of each cell to the total Chi-square score. 
contrib <- 100 * (chisq$residuals)^2 / chisq$statistic
round(contrib, 3)

# Visualize the contribution
corrplot(contrib, is.cor = FALSE)


#Explanation of the whole chi square test of independence process is in the comments.

#Excellent — you have the classic “Household Tasks” dataset showing how domestic work is distributed among partners, and a mosaic plot visualizing the same. Let’s interpret the mosaic plot in depth.

# 🔹 1. Understanding What the Mosaic Plot Shows
# A mosaic plot visualizes the relationship between two categorical variables.
# Here:
#   Columns (X-axis) = different household tasks
# 
# 
# Rows (Y-axis) = who performs the task (Wife, Alternating, Husband, Jointly)
# 
# 
# Each rectangle’s area corresponds to the frequency in the contingency table (number of couples reporting that category combination).
# The colors show standardized residuals from a chi-square test of independence — i.e., how much the observed count differs from what would be expected if there were no relationship between task and performer.
# 
# 🔹 2. Color Interpretation (Standardized Residuals)
# The color legend at the right helps interpret associations:
#   Color
# Residual Range
# Interpretation
# Dark Blue (> +4)
# Much higher than expected
# Overrepresented category
# Light Blue (2–4)
# Somewhat higher than expected
# Slightly overrepresented
# White (–2 to +2)
# Near expected
# No strong relationship
# Pink (–2 to –4)
# Somewhat lower than expected
# Slightly underrepresented
# Red (< –4)
# Much lower than expected
# Strongly underrepresented

# So:Blue areas = “more common than expected”

# Red areas = “less common than expected”
 
# 🔹 3. Observing Key Patterns
# 🧺 Wife-Dominated Tasks
# Laundry, Main meal, Dinner, Breakfast, and Tidying are dark blue for “Wife”.

# This means wives perform these tasks much more often than expected under independence.

# The corresponding cells for “Husband” or “Alternating” in these tasks are red, indicating these groups do these tasks less often than expected.

# Interpretation: Traditional gender division — wives handle routine domestic and meal-related chores.
# 
# 👨 Husband-Dominated Tasks
# Repairs and Driving are deep blue for “Husband”.

# Corresponding wife and jointly categories are red.

# Interpretation: Husbands are strongly associated with “technical” or “outside” household tasks.
# 
# 👩‍❤️‍👨 Jointly-Done Tasks
# Finances, Insurance, and Holidays show dark blue under “Jointly”.
# 
# 
# “Wife” and “Husband” rows are red or white for these tasks.

# 
# Interpretation: Tasks related to financial decisions, insurance, and planning holidays are most often shared responsibilities.
# 
# 🔁 Alternating Tasks
# Official, Shopping, and sometimes Driving show moderate blue under “Alternating”.

# Suggests that these are tasks that partners take turns doing, with no strong gender skew.

# 🔹 4. Statistical Meaning
# The mosaic plot also represents results of a chi-square test of independence:
#   The color intensity reflects the standardized residuals used in the chi-square calculation.
# 
# 
# The fact that we see many dark blue and red blocks indicates a strong dependency between the two variables — i.e., who performs the task depends heavily on the type of task.
 
# 🔹 5. Summary of Findings
# Task Category
# Typical Performer
# Interpretation
# Laundry, Meals, Breakfast, Tidying
# Wife
# Traditional domestic chores
# Repairs, Driving
# Husband
# Manual/technical or outdoor chores
# Finances, Insurance, Holidays
# Jointly
# Shared household management
# Official, Shopping
# Alternating
# Flexible/shared responsibility
# 
# 
# 🔹 6. Big Picture Conclusion
# The mosaic plot visually confirms traditional gender divisions of household labor, with some modern flexibility:
#   Women dominate everyday domestic chores.
# 
# 
# Men dominate maintenance and car-related tasks.
# 
# 
# Some tasks (especially financial and planning ones) are now more collaborative or alternating.
# 
# 
# This type of plot is powerful because it shows both association strength (color) and proportion (size) simultaneously — revealing not only who does what, but how much more or less than expected they do so.
# 
# 
# [From the image above, it can be seen that the most contributing cells to the Chi-square are Wife/Laundry (7.74%), Wife/Main_meal (4.98%), Husband/Repairs (21.9%), Jointly/Holidays (12.44%).
#   
#   These cells contribute about 47.06% to the total Chi-square score and thus account for most of the difference between expected and observed values.
 
#   This confirms the earlier visual interpretation of the data. As stated earlier, visual interpretation may be complex when the contingency table is very large. In this case, the contribution of one cell to the total Chi-square score becomes a useful way of establishing the nature of dependency.]



rnorm(3, mean = 3.89, sd = 0.55)
