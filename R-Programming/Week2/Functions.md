
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
y <- 10
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
