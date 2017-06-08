Programming Assignment 1: Quiz
================================

What value is returned by the following call to pollutantmean()? You should round your output to 3 digits.
---------
```r
pollutantmean("specdata", "sulfate", 1:10)
```
4.064

What value is returned by the following call to pollutantmean()? You should round your output to 3 digits.
---------

```r
pollutantmean("specdata", "nitrate", 70:72)
```

1.706

What value is returned by the following call to pollutantmean()? You should round your output to 3 digits.
---------
```r
pollutantmean("specdata", "sulfate", 34)
```

1.477


What value is returned by the following call to pollutantmean()? You should round your output to 3 digits.
---------

```r
pollutantmean("specdata", "nitrate")
```

1.703


What value is printed at end of the following code?
---------

```r
cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)
```

228 148 124 165 104 460 232


What value is printed at end of the following code?
---------
```r
cc <- complete("specdata", 54)
print(cc$nobs)
```

219


What value is printed at end of the following code?
---------

```r
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
```

711 135 74 445 178 73 49 0 687 237


What value is printed at end of the following code?
---------

```r
cr <- corr("specdata")                
cr <- sort(cr)                
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)
```
0.2688 0.1127 -0.0085 0.4586 0.0447


What value is printed at end of the following code?
---------

```r
cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)
```

243.0000 0.2540 0.0504 -0.1462 -0.1680 0.5969


What value is printed at end of the following code?
---------
```r
cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
```

0.0000 -0.0190 0.0419 0.1901

