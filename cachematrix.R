## cacheMatrix.R
## Date: May 2015
## Author: OH

## Second programming assignment for R Programming Coursera course
## Ref: https://class.coursera.org/rprog-014

## The first function, makeCacheMatrix creates a special "matrix" 
## which is actually a list of 4 functions to
## set the value of the matrix to inverse
## get the value of the matrix to inverse
## set the value of the inverted Matrix
## get the value of the inverted Matrix

makeCacheMatrix <- function(x = matrix()) {
        invertedMx <- NULL;
        # Set the internal matrix with aMatrix
        set <- function(aMatrix) {
                thisMatrix <<- aMatrix;
                invertedMx <<- NULL;
        }
        # Return current Matrix
        get <- function() {
                thisMatrix;
        }
        # set the internal Inverted matrix
        setIM <- function(InvertedMx) {
                invertedMx <<- InvertedMx;
        }
        # get the internal inverted matrix
        getIM <- function() {
                invertedMx;
        }
        
        # This function returns a list of our 4 defined functions
        list(set = set, get = get,
             setIM = setIM,
             getIM = getIM);
}


## Calculate OR return the Inverse of matrix x if already calculated
## x must have been created by makeCacheMatrix

cacheSolve <- function(x, ...) {
        # check if already calculated
        invertedMx <- x$getIM();
        if (!is.null(invertedMx))
        {
                message("Getting cached data");
                # Already done, return previous result
                return(invertedMx);
        }
        # else
        thisMatrix <- x$get();
        invertedMx <- solve(thisMatrix, ...);
        x$setIM(invertedMx);
        # return
        invertedMx;
}

## Unit Test
## Copy paste the following code in R (providing cacheMatrix.R is in active wd)
## source("cacheMatrix.R"); im <- makeCacheMatrix(); im$set(rbind(c(1, 2), c(2, 1))); cacheSolve(im); cacheSolve(im);
## Returns:
## [,1]       [,2]
## [1,] -0.3333333  0.6666667
## [2,]  0.6666667 -0.3333333
## Getting cached data
## [,1]       [,2]
## [1,] -0.3333333  0.6666667
## [2,]  0.6666667 -0.3333333
