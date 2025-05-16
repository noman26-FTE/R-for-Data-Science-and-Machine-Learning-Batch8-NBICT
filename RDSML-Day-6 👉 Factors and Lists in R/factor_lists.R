#Factors in R

# summary of numeric items

participants_age = c(78, 25, 68, 45, 48, 36)
summary(participants_age)


# Finding summary of characters

profession = c("Doctor", "Teacher", "Teacher", "Businessman", "Teacher")
summary(profession)

# we need to convert vector character to factor to know the summary or data frequency

profession = factor(profession)
summary(profession)

#putting the summary in order

birth_month = c("jan", "dec", "apr", "aug", "jan", "mar", "jun", "apr", "jul", "aug", "sep", "apr", "oct", "jul", "sep")
summary(birth_month)
birth_month_fact =factor(birth_month)
summary(birth_month_fact)

birth_month_fact =factor(birth_month,
                         ordered = TRUE,
                         levels = c("jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"))

summary(birth_month_fact)

# Lists in R
# Lists are used to place number of items in a bundle

a = c(2, 4, 7)
b = c("Red", "Green", "Blue") #c() command is used for multiple vector items
c = "Welcome!"

my_list = list(a, b, c)

my_list

#Naming the list items

my_list = list(pieces = a, Colors = b, Message = c)
my_list

#Calling a specific data structure

my_list[1]
my_list[3]
my_list[2]
my_list["Colors"]
my_list$pieces
my_list$Message

#calling specific items from the data structure

my_list$Colors[1]
my_list$Colors[2]
my_list$Colors[3]