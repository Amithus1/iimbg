#financialdata----
library(quantmod)

#download stock prices
start <- as.Date("2019-10-01") ;end <- as.Date("2020-02-15")
getSymbols("SBIN.NS", src = "yahoo", from = start, to = end)
SBIN.NS
head(SBIN.NS)
tail(SBIN.NS)
plot(SBIN.NS[, "SBIN.NS.Close"], main = "SBIN.NS")
candleChart(SBIN.NS, up.col = "green", dn.col = "red", theme = "white")
?candleChart
#multiple stocks - prices from 
getSymbols(c("ICICIBANK.NS", "TATAMOTORS.NS", "RELIANCE.NS"), src = "yahoo", from = start, to = end)
tail(ICICIBANK.NS)
tail(TATAMOTORS.NS,n=2)
tail(RELIANCE.NS,n=2)
stocks = as.xts(data.frame(SBIN = SBIN.NS[, "SBIN.NS.Close"], ICICI = ICICIBANK.NS[, "ICICIBANK.NS.Close"], TATAMOTORS = TATAMOTORS.NS[, "TATAMOTORS.NS.Close"]))
head(stocks)
plot(as.zoo(stocks), screens = 1, lty = 1:3, xlab = "Date", ylab = "Price")
legend("right", c("SBIN", "ICICI", "TATATMOTORS"), lty = 1:3, cex = 0.5)

rowSums(is.na(stocks))
stocks[1:20]
