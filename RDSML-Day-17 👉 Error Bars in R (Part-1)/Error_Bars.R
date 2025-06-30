#BUIT in data working
tooth_data = ToothGrowth

#Now summarize the data to find out Mean and SD

#Creating a function for summarize the data
#Based on the grouping variables

data_summary = function (data, varname, groupnames)
{require(plyr)
  summary_func = function(x, col){
  c(mean = mean(x[[col]], na.rm = TRUE), sd = sd(x[[col]], na.rm = TRUE))
  }
  data_sum = ddply(data, groupnames, .fun = summary_func, varname)
  data_sum = rename(data_sum, c ('mean'= varname))
  return(data_sum)
}

#Now we can use the function to summarize the data

d_summary = data_summary(tooth_data, varname = 'len', groupnames = c('dose', 'supp'))

d_summary

