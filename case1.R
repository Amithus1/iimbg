#Case Study - Manufacturing Coy

library(gsheet)
url = "https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=216113907"
sales3 = as.data.frame(gsheet2tbl(url))
str(sales3)
head(sales3)
dim(sales3)
library(dplyr)
names(sales3)
#find out Loyal Customers, Customers who gave high revenue, High Revenue Part Nos, PartNos which give highest Margin; #top n=2 from each region- total revenue
#parts sold in East and china region

#question
#region with highest margin

#who are loyal customers ? (give me high revenue or high frequency)
sales3

sales3 %>% group_by(partnum) %>% summarise(MARGIN = sum(margin)) %>%  arrange(desc(MARGIN)) %>% head(5)
names(sales3)
sales3 %>% group_by(region) %>% summarise(MARGIN = sum(margin)) %>% arrange (desc(MARGIN)) # region wise sales

sales3 %>% group_by(region,partnum) %>% summarise(MARGIN = sum(margin)) %>% arrange (desc(MARGIN)) %>% top_n(2,MARGIN) #top 2 margin in each region wrt partnum

sales3 %>% group_by(region,partnum) %>% summarise(MARGIN = sum(margin)) %>% top_n(-2,MARGIN) #bottom 2 margin in each region wrt partnum
dim(sales3)

(regionSales <- sales3 %>% group_by(region) %>% summarise(MARGIN = sum(margin)) %>% arrange (desc(MARGIN)))

barplot(regionSales$MARGIN)


library(ggplot2)

ggplot(data = regionSales,aes(x=region,y=MARGIN))+geom_bar(stat='identity')

sales3 %>% group_by(custname) %>% summarise(REVENUE = sum(revenue,na.rm=T), COUNT=n())

sales3 %>% group_by(custname) %>% summarise(REVENUE = sum(revenue,na.rm=T), COUNT=n()) %>%