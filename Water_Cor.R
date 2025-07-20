library(readxl)
library(ggplot2)
library(readxl)
dw = read_excel("data MoST 24-25.xlsx", sheet = "Sheet4", range = "B1:T87")
View(dw)

head(dw)

install.packages("metan")
library(metan)
# remove first sample column
daw = dw[, -19]
View(daw)
corrl= corr_coef(daw)

# Plot the correlation matrix
library(corrplot)
plot(corrl)
# Save the correlation matrix
png("correlation_matrix.png", width = 800, height = 600)

