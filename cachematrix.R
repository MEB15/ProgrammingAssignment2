
## these functions are meant calculate and use a cached matrix inverse
## to avoid having to calculate the inverse every time it is needed
## makeCacheMatrix returns a list of functions for 
## 1) setting the value of a matix to a cached variable
## 2) getting the value of a matrix from a cached variable
## 3) setting the value of the matix inverse to a cached variable
## 4) getting the value of the matrix inverse from a cached variable
makeCacheMatrix <- function(x = matrix()) {
     inv <- NULL 
     #function to set the value of the matrix cached variable x
     setx <- function(y) {
          x <<- y
          inv <<- NULL
     }
     #function to get the value of the matrix cached variable x
     getx <- function() x
     #function to set the value of the matrix inverse cached variable inv
     setinv <- function(matinv) inv <<- matinv
     #function to get the value of the matrix inverse cached variable inv
     getinv <- function() inv
     list(setx=setx, getx=getx, setinv=setinv, getinv=getinv)
}
## cacheSolve checks for an existing cached matrix inverse value and returns
## if no cached value is present, it caclucates the invere and sets the cached value
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
     inv <- x$getinv() #check for existing matrix inverse
     if(!is.null(inv)){
          #cached value present, return cached value
          message("getting cached matrix inverse result")
          return(inv)
     }
     data <- x$getx()  #no cached inverse, get matrix
     inv <- solve(data, ...) #calculate inverse
     x$setinv(inv) #set value of cached inverse
     inv
}
