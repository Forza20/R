corr <- function(directory, threshold = 0) {
    corrsNum <- numeric(0)
    nobsDfr <- complete("specdata")
    nobsDfr <- nobsDfr[nobsDfr$nobs > threshold, ]
    for (cid in nobsDfr$id) {
                monDfr <- pollutantmean(cid, directory)
                corrsNum <- c(corrsNum, cor(monDfr$sulfate, monDfr$nitrate, use = "pairwise.complete.obs"))}
    return(corrsNum)}


complete <- function(directory, id = 1:332) {
    nobsNum <- numeric(0)

    for (cid in id) {
        cDfr <- pollutantmean(cid, directory)
        nobsNum <- c(nobsNum, nrow(na.omit(cDfr)))}
    data.frame(id = id, nobs = nobsNum)}


pollutantmean <- function(id, directory, summarize = FALSE) {
    fileStr <- paste(directory, "/", sprintf("%03d", as.numeric(id)), ".csv", 
        sep = "")
    rawDfr <- read.csv(fileStr)
    if (summarize) {
        print(summary(rawDfr))}
    return(rawDfr)}

#test
data <- corr("specdata", 150)
head(data)
## [1] -0.01896 -0.14051 -0.04390 -0.06816 -0.12351 -0.07589
