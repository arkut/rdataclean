
#outcomesFile <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
        outcomesFile <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        outcomeCol <- if (outcome == "heart attack") {
                "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
        } else if (outcome == "heart failure") {
                "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
        } else if (outcome == "pneumonia") {
                "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
        } else {
                stop("invalid outcome")
        }
        
        ## Check that state and outcome are valid
        outcomes_state <- outcomesFile[outcomesFile$State == state, c("Hospital.Name", outcomeCol)]
        
        if (nrow(outcomes_state) == 0) {
                stop("invalid state")
        }
        
        ## Return hospital name in that state with the given rank
        ## 30-day death rate
        if (nrow(outcomes_state) == 0) {
                stop("invalid state")	
        }
        
        outcomes_state[,2] <- as.numeric(outcomes_state[,2])
        sortby_state <- order(outcomes_state[outcomeCol], outcomes_state$Hospital.Name, na.last=NA)
        
        if (num == "best") {
                as.character(outcomes_state$Hospital.Name[sortby_state[1]])
        } else if (num == "worst") {
                as.character(outcomes_state$Hospital.Name[sortby_state[length(sortby_state)]])
        } else if (is.numeric(num)) {
                as.character(outcomes_state$Hospital.Name[sortby_state[num]])
        } else {
                stop("invalid num")
        }
}