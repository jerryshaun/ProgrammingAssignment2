## Functions to find inverse of matrix, storing value in cache to save
## processing time when inverse is requested again.

## makeCacheMatrix function creates a special vector which is really a
## list containing a function to:
##      1.  set the value of the vector (set)
##      2.  get the value of the vector (get)
##      3.  set the value of the mean (setinverse)
##      4.  get the value of the mean (getinverse)
##
## Returns list with custom functions.

makeCacheMatrix <- function(x = matrix()) {
    ## x should be a square matrix.
    
    ## Initializes inverse matrix to null
    inv <- NULL
    
    ## Sets the matrix
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }

    ## Gets the matrix
    get <- function() x
    
    ## Sets the inverse
    setinverse <- function(inverse) inv <<- inverse
    
    ## Gets the inverse
    getinverse <- function() inv
    
    ## Return list with aset and get functions above.
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}



## cacheSolve calculates the inverse of a matrix. However, it first checks to
## see if the inverse has already been found. If so, it retrieves the inverse
## from the cache and skips the computation. Otherwise, it calculates the
## inverse of the matrix and sets the value of the inverse in the cache via
## 'setinverse" function.
##
## Returns the inverse of 'x'

cacheSolve <- function(x) {
    ## inv will store inverse of matrix.
    inv <- x$getinverse()   ## Gets inverse from cache (may be null)

    ## Check if inverse already set (not null); if so, return value from cache.
    if (!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }

    ## Otherwise, use function to calculate the inverse
    data <- x$get()
    inv <- solve(data)
    
    ## Stores inverse into cache
    x$setinverse(inv)
    
    return(inv)
}

testrun = function() {
    
    set.seed(1110201)
    r = rnorm(1000000)
    mat=matrix(r, nrow=1000, ncol=1000)
    
    ##mat = rbind(c(1, -1/4), c(-1/4,1))
    

    temp = makeCacheMatrix(mat)
    
    start.time = Sys.time()
    cacheSolve(temp)
    dur = Sys.time() - start.time
    print(dur)
    
    start.time = Sys.time()
    cacheSolve(temp)
    dur = Sys.time() - start.time
    print(dur)
}