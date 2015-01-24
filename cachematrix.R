## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This funcion stores the input matrix and its inverse in cache. 
## Individual comments are given against each individual function

makeCacheMatrix <- function(x = matrix()) {
	matinv <- NULL
        ## set function to set the input matrix globally with given matrix
	## and inverse matrix as null
        set <- function(y) {
                x <<- y
                matinv <<- NULL
        }
        ## get function to get the input matrix
        get <- function(){
              x  
        } 
        ## setinv function to set the inverse matrix into cache (matinv)
        setinv <- function(inv){
                matinv <<- inv
        }
        ## getinv function to get the inverse matrix
        getinv <- function(){
                matinv
        } 
        ## all the function outputs are assigned to list variables
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)

}


## Write a short comment describing this function
## This function retrieves cached matrix inverse if exists,
## otherwise computes
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	##retrieving cached matrix inverse 
        matinv <- x$getinv()
        ##if cached value exists return value otherwise compute 
        if(!is.null(matinv)) {
                message("getting cached matrix inverse")
                return(matinv)
        }
        mat <- x$get()
        matinv <- solve(mat)
        x$setinv(matinv)
        matinv
}
