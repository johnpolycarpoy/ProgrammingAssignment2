## Put comments here that give an overall description of what your
## functions do

## This functions returns a list of functions that do the following:
## set the matrix, get the matrix, set the inverse, get the inverse

makeCacheMatrix <- function(x = matrix()) {

      inv0<-NULL
set <- function(y) {
                x <<- y
                inv0 <<- NULL
        }


      get <- function() x
        
      setinv <- function(inverse) inv0 <<- inverse
      getinv <- function() inv0
        
      list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## This gets the above list and first checks for the contsnts of the inv0 matrix
##If inv0 is non empty then it uses it, o/w it computes inverse and stores it 
##using the setinv function for future calls.

cacheSolve <- function(x, ...) {
             inv0 <- x$getinv()
        if(!is.null(inv0)) {
                message("getting cached inverse")
                return(inv0)
        }
        mat <- x$get()
        inv0 <- solve(mat, ...)
        x$setinv(inv0)
        inv0
}
