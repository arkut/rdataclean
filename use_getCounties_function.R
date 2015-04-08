setwd("/Users/randyrosso/data")
popfile <- "CO-EST2013-Alldata.csv"
source('~/code/getCounties.R')

vapop <- getCounties(popfile,51)
vapop
