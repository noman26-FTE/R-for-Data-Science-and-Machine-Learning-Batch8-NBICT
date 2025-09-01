#Two/independent sample t test basically compares the means of two independent groups in order to determine whether there is statistical evidence that the associated population means are significantly different.

#Null hypothesis (H0): μ1 = μ2 (The means of the two groups are equal)
#Alternative hypothesis (H1): μ1 ≠ μ2 (The means of the two groups are not equal)

#Paired sample t test is used when the samples are dependent, meaning that the observations in one sample are related to the observations in the other sample. This is often the case when the same subjects are measured before and after a treatment or intervention.

#Conditions to check before performing a two independent sample t test:
#1. Independence: The two samples must be independent of each other.
#2. Normality: The data in each group should be approximately normally distributed. This can be checked using visual methods (like Q-Q plots) or statistical tests (like the Shapiro-Wilk test).
#3. data should be continuous (interval/ratio).
#4. Variance Homogeneity: The variances of the two groups should be approximately equal. This can be checked using Levene's test or an F-test.

#checking the normality of the data
shapiro.test(scores$Male)
shapiro.test(scores$Female)

#Checking the variance homogeneity

var.test(x = scores$Male, y = scores$Female)

#Running the independent sample t test
t.test(x = scores$Male, y = scores$Female, var.equal = TRUE)

#Loading the data
scores <- read_csv("scores.csv")
View(scores)

#Visualize the male and female data through boxplot
library(ggplot2)

boxplot(scores$Male ~ scores$Female)

data <- read_excel("Scores.xlsx")
View(data)
str(data)
data$Gender <- as.factor(data$Gender)
str(data)

#Creating boxplot to visualize the data
library(ggplot2)
boxplot(data$Scores ~ data$Gender)

#Color change of boxplot
boxplot(data$Scores ~ data$Gender, col = c("orange", "blue"))

#Changing the position of box plots
boxplot( data$Scores ~ data$Gender, col = c("lightblue", "lightgreen"), horizontal = TRUE)

#Change the axis titles and main title of boxplot
library(ggplot2)
ggplot(data = data, aes(x= Gender, y=Scores, var.equal = TRUE))+
  geom_boxplot(fill = c("lightblue", "lightgreen"))+
  labs(title = "Boxplot for Obtained Scores",
    x = "Gender",
    y = "Scores")+
  theme_classic(base_size = 14, base_family = "serif")+ 
  theme(plot.title= element_text(face='bold', size = 16, hjust= 0.5), axis.title= element_text(face='bold', size=14, hjust=0.5),
        axis.text= element_text(size= 12),
        legend.position = "right", 
        legend.title= element_text(face='bold'), legend.text= element_text(size=12))

#Save the plot
ggsave("Boxplot for Obtained Scores.png", width = 8, height = 6)

t.test(data$Scores ~ data$Gender, var.equal = TRUE)
  
