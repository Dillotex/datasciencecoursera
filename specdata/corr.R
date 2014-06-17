corr <- function(directory, threshold = 0) {
        
        #setwd(directory)
        dataFiles <- list.files(pattern="csv")      
        #*******************************************************************************************************
        #* Determine how many files need to be processed in the designated data directory.                     *
        #*******************************************************************************************************
        files <- length(dataFiles)
        # Initialize an empty numeric vector to contain the correllations
        corOut <- vector(mode="numeric",length=0)
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        
        #*******************************************************************************************************
        #*  Loop through the files in the directory, and for each file:                                        *
        #*    - Determine the number of good rows (using complete.cases)                                       *
        #*    - If good rows >= threshold then do correlation function comparing nitrate and sulfate and store *
        #*      in vector                                                                                      *
        #*    - Return a numeric vector of correlations at end                                                 *
        #*                                                                                                     *      
        #*******************************************************************************************************
        for (i in 1:files){
                
                newlyReadDataset <- read.csv(dataFiles[i],header=TRUE)
                good <- complete.cases(newlyReadDataset)
                goodDataset <- newlyReadDataset[good,]
                # Find out how many records are complete.cases
                goodRecCount <- sum(good)
                if (goodRecCount > threshold) {
                        corOut <- c(corOut, cor(goodDataset[,2],goodDataset[,3],use="complete.obs"))
                }
        }
        print(corOut)
}                
#nobs
#nobs <- vector(mode="numeric", length=0)
#myDataFrame <- data.frame(id, nobs)
#myDataFrame
#print(goodRecs)
#corrRow <- vector(mode="numeric", length=0)
#newlyReadDataset <- read.csv(dataFiles[i],header=TRUE)
#cleanRow <- na.omit(newlyReadDataset)
#print(cleanRow[,1:4])
#cleanDataset <- data.frame(cleanRow[,1:4])
#print(nrow(cleanDataset))
#cleanRowCount <- nrow(cleanDataset)
#if (cleanRowCount > threshold) print(paste("Bingo",cleanRow[,4],"Rows=",cleanRowCount,sep=" "))
#if (cleanRowCount > threshold) {
#        corrValue <- cor(cleanDataset[,2],cleanDataset[,3])
#        corrRow <- c(corrRow,corrValue)
#        print(round(corrRow,digits=4))
#}
#print(complete.cases(newlyReadDataset))
#good <- complete.cases(newlyReadDataset)
#ccRows <- data.frame(newlyReadDataset[good](,1:3))
#print(ccRows)
#currentGoodCount <- length(newlyReadDataset[good])
#currentGoodCount
#nobs <- c(nobs, sum(complete.cases(newlyReadDataset)))