Subsetting and Sorting
=====================

```r
> set.seed(13435)
> X <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
> X
  var1 var2 var3
1    2    8   15
2    3    7   12
3    5    6   14
4    1   10   11
5    4    9   13
> X <- X[sample(1:5),];X$var2[c(1,3)]=NA
> X
  var1 var2 var3
1    2   NA   15
4    1   10   11
2    3   NA   12
3    5    6   14
5    4    9   13


```

```r
> X[,1]
[1] 2 1 3 5 4
> X[,"var1"]
[1] 2 1 3 5 4
> X[X$var1<=3 & X$var3>11,]
  var1 var2 var3
1    2   NA   15
2    3   NA   12
> X[X$var1<=3 & X$var3>15,]
[1] var1 var2 var3
<0 rows> (or 0-length row.names)
> X[X$var1<=3 | X$var3>15,]
  var1 var2 var3
1    2   NA   15
4    1   10   11
2    3   NA   12
```

Which Function
--------------

Function gives the TRUE indices of a logical object, allowing for array indices.
 
```r
> X[X$var2>8,]
     var1 var2 var3
NA     NA   NA   NA
4       1   10   11
NA.1   NA   NA   NA
5       4    9   13

> X[which(X$var2>8),]
  var1 var2 var3
4    1   10   11
5    4    9   13
> 

```

Ordering and Sort data
----

```r

> X
  var1 var2 var3
1    2   NA   15
4    1   10   11
2    3   NA   12
3    5    6   14
5    4    9   13

> sort(X$var1)
[1] 1 2 3 4 5

> sort(X$var1,decreasing = TRUE)
[1] 5 4 3 2 1

> sort(X$var1,na.last = TRUE)
[1] 1 2 3 4 5

> sort(X$var2,na.last = TRUE)
[1]  6  9 10 NA NA

> X[order(X$var1,X$var3),]
  var1 var2 var3
4    1   10   11
1    2   NA   15
2    3   NA   12
5    4    9   13
3    5    6   14

```


plyr package
---

```r
> library(plyr)
> X
  var1 var2 var3
1    2   NA   15
4    1   10   11
2    3   NA   12
3    5    6   14
5    4    9   13

> arrange(X,var1)
  var1 var2 var3
1    1   10   11
2    2   NA   15
3    3   NA   12
4    4    9   13
5    5    6   14

> arrange(X,desc(var1))
  var1 var2 var3
1    5    6   14
2    4    9   13
3    3   NA   12
4    2   NA   15
5    1   10   11
```

Add rows to data set
---

```r
> X$var4 <- rnorm(5)
> X
  var1 var2 var3       var4
1    2   NA   15  0.1875960
4    1   10   11  1.7869764
2    3   NA   12  0.4966936
3    5    6   14  0.0631830
5    4    9   13 -0.5361329
> 

> Y <- cbind(X,rnorm(5))
> Y
  var1 var2 var3       var4    rnorm(5)
1    2   NA   15  0.1875960  0.62578490
4    1   10   11  1.7869764 -2.45083750
2    3   NA   12  0.4966936  0.08909424
3    5    6   14  0.0631830  0.47838570
5    4    9   13 -0.5361329  1.00053336
> 

```

