# Dates in R


Sys.timezone()## [1] "Asia/Calcutta"
Sys.Date() ## [1] "2019-xx-xx"
Sys.time() ## [1] "20xx-xx-xx xx:xx:x IST"

#Date Classess

#Date- This is the class to use if you have only dates, but no times, in your data.
Sys.Date()  #todays Date

dt1 <- as.Date("2019-07-07")
dt1

#different format of date : Course start
dt2 <- as.Date("02/16/2020", format = "%m/%d/%Y")
dt2

dt3 <- as.Date("February 16, 2020", format = "%B %d, %Y")
dt3


#see list of format symbols:
`?`(strptime)

#calculations with dates:
dt1 ;dt2
#find the difference between dates:
dt2 - dt1
(dateregd = as.Date("Jul 24, 1995" , format = ('%b %d, %Y')))
Sys.Date() - dateregd
## in weeks
difftime(dt1, dt2, units = "weeks")

#Add or subtract days:
dt2

dt2 + 14
dt2 + 1:20
as.character(dateregd, format = '%A')
dt1 - 10

as.character(Sys.Date()+c(0,365,) ,format = '%A %B %d %Y')

as.character(Sys.Date()+ seq(0,199,2) ,format = '%A %B %d %Y') # 100 alternate dates from current dates
#how many dates july and august
dt4 <- Sys.Date() + seq (0,199,2)
table(as.character(dt4, '%b'))
month.abb[1:5]

#create a vector of dates and find the intervals between them:
three.dates <- as.Date(c("2019-10-15", "2019-12-22", "2020-01-15"))

three.dates

sales = trunc(rnorm(100 , mean = 60 ,sd=10))
diff(sales)
plot(diff(sales),type = 'b')

runif(100 , min = 50 , max = 100)
diff(three.dates)
diff(three.dates[c(1,3)])

#------
dt2
#create a sequence of dates:
six.weeks <- seq(dt2, length = 6, by = "week")  #diff of 1 week
six.weeks

six.weeks <- seq(dt2, length = 6, by = 14) #biweekly (14 days)
six.weeks

six.weeks <- seq(dt2, length = 6, by = "month") #biweekly (14 days)
six.weeks

#see the internal integer representation
unclass(dt2)
dt2 - as.Date("1970-01-01")
## Time difference of x days from Reference Date
# use a different origin, for instance imp
as.Date(1, origin = "2019-01-01")
dt2
as.Date(10, origin = "1970-01-01")  #10 days from origin

#Multiple Dates
x <- c("2015-07-01", "2015-08-01", "2015-09-01")
as.Date(x)

#Time----------------------
#POSIXct:If you have times in your data, this is usually the best class to use.

#create some POSIXct objects:
tm1 <- as.POSIXct("2019-12-22 10:10:00")
tm1

tm2 <- as.POSIXct("160220 11:20:00", format = "%d%m%y %H:%M:%S")
tm2

#specify the time zone:
tm3 <- as.POSIXct("2019-12-22 10:00:00", tz = "GMT")
tm3

#some calculatio with time 
tm2 ; tm1
tm2 >tm1

#add or subtract seconds

tm1 
tm1 + 30

tm1 - 30

#find diff in times

tm2 - tm1 #hours
difftime(tm2,tm1,units = 'hours')
tm3 - tm1 # diff in time zones

#see the internal integer representation:
tm1
unclass(dt2)  #date numeric
unclass(tm1)
difftime(tm1, as.POSIXct("2019-12-22 06:05:00"), units = "mins")
difftime(tm1, as.POSIXct("2019-12-22 06:05:00"), units = "hours")
#auto, secs, mins, hours, days, weeks

#C3: POSIXlt-----
#This class enables easy extraction of specific components of a time. (“ct” stand for calender time and “lt” stands for local time. “lt” also helps one remember that POXIXlt objects are lists.)

#create a time:
tm1.lt <- as.POSIXlt("2019-12-22 13:30:10")
tm1.lt

unclass(tm1.lt)  #see the parts/ attributes of TS object
unlist(tm1.lt)  #horizontally
tm1.lt;tm1
lapply(c(tm1.lt, tm1), FUN=unlist)
#extract componants of a time object:
tm1.lt$sec
tm1.lt$wday  #start on Sat

#truncate or round off the time:
trunc(tm1.lt, "days")  #remove time
