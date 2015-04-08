complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        files_list <- list.files(directory, full.names=TRUE)

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases

        df <- data.frame()
        ident <- vector()
        nobs <- vector()
        dfout <- data.frame(ident,nobs)
        
        for (i in id) {
                
                df <- read.csv(files_list[i])
                complete <- na.omit(df)
                nobs <- sum(nrow(complete))
                ident <- i
                dfout <- rbind(dfout,data.frame(ident,nobs),row.names=NULL)

        }

        dfout
}
#df <- rbind(df, read.csv(files_list[i]))

#complete <- (is.na(df[i,"sulfate"]) == FALSE & is.na(df[i,"nitrate"]) == FALSE)
#complete <- complete.cases(df[,"nitrate"],df[,"sulfate"])