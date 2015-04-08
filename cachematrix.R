## Write two functions to calculate and 
## cache the inverse of a square matrix.

## makeCacheMatrix creates a special 'matrix'
## object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
	    # create variable m in parent environment, set to NULL
        m <- NULL
        # define set function, assigning value of x as input
        # from makeCacheMatrix function
        # assign parent env m to NULL so it can be reset
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        # define get function, returning x from makeCacheMatrix
        # from parent environment
        get <- function() x
        # define setinv function as inverse function in parent environment
        setinv <- function(solve) m <<- solve
        # define getinv function, returning m from setinv
        getinv <- function() m
        # assign functions from makeCacheMatrix to list object to return
        # this makes functions accessible outside of makeCacheMatrix function
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
        
}


## cacheSolve computes the inverse of the 'matrix' returned
## by makeCacheMatrix. If the inverse already has been 
## calculated (and matrix has not changed), then cacheSolve
## should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        # assign getinv function from x to m
        m <- x$getinv()
        # if m already defined, use cached value
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        # assign get function from makeCacheMatrix to data
        data <- x$get()
        # apply solve function to data, assign result to m
        m <- solve(data, ...)
        # assign setinv function to m and update m in parent environment
        x$setinv(m)
        # return m
        m
}
