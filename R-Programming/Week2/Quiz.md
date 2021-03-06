Week 2 Quiz
======================



Suppose I define the following function in R
--------------------

```r
cube <- function(x, n) {
        x^3
}
```
What is the result of running
```r
cube(3)
```
in R after defining this function?

A warning is given with no value returned.

An error is returned because 'n' is not specified in the call to 'cube'

The users is prompted to specify the value of 'n'.

**The number 27 is returned**


The following code will produce a warning in R.
-----------

```r
x <- 1:10
if(x > 5) {
        x <- 0
}
```
Why?

There are no elements in 'x' that are greater than 5

You cannot set 'x' to be 0 because 'x' is a vector and 0 is a scalar.

The syntax of this R expression is incorrect.

**'x' is a vector of length 10 and 'if' can only test a single logical statement.**

The expression uses curly braces.


Consider the following function
-----------

```r
f <- function(x) {
        g <- function(y) {
                y + z
        }
        z <- 4
        x + g(x)
}
```
If I then run in R



```r
z <- 10
f(3)
```
What value is returned?

4

16

7

**10**

Consider the following expression:
-----------

```r
x <- 5
y <- if(x < 3) {
        NA
} else {
        10
}
```
What is the value of 'y' after evaluating this expression?

**10**

3

5

NA

Consider the following R function
-----------

```r
h <- function(x, y = NULL, d = 3L) {
        z <- cbind(x, d)
        if(!is.null(y))
                z <- z + y
        else
                z <- z + f
        g <- x + y / z
        if(d == 3L)
                return(g)
        g <- g + 10
        g
}
```

Which symbol in the above function is a free variable?

**f**

z

d

L

g

What is an environment in R?
-----------

a special type of function

**a collection of symbol/value pairs**

a list whose elements are all functions

an R package that only contains data

The R language uses what type of scoping rule for resolving free variables?
-----------

dynamic scoping

compilation scoping

global scoping

**lexical scoping**


How are free variables in R functions resolved?
-----------
The values of free variables are searched for in the environment in which the function was called

**The values of free variables are searched for in the environment in which the function was defined**

The values of free variables are searched for in the global environment

The values of free variables are searched for in the working directory


What is one of the consequences of the scoping rules used in R?
-----------
R objects cannot be larger than 100 MB

Functions cannot be nested

**All objects must be stored in memory**

All objects can be stored on the disk


In R, what is the parent frame?
-----------
It is always the global environment

**It is the environment in which a function was called**

It is the package search list

It is the environment in which a function was defined

