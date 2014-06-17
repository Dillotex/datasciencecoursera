complete <- function(directory, id = 1:332) {
        setwd(directory)
        dataFiles <- list.files(pattern="csv")
        nobs <- vector(mode="numeric", length=0)
        
        for (i in id){
                newlyReadDataset <- read.csv(dataFiles[i],header=TRUE)
                nobs <- c(nobs, sum(complete.cases(newlyReadDataset)))
        }
        myDataFrame <- data.frame(id, nobs)
        myDataFrame
}