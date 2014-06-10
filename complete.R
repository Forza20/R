complete <- function(directory, id = 1:332) { 

nobsNum <- numeric(0)

    for (cid in id) {
        cDfr <- pollutantmean(cid, directory)
        nobsNum <- c(nobsNum, nrow(na.omit(cDfr)))}
    data.frame(id = id, nobs = nobsNum)}

pollutantmean <- function(id, directory, summarize = FALSE) {  fileStr <- paste(directory, "/", sprintf("%03d", as.numeric(id)), ".csv", 
        sep = "")
rawDfr <- read.csv(fileStr)
  if (summarize) {
        print(summary(rawDfr))}
        
return(rawDfr)}

#test
complete("specdata", 1)
   id nobs
1  1  117
