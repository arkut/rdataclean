
#outcomesFile <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

rankall <- function(outcome, num = "best") {
        ## Read outcome data
        outcomesFile <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
                
        outcomesList <- c("heart attack", "heart failure", "pneumonia")
        validOutcome <- is.element(outcome, outcomesList)
        
        if (!validOutcome) {
                stop("invalid outcome")
        }
        
        ## Return hospital name in that state with the given rank
        ## 30-day death rate
        outcomesFile <- outcomesFile[c(2,7,11,17,23)]
        names(outcomesFile)[1] <- "hospital"
        names(outcomesFile)[2] <- "state"
        names(outcomesFile)[3] <- "heart attack"
        names(outcomesFile)[4] <- "heart failure"
        names(outcomesFile)[5] <- "pneumonia"
        
        outcomesFile <- outcomesFile[outcomesFile[outcome] != 'Not Available', ]
        
        outcomesRate <- outcomesFile[, outcome]
        
        whichOutcome <- which.min(outcomesRate)
        
        rankOut <- data.frame()
        rankOut <- data.frame(outcomesFile[1:2])
        
}