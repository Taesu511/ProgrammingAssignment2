## Put comments here that give an overall description of what your 
## functions do 


## Write a short comment describing this function 
## makeCacheMatrix function creates a list containing a function to
## 1. Set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse of matrix
## 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) { 
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  get <- function() x
  
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() inv
  list(set = set, get=get,
         setInverse = setInverse,
         getInverse = getInverse)
  
} 

## Write a short comment describing this function 
## cacheSolve function assumes the matrix is always inversible
# The following function returns the inverse of the matrix. It first checks if 
# the inverse has already been computed. If so, it gets the result and skips the 
# computation. If not, it computes the inverse, sets the value in the cache via 
# setinverse function. 


cacheSolve <- function(x, ...) { 
  ## Return a matrix that is the inverse of 'x' 
  inv <- x$getInverse()
  
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  
  data <- x$get()
  inv <- solve(data,...)
  x$setInverse(inv)
  inv
} 
