#mtcars : proportion of am to be maintained
#train_MTC - 70%
#test_MTC - 30%

data=mtcars

library(caTools)
set.seed(34)
split = sample.split(data$am, SplitRatio = 0.7)
prop.table(table(split))
train_MTC = subset(data, split == TRUE)
test_MTC = subset(data, split == FALSE)


dim(data) ; dim(training_set) ; dim(test_set)

names(data)
prop.table(table(train_MTC$am))
prop.table(table(test_MTC$am))
?mtcars

#another method

?sample.split

intrain <- createDataPartition(y = factor(mtcars&am), p = 0.7 , list = F)
mtcars[-intrain]




#simplest method

s1 <- sample(1:row(mtcars) , size = 0.7 * nrow(mtcars))
mtT1 <- mtcars[s1,]
mtT2 <- mtcars[-s1,]


#4th method

library(dplyr)
mtcars %>% sample_n(22)
mtcars %>% sample_frac(0.7)


#model
names(data)
logitmodel1 = glm(am ~  hp +  wt  , family = binomial,  data = train_MTC)
summary(logitmodel1)

head(test_MTC)
prob_pred = predict(logitmodel1, type = 'response', newdata = test_MTC)
summary(prob_pred)
head(cbind(test_set,prob_pred ),10)

#if prob > 0.5 make it 1, else 0
y_pred = ifelse(prob_pred > 0.5, 1, 0)
head(cbind(test_set$purchased, y_pred),100)

# Making the Confusion Matrix
cm = table(test_set[,5], y_pred)
cm
library(caret)
caret::confusionMatrix(cm)
