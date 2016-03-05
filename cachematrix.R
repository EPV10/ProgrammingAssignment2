## Create a special "matrix", which is a list containing
## a function to
##   - set the value of the matrix
##   - get the value of the matrix
##   - set the value of the inverse matrix
##   - get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
    cache <- NULL                               # clear cache 
    
    set <- function(new_matrix) {               # Strore a matrix     
        x <<- new_matrix
        cache <<- NULL                          # since the matrix is assigned a new value, clear the cache
    }
    
    get <- function(){
        x                                       # return the stored matrix
    }
    
    setinverse <- function(inv) {               # Cache the given argument
        cache <<- inv
    }
    
    getinverse <- function() {                  # Return the cache value
         cache
    }
    
    list(
        set = set,
        get = get,
        setinverse = setinverse,
        getinverse = getinverse
    )
}


## Calculate the inverse of the special "matrix" created with the above
## function, reusing cached result if it is available

cacheSolve <- function(x, ...) {
    cache <- x$getinverse()                         # get the cached value
    if(!is.null(cache)) {                           # if a cached value exists return it
        message("getting cached data")
        return(i)
    }
    m <- x$get()                                   # otherwise get the matrix, caclulate the inverse and store it in the cache
    cache <- solve(m, ...)
    x$setinverse(cache)
    cache
}

