setwd("/Users/randyrosso/data")
popest <- read.csv("CO-EST2013-Alldata.csv")

getCounties <- function(filenm, state) {
  
  popest <- read.csv(filenm)
  
  ctydata <- popest[popest$SUMLEV==50,]
  
  st <- ctydata[ctydata$STATE==state,]
  
  head(st$POPESTIMATE2013)

  mean(st$POPESTIMATE2013, na.rm=TRUE)
}