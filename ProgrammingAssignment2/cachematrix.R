## The following functions allow you to create a special matrix object from a 
## normal matrix. This object can cache its inverse. The function cacheSolve computes 
## the inverse of the special matrix object. If the inverse has been already calculcated 
## (if the matrix has not changed) then cacheSolve retreieves the inverse from the cache. 

## makeCacheMatrix takes an ordinary matrix, and returns a list containing the following 
## functions: to set the value of the matrix, get the value of the matrix, set the value 
## of the inverse, and get the value of the inverse. 

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setInverse <- function(solve) m <<- solve
  getInverse <- function() m
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}



## cacheSolve takes the special matrix created with makeCacheMatrix, and first checks to see 
## if the inverse has already been caluclated. If so it gets the inverse from the cache and
## skips the computations. Otherwise it uses the function solve() to compute the inverse
## of the matrix and sets the value of the inverse in the cache using the setInverse function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
 
  m <- x$getInverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m)
  m
}



