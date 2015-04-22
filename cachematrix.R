## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    ## x should be a square matrix.
    
    ## Steps to solve:
    ##  1. Find inverse, and return
    
    
    
    
    
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    
    ## Steps to solve:
    ##  1. Get the inverse from cache
    ##  2. See if that inverse is null.
    ##      3. If not, pull value from cache
    ##      4. If so, do calculation
    ##  5. Return inverse
    
    
    ## inv will store inverse of matrix
    inv <- ##Get the Inverse
    
    ## Check if inverse already set, and if so return it.
    if (!is.null(inv)) {
        message("Getting inverse from cache")
        return(inv)
    }
    
    ## Otherwise not set - use make function to set

    
    
}
