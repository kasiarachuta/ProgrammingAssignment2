
R version 3.2.4 (2016-03-10) -- "Very Secure Dishes"
Copyright (C) 2016 The R Foundation for Statistical Computing
Platform: x86_64-apple-darwin13.4.0 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[R.app GUI 1.67 (7152) x86_64-apple-darwin13.4.0]

[History restored from /Users/katarzynarachuta/.Rapp.history]

> ## Writing two functions: makeCacheMatrix and cacheSolve## makeCacheMatrix: function creating a special “matrix” object that can ## cache its inversemakeCacheMatrix <- function(x = matrix()) {    m <- NULL    set <- function(y) {        x <<- y        m <<- NULL    }    get <- function() x    setInverse <- function(inv) m <<- inv    getInverse <- function() m    list(        set = set,        get = get,        setinverse = setInverse,        getinverse = getInverse    )}## cacheSolve: function computing the inverse of the special “matrix” ## returned above.## The cachesolve should retrieve the inverse from the cache if the inverse ## has already been calculatedcacheSolve <- function(x, ...) {    m <- x$getInverse()    if(!is.null(m)) {        message("getting cached data")        return(m)    }    n <- x$get()    m <- solve(n, ...)    x$setInverse(m)    m}