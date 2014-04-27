## The below program helps cache potentially time consuming matrix inverse computations

## The function below, creates a special "matrix" which contains functions to 
##set & get value of matrix and most importantly set and get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  i<-NULL
  set<-function(y){
    x<<-y
    i<<-NULL
  }
  
  get<-function() x
  setinverse <- function(inverse) i <<-inverse
  getinverse<-function() i
  list(set=set,get=get,
       setinverse=setinverse,
       getinverse=getinverse)
}


## The function below computes the inverse. This function should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  i<-x$getinverse()
  if(!is.null(i)){
    message("retrieving cached data")
    return(i)
  }
  data<-x$get()
  i<-solve(data,...)
  x$setinverse(i)
  i
}
