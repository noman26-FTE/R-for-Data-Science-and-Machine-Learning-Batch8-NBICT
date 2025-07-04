#BUIT in data working
tooth_data = ToothGrowth
tooth_data
#Now summarize the data to find out Mean and SD

#Creating a function for summarize the data
#Based on the grouping variables

data_summary = function (data, varname, groupnames) {require(plyr)
  summary_func = function(x, col){
    c(mean = mean(x[[col]], na.rm = TRUE), sd = sd(x[[col]], na.rm = TRUE))
  }
  all_summary = ddply(data, groupnames, .fun = summary_func, varname)
  data_sum = rename(all_summary, c ('mean'= varname))
  return(data_sum)
}

#Now we can use the function to summarize the data

d_summary = data_summary(tooth_data, varname = 'len', groupnames = c('dose', 'supp'))

d_summary

#Converting dose to a factor variable

d_summary$dose = as.factor(d_summary$dose)
class(d_summary$dose)

#Now we can plot the data with error bars
library(ggplot2)
ggplot(d_summary, aes(x= dose, y = len, fill = supp))+
  geom_bar(stat = 'identity', position = position_dodge())+
  scale_fill_manual(values = c('orange', 'lightblue'))+
  geom_errorbar(aes(ymin= len-sd, ymax= len+sd), width =0.2, position = position_dodge(.9))+
  theme_minimal()
