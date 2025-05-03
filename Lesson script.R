x+5



x+6
x=8
#x is defined as 5
x+6

#redefined value

x=3
x+6
# Able to replace the value without notification


#R is a case (capital/small) sensitive not space sensitive
X=8 #scaler/ vector with on value
x=10
x=X
X+x

#y is a vetor or variable or object

y=c(2,4,3,8,9,9,9,8,10,13,20,16,45)

#If we call y: Type y and hit ctrl+enter

y

#add 2 each of the elements of y

y+2

#Descriptive stat of y

summary(y)

sort(y, decreasing=TRUE)

sort(y, increasing=FALSE)

length(y)

diffe(y)

mean(y)

hist(y)

boxplot(y, col="red", main='Fig. boxplot')

plot(density(y))

sd(y)
median(y)
mode(y)
?mode(y)



#Assignment operator"="

#+,-,*/....mathmetical operator
#==, logical operator
#modulus operator. %,%% (rmainder, qutotion)



a=3
b=5
a<b
b>a
b<a


5.12 < 5.2


#Dividend =Divisor*Quotient+Remainder

17%%4 #remainder
17%/%4 #quotient


#convert hour to min

#paste function (), can combine text and commands
#paste0= non space

75%/%60
75%/%60
paste0('75 minutes=', 75%/%60,'hour and',75%/%60,'minute.')

#list can contain diff. types of vectors

vector1=c('Raihan', 'Sumi', 'Ratul', 'Joba', 'Mridul')
vector1
#colon means range of data

vector2=c(1:5)

vector2

vector3=seq(1, 5, by=1)

vector3

vector4=seq(2,20,by=2)

vector4

vector5=seq(1,12,by=2)

vector5

#create data frame
names=data.frame(vector2,vector1)

names
names
#check structure= row, col, dimention, name
str(names)
nrow(names)
ncol(names)
dim(names)
names(names)


#see vector1 column

names$vector2
names$vector1

#data frame cant contain variables with different numbers
#however list can contain such different variables
different=list(vector3, vector4, vector5)
different

str(different)

#selecting the component of list
#[] for indexing

different[1]

different[2]

different[3]

#save the data set

write.csv(names,'name.csv')

#read the data set

read.csv('name.csv')





