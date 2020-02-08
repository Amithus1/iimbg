#vectors----

x = 1 #ctrl + enter

x

print(x)


x1 = 1:10 
x1

x2 <- 5
x2

x3 = c(1,5,100,7,9)
x3
class(x3)
class(x1)

x4 = rnorm(100,mean = 60,sd = 5) 
(x4 = rnorm(100,mean = 60,sd = 5) ) #creating and printing
plot(density(x4))
hist(x4)
plot(x4)

print(x4[seq(1,100,2)])

hist(x4,breaks=7)

hist(x4,breaks=c(10,40,80,100))

x5 = rnorm(10000,mean=60,sd=5)
plot(density(x5))


#matrices

(data=round(rnorm(24,mean = 40,sd = 3)))
(trunc(34.6))
(floor(c(15.4,15.7,-15.4)))
(ceiling(c(15.4,15.7,-15.4)))
(round(c(15.4,15.7,-15.4)))

data
(m1 = matrix(data,nrow=4))
(m2 = matrix(data,nrow=4,byrow = T))

colSums(m1)
rowSums(m1)
colMeans(m1)
rowMeans(m2)
m1[,c(1,4)]
m1[c(3,2),c(1,4)]



#DF

mtcars
str(mtcars)
summary(mtcars)
df = mtcars
names(df)
?mtcars
df$cyl = factor(df$cyl)
str(df)
df[,c('cyl','vs','am','gear','carb')]
df[,c('cyl','vs','am','gear','carb')] = lapply(df[,c('cyl','vs','am','gear','carb')],factor)
str(df)
summary(df)
table(df$cyl)
barplot(table(df$cyl),col = 1:3)
barplot(table(df$gear),col = 1:3)
pie(table(df$gear),col = 1:3)
table(df$gear,df$am, dnn=c('gear','am'))

table(df$gear,df$am,df$cyl, dnn=c('gear','am','cyl'))


?aggregate()

aggregate(cbind(mpg,wt) ~ cyl,data=df,mean)
aggregate(cbind(mpg,wt) ~  cyl+gear,data=df,mean)
 # mean mpg & wt for each gear and cyl type



# factors

#without order

(gender = sample (c('M',"F"), size=100,replace = T))

table(gender)

#repeat pattern

set.seed(1234)

(gender = sample (c('M',"F"), size=100,replace = T))

table(gender)

#set some percent


set.seed(1234)

(gender = sample (c('M',"F"), size=100,replace = T,prob = c(.7,.3)))

table(gender)

#1 lakh value

set.seed(1234)

(gender = sample (c('M',"F"), size=100000,replace = T,prob = c(.7,.3)))

table(gender)
prop.table(table(gender))
barplot(table(gender))
pie(table(gender))

#grades of student A,B,C,D

set.seed(1234)

(grades = sample (c('A','B','C','D'), size=100000,replace = T,prob = c(.4,.3,.2,.1)))

table(grades)
prop.table(table(grades))
barplot(table(grades))
pie(table(grades))

#not alphabetically

set.seed(1234)

(grades = sample (c('E','G','S','D'), size=100000,replace = T,prob = c(.4,.3,.2,.1)))

table(grades)
prop.table(table(grades))
barplot(table(grades))
pie(table(grades))

grades2 = factor(grades, ordered = T,levels = c('E','G','S','P'))
barplot(table(grades2))


#dplyr----

library(dplyr)

df
#find mean mpg & wt wrt to each gear & cyl type

df %>% group_by(cyl,gear) %>% summarise(meanwt =mean(wt,na.rm=T),meanMPG = mean(mpg, na.rm=T),maxhp = max(hp),min(wt),max(wt),n())

df %>% filter(mpg>25)

(df %>% filter(mpg>25) & gear %in% c(4))
