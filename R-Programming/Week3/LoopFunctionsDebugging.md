Loop Functions and Debugging
==============================

The apply() functions form the basis of more complex combinations and helps to perform operations with very few lines of code. More specifically, the family is made up of the apply(), lapply() , sapply(), vapply(), mapply(), rapply(), and tapply() functions.


MARGIN is a variable defining how the function is applied: when MARGIN=1, it applies over rows, whereas with MARGIN=2, it works over columns. Note that when you use the construct MARGIN=c(1,2), it applies to both rows and columns; and
FUN, which is the function that you want to apply to the data. It can be any R function, including a User Defined Function (UDF).

```r
> # Construct a 5x6 matrix
> X <- matrix(rnorm(30), nrow=5, ncol=6)
> 
> # Sum the values of each column with `apply()`
> apply(X, 2, sum)
[1] 3.7255160 1.3679714 0.2019320 0.7351061 1.4510589 6.8932036
> 
```

```r
> x <- matrix(rnorm(200),20,10)
> apply(x,2,mean)
 [1] -0.11273804 -0.26960955 -0.40727628  0.46071457 -0.05778508
 [6] -0.02950907 -0.49165391  0.06583530  0.15281505 -0.25551008
> apply(x,1,mean)
 [1]  0.23433185 -0.69870702 -0.03026908  0.12456401 -0.05667150
 [6]  0.27496642 -0.09143031 -0.06264292 -0.04632981 -0.05100138
[11] -0.68563800  0.42445528  0.16834156 -0.59947835  0.10116194
[16]  0.05701710 -0.72703566  0.06116932  0.07922340 -0.36546107
```
calculate the twenty-fifth, and the seventy-fifth percentile of that row. 

```r
> apply(x,1,quantile,probs=c(0.25,0.75))
          [,1]       [,2]       [,3]       [,4]       [,5]       [,6]
25% -0.6094696 -1.0078390 -0.6557934 -0.6261154 -0.4817019 -0.4006122
75%  0.7928545 -0.5388208  0.6479994  0.6713953  0.3801394  0.9005243
          [,7]       [,8]       [,9]      [,10]      [,11]      [,12]
25% -0.5621385 -0.8833689 -0.8269141 -0.6378939 -1.5909825 -0.1502917
75%  0.3842866  0.3430119  0.6750756  0.5018464 -0.1408556  1.2361696
         [,13]      [,14]      [,15]      [,16]      [,17]      [,18]
25% -0.2109266 -1.0101993 -0.6153321 -0.5256593 -1.3593943 -0.6405758
75%  0.5394523 -0.1602882  0.6113750  0.7253861 -0.2380079  0.6166856
         [,19]      [,20]
25% -0.3120121 -1.1447549
75%  0.5662104  0.2615844

```

Create an array (stack of matrices) with a 2x2 matrix and a third dimension of 10

```r
> a <- array(rnorm(2*2*10),c(2,2,10))
```

Calculate the mean of 2x2 matrices, you have to collapse third dimension
```r
> apply(a,c(1,2),mean)
          [,1]       [,2]
[1,] 0.7654450 -0.1898626
[2,] 0.1358548 -0.6475317

> rowMeans(a,dims=2)
          [,1]       [,2]
[1,] 0.7654450 -0.1898626
[2,] 0.1358548 -0.6475317
```


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
A <- matrix(1:9,nrow = 3, ncol = 3)

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

The sapply() Function
-----------------------
The sapply() function works like lapply(), but it tries to simplify the output to the most elementary data structure that is possible. And indeed, sapply() is a ‘wrapper’ function for lapply().


```r
> sapply(x,sd)
        a         b 
1.5811388 0.6941875 
```
```r
> sapply(x,mean)
         a          b 
 3.0000000 -0.0474927 
 
 ```
An example may help to understand this: let’s say that you want to repeat the extraction operation of a single element as in the last example, but now take the first element of the second row (indexes 2 and 1) for each matrix.

```r
> # Return a list with `lapply()`
> lapply(MyList,"[", 2, 1 )
[[1]]
[1] 2

[[2]]
[1] 5

[[3]]
[1] 9
```
```r
> # Return a vector with `sapply()`
> sapply(MyList,"[", 2, 1 )
[1] 2 5 9
```
```r
> # Return a list with `sapply()`
> sapply(MyList,"[", 2, 1, simplify=F)
[[1]]
[1] 2

[[2]]
[1] 5

[[3]]
[1] 9

```
```r
> # Return a vector with `unlist()`
> unlist(lapply(MyList,"[", 2, 1 ))
[1] 2 5 9
> 
```


The mapply() Function
------------------------

The mapply() function stands for ‘multivariate’ apply. Its purpose is to be able to vectorize arguments to a function that is not usually accepting vectors as arguments.

In short, mapply() applies a Function to Multiple List or multiple Vector Arguments.


The tapply() Function
------------------------

The tapply function is useful when we need to break up a vector into groups defined by some classifying factor, compute a function on the subsets, and return the results in a convenient form. You can even specify multiple factors as the grouping variable, for example treatment and sex, or team and handedness.

** Simple example **

simulating a vector of normal random variables and uniform random variables with 10 normals, 10 uniforms, then 10 normals that have a mean of 1. 
So you can think of this vector as having three groups. create another factor variable using the gl function, and its going to be, this factor variable going to have three levels. And each level is going to be repeated ten times. 

So when I print out the factor variable here, you can see that there's 10 ones, 10 twos, and there's 10 threes. So each, so that the factor variable indicates kind of which group the, the observation is in. Apply tapply on x, pass it the factor variable factorv in the mean function, that allows me to take the mean of each group of numbers in

```r
> x <- c(rnorm(10),runif(10),rnorm(10,1))
> factorv <- gl(3,10)
> x
 [1]  0.22149247 -0.63798105 -0.35101104  1.01265767 -1.19214767
 [6]  0.09546738 -1.02883196 -0.81827332  1.41880464  2.24375258
[11]  0.01882982  0.02847130  0.91825580  0.97593839  0.10881426
[16]  0.20331415  0.90899996  0.93472766  0.18143133  0.07733458
[21]  1.17116114  2.48910849  1.50457980  0.44161363  0.67211332
[26]  0.66836891  1.87386274  2.10787431  1.78786135  0.25788754
> factorv
 [1] 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3
Levels: 1 2 3
> 
> 
> 
> tapply(x,factorv,mean)
         1          2          3 
0.09639297 0.43561173 1.29744312 

> tapply(x,factorv,range)
$`1`
[1] -1.192148  2.243753

$`2`
[1] 0.01882982 0.97593839

$`3`
[1] 0.2578875 2.4891085


```

** medical example **

https://www.r-bloggers.com/r-function-of-the-day-tapply-2/
we have a dataset from a medical trial. We want to break up the dataset into two groups, `treatment` and `control`, and then compute the sample average for `age` within each group.

```r
> ## generate data for medical example
> medical.example <-
    data.frame(patient = 1:100,
               age = rnorm(100, mean = 60, sd = 12),
               treatment = gl(2, 50,
                 labels = c("Treatment", "Control")))
> summary(medical.example)
    patient            age             treatment 
 Min.   :  1.00   Min.   : 29.40   Treatment:50  
 1st Qu.: 25.75   1st Qu.: 54.31   Control  :50  
 Median : 50.50   Median : 61.24                 
 Mean   : 50.50   Mean   : 61.29                 
 3rd Qu.: 75.25   3rd Qu.: 66.22                 
 Max.   :100.00   Max.   :102.47     
 
> ## generate data for baseball example
> ## 5 teams with 5 players per team
> 
> baseball.example <-
    data.frame(team = gl(5, 5,
                 labels = paste("Team", LETTERS[1:5])),
               player = sample(letters, 25),
               batting.average = runif(25, .200, .400))
> summary(baseball.example)
     team       player   batting.average 
 Team A:5   a      : 1   Min.   :0.2172  
 Team B:5   c      : 1   1st Qu.:0.2553  
 Team C:5   d      : 1   Median :0.2854  
 Team D:5   e      : 1   Mean   :0.2887  
 Team E:5   f      : 1   3rd Qu.:0.3013  
            g      : 1   Max.   :0.3859  
            (Other):19                    
            
```

Now we have some sample data. Using tapply is now straightforward. Then, actual calls to the function using the data we defined above are shown.

```r
> ## Generic Example
> ## tapply(Summary Variable, Group Variable, Function)
> 
> ## Medical Example
> tapply(medical.example$age, medical.example$treatment, mean)
Treatment   Control 
 62.26883  60.30371  
> ## Baseball Example
> tapply(baseball.example$batting.average, baseball.example$team,
         max)
   Team A    Team B    Team C    Team D    Team E 
0.3784396 0.3012680 0.3488655 0.2962828 0.3858841  

```



