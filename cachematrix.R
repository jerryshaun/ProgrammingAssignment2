## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    ## x should be a square matrix.
    
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }

    get <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}



## Write a short comment describing this function

cacheSolve <- function(x) {
    ## Return a matrix that is the inverse of 'x'

    ## inv will store inverse of matrix
    inv <- x$getinverse()           ##Get the Inverse

    ## Check if inverse already set, and if so return it.
    if (!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }

    ## Otherwise not set - use make function to set
    data <- x$get()
    inv <- solve(data)
    
    x$setinv(inv)
    
    return(inv)

}


test = function(mat){
    ## @mat: an invertible matrix
    
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


makestuff = function() {
    
    set.seed(1110201)
    r = rnorm(1000000)
    matl=matrix(r, nrow=1000, ncol=1000)
    
    #x = rbind(c(1, -1/4), c(-1/4,1))
    #m = makeCacheMatrix(x)
    #m$get()
    

    test(matl)
    
}
