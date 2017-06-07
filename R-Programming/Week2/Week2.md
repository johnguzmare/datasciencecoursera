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
