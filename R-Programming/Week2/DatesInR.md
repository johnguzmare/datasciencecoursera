Dates in R
==================

```r
> x = as.Date("1970-01-01")
> x
[1] "1970-01-01"
```
```r
> x = Sys.Date()
> x
[1] "2017-06-07"
> x = Sys.time()
> x
[1] "2017-06-07 19:17:37 -05"
> x = Sys.timezone()
> x
[1] "America/Bogota"
```
```r
> x = Sys.time()
> p = as.POSIXlt(x)
> names(unclass(p))
 [1] "sec"    "min"    "hour"   "mday"   "mon"    "year"   "wday"  
 [8] "yday"   "isdst"  "zone"   "gmtoff"
> p$wday
[1] 3
> p$mday
[1] 7
```
