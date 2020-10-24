## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## I replicated what was done in the example.
## I created a function that returns a list to which you can set a matrix,
## and that list can save the inverse and be used with cacheSolve.

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinv <- function(inv) i <<- inv
    getinv <- function() i
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}


## Write a short comment describing this function

## Again, I replicated the example. The input that the function needs is the
## list created by makeCacheMatrix with a matrix already set.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    i <- x$getinv()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinv(i)
    i
}
