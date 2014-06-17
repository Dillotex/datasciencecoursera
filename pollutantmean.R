pollutantmean <- function(directory, pollutant, id = 1:332) {
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files        
        
        setwd(directory)
        #print(getwd())
        
        dataFiles <- list.files(pattern="csv")
        #selectedFiles <- dataFiles[id]
        #print("selectedFiles")
        #print(selectedFiles)
        fullTable = data.frame(matrix(vector(), 0, 4))
        for (i in id){
            newlyReadDataset <- read.csv(dataFiles[i],header=TRUE)
            fullTable <- rbind(fullTable, newlyReadDataset)
        }
        #print("fullTable")
        #print(fullTable)
        #print("Mean")
        setwd("..")
        if (pollutant=="sulfate"){meanValue <- mean(fullTable[,2], na.rm=TRUE)}
        if (pollutant=="nitrate"){meanValue <- mean(fullTable[,3], na.rm=TRUE)}
        print(round(meanValue,digits=3))
        #getwd()
        
}
