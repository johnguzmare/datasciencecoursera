
FUNCTIONS
==================

```r
add2 <- function(x,y) {
    x + y
}
```
```r
above10 <- function(x) {
  use <- x > 10
  x [use]
}
```
```r
above <- function(x,n=10) {
  use <- x > n
  x [use]
}
```
```r
columnmean <- function(y, removeNA = TRUE){
  nc <- ncol(y)
  means <- numeric(nc)
  
  for (i in 1:nc){
    means[i] <- mean(y[,i], na.rm = removeNA)
  }
  means
}
```
Lexical Scoping
---------------------
```r

make.power <- function(n){
  pow <- function(x) {
     x+n
  }
  pow
}
```
```r
y <- 10 ## free variable
f <- function(x) {
  y <- 2
  y^2 + g(x)
}
g <- function(x) {
  x * y
}
```
```r
g1 <- function(x) {
   a <- 3
   x + a + y 
}
```
Exploring a Function Closure
---------------------
```r
> ls(environment(cube))
[1] "n" "pow"
> get("n", environment(cube))
[1] 3
```

Maximizing a Normal Likelihood
---------------------

Note: Optimization functions in R minimize functions, so you
need to use the negative log-likelihood.

```r
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
```
```r
> set.seed(1); normals <- rnorm(100, 1, 2)
> nLL <- make.NegLogLik(normals)
> nLL
function(p) {
params[!fixed] <- p
mu <- params[1]
sigma <- params[2]
a <- -0.5*length(data)*log(2*pi*sigma^2)
b <- -0.5*sum((data-mu)^2) / (sigma^2)
-(a + b)
}

<environment: 0x165b1a4>
> ls(environment(nLL))
[1] "data" "fixed" "params"

```

```r
> optim(c(mu = 0, sigma = 1), nLL)$par
mu sigma
1.218239 1.787343
```

### Fixing σ = 2
```r
> nLL <- make.NegLogLik(normals, c(FALSE, 2))
> optimize(nLL, c(-1, 3))$minimum
[1] 1.217775
```
### Fixing µ = 1
```r
> nLL <- make.NegLogLik(normals, c(1, FALSE))
> optimize(nLL, c(1e-6, 10))$minimum
[1] 1.800596
```

### Plotting the Likelihood
```r
nLL <- make.NegLogLik(normals, c(1, FALSE))
x <- seq(1.7, 1.9, len = 100)
y <- sapply(x, nLL)
plot(x, exp(-(y - min(y))), type = "l")
```
![rplot](https://user-images.githubusercontent.com/5162499/26906133-d2b0afc4-4bb0-11e7-9c58-aa5d82f5dbe6.png)
```r
nLL <- make.NegLogLik(normals, c(FALSE, 2))
x <- seq(0.5, 1.5, len = 100)
y <- sapply(x, nLL)
plot(x, exp(-(y - min(y))), type = "l")
```
![rplot2](https://user-images.githubusercontent.com/5162499/26906141-df183110-4bb0-11e7-96f9-11e42d4c59b9.png)
