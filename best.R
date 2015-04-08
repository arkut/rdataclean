
#outcomesFile <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

best <- function(state, outcome) {
        ## Read outcome data
        outcomesFile <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        fullStates <- read.csv("hospital-data.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        st <- unique(fullStates$State)
        #print(length(st))
        validState <- is.element(state, st)
        
        if (!validState) {
             stop("invalid state")
        }
        
        outcomesList <- c("heart attack", "heart failure", "pneumonia")
        validOutcome <- is.element(outcome, outcomesList)
                
        if (!validOutcome) {
             stop("invalid outcome")
        }
        
        outcomesFile <- outcomesFile[c(2,7,11,17,23)]
        names(outcomesFile)[1] <- "name"
        names(outcomesFile)[2] <- "state"
        names(outcomesFile)[3] <- "heart attack"
        names(outcomesFile)[4] <- "heart failure"
        names(outcomesFile)[5] <- "pneumonia"
        
        outcomesFile <- outcomesFile[outcomesFile$state==state & outcomesFile[outcome] != 'Not Available', ]
        
        outcomesRate <- outcomesFile[, outcome]
        
        whichOutcome <- which.min(outcomesRate)
        
        outcomesFile[whichOutcome, ]$name
        
}