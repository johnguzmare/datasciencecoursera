Lesson 1: Lattice Plotting System
=====


Simple Lattice plot
---

> library(lattice)
> library(datasets)
> 

> head(airquality)
  Ozone Solar.R Wind Temp Month Day
1    41     190  7.4   67     5   1
2    36     118  8.0   72     5   2
3    12     149 12.6   74     5   3
4    18     313 11.5   62     5   4
5    NA      NA 14.3   56     5   5
6    28      NA 14.9   66     5   6


> xyplot(Ozone ~ Wind , data = airquality)


Rplot.png)

Convert Month to a factor variable

> airquality <- transform(airquality, Month = factor(Month))
> xyplot(Ozone ~ Wind | Month , data = airquality, layout= c(5,1))

Rplot01.png)


Lattice Panel Function
---

set.seed(10)
x <- rnorm(100)
f <- rep(0:1,each=50)
y <- x + f -f * x + rnorm(100,sd=0.5)

f <- factor(f,label=c("G1,G2"))

xyplot(y~x | f, layout=c(2,1))

Rplot02.png)

Custom panel functions
---

add median doted line

xyplot(y~x | f, panel=function(x,y,...) {
    panel.xyplot(x,y,...) # first call the default panel
    panel.abline(h=median(y),lty=2) # Add a horizontal line at the median
})

Rplot03.png)

Add regression lines

xyplot(y~x | f, panel=function(x,y,...) {
    panel.xyplot(x,y,...) # first call the default panel
    panel.abline(h=median(y),lty=2) # Add a horizontal line at the median
    panel.lmline(x,y, col=2) # overlay a simple regression line
})


Rplot04.png


