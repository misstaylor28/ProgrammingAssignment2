## These functions demonstrate the lexical scoping feature of the R language.

## makeCachematix contains code to get the value of a matrix, set the value
## of a matrix, get the inverse of a square matrix, and set the inverse of 
## a square matrix.  The 

makeCacheMatrix <- function(x = matrix()) {
        
        i <- NULL
        set <- function(y){
                x<<-y 
                i <<- NULL
        }
        get <- function() x
        setinverse <-function(solve) i <<- solve
        getinverse <- function() i
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
        

}


## This function takes the inverse of a matrix.  It first checks to see if there
## is a cached version of the inverse before computing it again.  

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinverse()
        if(!is.null(i)){
                message ("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data,...)
        x$setinverse(i)
}
