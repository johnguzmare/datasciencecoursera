
Quiz 3
======================

Take a look at the 'iris' dataset that comes with R. The data can be loaded with the code:
```r
library(datasets)
data(iris)
```


There will be an object called 'iris' in your workspace. In this dataset, what is the mean of 'Sepal.Length' for the species virginica? Please round your answer to the nearest whole number.
-------------------

> tapply(iris$Sepal.Length,iris$Species,mean)
> 6.589
 
Continuing with the 'iris' dataset from the previous Question, what R code returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
--------------------
```r
> apply(iris[, 1:4], 2, mean)
```

Load the 'mtcars' dataset in R with the following code
```r
library(datasets)
data(mtcars)
```

There will be an object names 'mtcars' in your workspace. You can find some information about the dataset by running
How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)? Select all that apply.

```r
with(mtcars, tapply(mpg, cyl, mean))

sapply(split(mtcars$mpg, mtcars$cyl), mean)

tapply(mtcars$mpg, mtcars$cyl, mean)
```

Continuing with the 'mtcars' dataset from the previous Question, what is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?
-----------------

(Please round your final answer to the nearest whole number. Only enter the numeric result and nothing else.)
```r
127
```

If you run `debug(ls)` what happens when you next call the 'ls' function?

```r 
Execution of 'ls' will suspend at the beginning of the function and you will be in the browser.
```
