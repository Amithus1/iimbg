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
