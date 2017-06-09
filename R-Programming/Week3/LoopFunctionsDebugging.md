Loop Functions and Debugging
==============================

The apply() functions form the basis of more complex combinations and helps to perform operations with very few lines of code. More specifically, the family is made up of the apply(), lapply() , sapply(), vapply(), mapply(), rapply(), and tapply() functions.

The lapply() Function
-------------------------

You want to apply a given function to every element of a list and obtain a list as result. When you execute ?lapply, you see that the syntax looks like the apply() function.

The difference is that:

It can be used for other objects like dataframes, lists or vectors; and
The output returned is a list (which explains the “l” in the function name), which has the same number of elements as the object passed to it.

> lapply
function (X, FUN, ...) 
{
    FUN <- match.fun(FUN)
    if (!is.vector(X) || is.object(X)) 
        X <- as.list(X)
    .Internal(lapply(X, FUN))
}
<bytecode: 0x7fa1f1145c00>
<environment: namespace:base>

```r
> x <- list(a=1:5,b=rnorm(10))

> x
$a
[1] 1 2 3 4 5

$b
 [1]  0.1914453 -0.4488061  0.1862152 -0.2003549 -0.3078116  1.5331059 -0.7914014 -0.9110498
 [9] -0.0952676  0.3689981
```
```r
> lapply(x,mean)
$a
[1] 3

$b
[1] -0.0474927
```
```r
> lapply(x,sum)
$a
[1] 15

$b
[1] -0.474927
```
```r
> lapply(x,sd)
$a
[1] 1.581139

$b
[1] 0.6941875

```

```r
A <- matrix(1:20,nrow = 3, ncol = 3)

> A
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9

> B <- matrix(1:9,nrow = 3, ncol = 3)

> B
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9

> C <- matrix(1:6,nrow = 3, ncol = 2)
> C
     [,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6
```
```r
> MyList <- list(A,B,C)

> lapply(MyList,"[", , 2)
[[1]]
[1] 4 5 6

[[2]]
[1] 4 5 6

[[3]]
[1] 4 5 6
```
```r
> lapply(MyList,"[", , 1)
[[1]]
[1] 1 2 3

[[2]]
[1] 1 2 3

[[3]]
[1] 1 2 3

```
