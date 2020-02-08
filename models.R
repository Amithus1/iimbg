#linear regression

women
head(women)

plot(women)
cor(women) #correlation
cov(women$height,women$weight)   
cor(women$height,women$weight)


model = lm(weight ~ height, data = women)
model
summary(model)
# y = mx +c = B0 + B1 *x

range(women$height)
# predict only in range of the data
#rsquare coefficient of determination
# more features are added only if variance is added beacuase of it
residuals(model)
#checking for assumptions in linear regression through graphs

plot(model)
#cooks distance s used to find the infuential outliers

predict(model,new = data.frame(height = 77))
 # find linear cor and cov
#to model to exist f stat
#single = multiple r2 , multiple adjusted r2

#mtcars

head(mtcars)

model2 = lm(mpg ~wt + hp + qsec , dat = mtcars)        
summary(model2)

model3 = lm(mpg ~ wt , data = mtcars)
summary(model3)

library (olsrr)

fit = lm(mpg ~ disp + hp +wt + qsec , data = mtcars)

k = ols_step_all_possible(fit)
plot(k)

# load the data
#find out correlation and missing value
#form linear model
#chck for model summary (f stat , r-square,coefficient p value)
#check for assumption
#predict and find accuracy

