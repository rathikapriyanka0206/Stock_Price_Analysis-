install.packages("quantmod")
library("quantmod")


stock_dataset<-read.csv(file.choose())
stock_dataset$Date<-as.Date(stock_dataset$Date)

stock_xts <-xts(
  stock_dataset[, c("Open","High","Low","Close")],
  order.by = stock_dataset$Date
)
mytheme <-chartTheme("black")
mytheme$col$up.col<- "green"
mytheme$col$dn.col<- "red"
mytheme$col$up.border<- "darkgreen"
mytheme$col$dn.border<- "darkred"


chartSeries(
  stock_xts,
  type = "candlesticks",
  name = "Stock Price Movement",
  theme = mytheme
)