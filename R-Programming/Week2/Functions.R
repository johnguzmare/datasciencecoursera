add2 <- function(x,y) {
    x + y
}

above10 <- function(x) {
    use <- x > 10
    x [use]
}

above <- function(x,n=10) {
    use <- x > n
    x [use]
}

columnmean <- function(y, removeNA = TRUE){
    nc <- ncol(y)
    means <- numeric(nc)
    
    for (i in 1:nc){
        means[i] <- mean(y[,i], na.rm = removeNA)
    }
    means
}

make.power <- function(n){
    pow <- function(x) {
        x+n
    }
    pow
}

y <- 10
f <- function(x) {
    y <- 2
    y^2 + g(x)
}
g <- function(x) {
    x * y
}

g1 <- function(x) {
    a <- 3
    x + a + y 
}

make.NegLogLik <- function(data, fixed=c(FALSE,FALSE)) {
    params <- fixed
    function(p) {
        params[!fixed] <- p
        mu <- params[1]
        sigma <- params[2]
        a <- -0.5*length(data)*log(2*pi*sigma^2)
        b <- -0.5*sum((data-mu)^2) / (sigma^2)
        -(a + b)
    }
}

