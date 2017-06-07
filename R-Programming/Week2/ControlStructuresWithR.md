Week 2: Programming with R
=============================


Control Structures with R
---------------------------

### if-else

```r
if () {
   y <- 10
} else if () {
   y <- 0
}
```

### for loop
```r
x <- c("a","b","c","d")
for (i,1:4) {
print (x[i])
}
```
```r
for (i in seq_along(x)) {
print (x[i])
}
```
```r
for (letter in x) {
print (letter)
}
```
```r
for (i,1:4) print (x[i])
```
### nested for loop
```r
x <- matrix(1:6,2,3)

for (i in seq_len(nrow(x)) {
   for (j in seq_len(ncol(x)) {
       print(x[i,j])
   }
}
```

### while
```r
x <- 0

while (count < 10) {
       print(count)
       count <- count + 1
}
```
Random Walk
```r
z <- 5

while (z >=3 && z <= 10) {
       print(z)
       coin <- rbinom(1,1,0.5)
       
       if (coin == 1) { ## Random Walk
         z <- z + 1
       } else {
         z <- z - 1
       }
}
```
### repeat 
```r
x0 <- 1
tol <- 1e-8

repeat {
   x1 <- computeStimate()
   if (abs(x1-x0)< tol) {
      break
   } else {
      x0 <- x1
   }
}
```






