## Below functions demonstrate how assign a value to an object in an 
## environment that is different from the current environment

## Below function get & set value of the mstrix and also  get & set for inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Following function calculates the inverse of the given matrix created with 
## above function. If the inverse already exists then it gets the inverse from
## the cache and skip calculation.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m		
}
