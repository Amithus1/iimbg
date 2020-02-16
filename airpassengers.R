AirPassengers
?AirPassengers
JohnsonJohnson
?JohnsonJohnson
summary(AirPassengers)
cycle(AirPassengers)
plot(AirPassengers)
decompose(AirPassengers)
plot(decompose(AirPassengers))     
monthplot(AirPassengers)
abline(h=250)
plot(decompose(JohnsonJohnson))




(data = trunc(rnorm(365,mean = 60,sd =  10)))
yearly = ts(data , start = (1000) , freq = 1)
yearly
plot(yearly)



(data = trunc(rnorm(365,mean = 60,sd =  10)))
monthly = ts(data , start = (2000) , freq = 12)
monthly
plot(monthly)


(data = trunc(rnorm(365,mean = 60,sd =  10)))
quaterly = ts(data , start = (1000) , freq = 4)
quaterly
plot(quaterly)


(data = trunc(rnorm(365,mean = 60,sd =  10)))
daily= ts(data , start = (2000) , freq = 365)
daily
plot(daily)


#create time series series from apr 2010 to sep 2015 
(data = trunc(rnorm(365,mean = 60,sd =  10)))
monthly = ts(data , start = c(2010,4),end=c(2015,9) , freq = 12)
monthly
plot(monthly)
monthplot(monthly)




tsdata = ts(data = sample(100:150),start = c(2019,1),end = c(2020,4) , frequency = 12)

daily<- ts(data = sample(100:150),start = c(2019,1,1),end = c(2020,3,31) , frequency = 365)
plot(daily)
cycle(daily)
monthplot(daily)
