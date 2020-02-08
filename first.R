#first file
library(VIM)
data(sleep)
str(sleep)
summary(sleep)
names(sleep)
is.na(sleep$Dream)
sum(is.na(sleep$Dream))
colSums(is.na(sleep))
rowSums(is.na(sleep))
complete.cases(sleep)
sleep[complete.cases(sleep),]

x2= c(5,5,NA,20)
is.na(x2)

x2[is.na(x2)] = mean (x2 , na.rm = T)
x2
