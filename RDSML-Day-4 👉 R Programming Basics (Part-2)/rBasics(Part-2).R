#Data types in R
#1. Numeric-Integer/Floating point 
#2.String- Character ("Hello World")
#3. Logical- True/False

a= 11
b= 11.5
#To know the data types
class(a)
class(b)

name= 'NOMAN'
class(name)
#to see the value in the vector
print(name)

c= '52'
# If we put a value in the inverted comma it will be treated as a string (Character)
print(c+9)
print(a+9)

#logical data types: TRUE, FALSE (T,F)
class(a>b)
class(a<b)
x=19
y=22-3
print(x==y)
print(x!=y)

print(y>x)
print(y>=x)


#Logical operators in R (when compare true event with true event)
# && logical operator
4==4 && 5==5
# || logical operator (or)
x!=y || x==y

#simple mathematical operators in R
z=6+9-8*(2/3)
print(z)

w=4+3-3*2/3
w=4+3-3*(2/3)
print(w)

d=4^2
print(d)

#Modular operators
10/5
10%/%5
10%%5
11/5
#11%/%5 for rounding the value
