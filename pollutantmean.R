setwd("~/Coursera/R")

getwd()
[1] "C:/Users/Peter/Documents/Coursera/R"

pollutantmean <- function(directory, pollutant, id = 1:332) {data = numeric()
for (i in id) {
newRead = read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), ".csv", sep = ""))                              data = c(data, newRead[[pollutant]])}
return(mean(data, na.rm = TRUE))}

#test
> pollutantmean("specdata", "nitrate", 23)
[1] 1.280833
