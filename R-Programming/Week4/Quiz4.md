Week 4 Quiz
==================

What is produced at the end of this snippet of R code?
-------

```r 
set.seed(1)
rpois(5, 2)
```

A vector with the numbers 1, 1, 2, 4, 1 `Correct`


What R function can be used to generate standard Normal random variables?
-------

rnorm `Correct`
Functions beginning with the `r' prefix are used to simulate random variates.


When simulating data, why is using the set.seed() function important? Select all that apply.
-------

It can be used to specify which random number generating algorithm R should use, ensuring consistency and reproducibility.
`Correct` 

It ensures that the random numbers generated are within specified boundaries.
Un-selected is `Correct` 

It ensures that the sequence of random numbers is truly random.
Un-selected is `Correct` 

It can be used to generate non-uniform random numbers.
Un-selected is `Correct` 


Which function can be used to evaluate the inverse cumulative distribution function for the Poisson distribution?
--------

rpois

qpois `Correct`
Probability distribution functions beginning with the `q' prefix are used to evaluate the quantile (inverse cumulative distribution) function.

ppois

dpois

 
What does the following code do?
--------

```r 
set.seed(10)
x <- rep(0:1, each = 5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e
```

Generate random exponentially distributed data

Generate uniformly distributed random data

Generate data from a Normal linear model `Correct`

Generate data from a Poisson generalized linear model

 
What R function can be used to generate Binomial random variables?
---------

rbinom `Correct`

qbinom

pbinom

dbinom


What aspect of the R runtime does the profiler keep track of when an R expression is evaluated?
---------

the global environment

the function call stack `Correct`

the package search list

the working directory


Consider the following R code
----------

```r 
library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL)
```

(Assume that y, x1, and x2 are present in the workspace.) Without running the code, what percentage of the run time is spent in the 'lm' function, based on the 'by.total' method of normalization shown in 'summaryRprof()'?

23%

50%

It is not possible to tell

100% `Correct`

When using `by.total' normalization, the top-level function (in this case, `lm()') always takes 100% of the time.


When using 'system.time()', what is the user time?
---------

It is the time spent by the CPU waiting for other tasks to finish

It is the "wall-clock" time it takes to evaluate an expression

It is a measure of network latency

It is the time spent by the CPU evaluating an expression 'Correct`


If a computer has more than one available processor and R is able to take advantage of that, then which of the following is true when using 'system.time()'?
----------

elapsed time may be smaller than user time `Correct`

elapsed time is 0

user time is always smaller than elapsed time

user time is 0
