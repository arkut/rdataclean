corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        files_list <- list.files(directory, full.names=TRUE)

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        comp <- complete("specdata")
        cvector <- vector()
        corrout <- vector()

        ## Return a numeric vector of correlations
        for (i in 1:332) {
        	
        	df <- na.omit(read.csv(files_list[i]))
        	mon <- comp[i,"nobs"]
        	if (mon > threshold) {
                corrout <- cor(df[,"nitrate"], df[,"sulfate"])
                cvector <- c(cvector, corrout)
        	}
        }
        cvector
}