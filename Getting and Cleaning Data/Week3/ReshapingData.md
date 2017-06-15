Reshaping Data
===================


```r
> library(reshape2)
> head(mtcars)
                   mpg cyl disp  hp drat    wt  qsec vs am gear carb
Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
> 
```


Melting Data Frames
----

Melt variables `mpg` and `hp` into a pair of (variable , value ) observations

```r
> mtcars$carname <- rownames(mtcars)
      
> carMelt <- melt(mtcars,id=c("carname","gear","hp","cyl"),measure.vars = c("mpg","hp"))

> head(carMelt)
            carname gear  hp cyl variable value
1         Mazda RX4    4 110   6      mpg  21.0
2     Mazda RX4 Wag    4 110   6      mpg  21.0
3        Datsun 710    4  93   4      mpg  22.8
4    Hornet 4 Drive    3 110   6      mpg  21.4
5 Hornet Sportabout    3 175   8      mpg  18.7
6           Valiant    3 105   6      mpg  18.1


> tail(carMelt)
          carname gear  hp cyl variable value
59  Porsche 914-2    5  91   4       hp    91
60   Lotus Europa    5 113   4       hp   113
61 Ford Pantera L    5 264   8       hp   264
62   Ferrari Dino    5 175   6       hp   175
63  Maserati Bora    5 335   8       hp   335
64     Volvo 142E    4 109   4       hp   109

```

Casting Data Frames
----

dcast function recast the dataset into a particular shape into a particular data frame

cylinder broken down by summarize variables (mpg, hp)
```r
> cyldata <- dcast(carMelt, cyl ~ variable)
Aggregation function missing: defaulting to length
> cyldata
  cyl mpg hp
1   4  11 11
2   6   7  7
3   8  14 14
> 
```


cylinder broken down by mean of variables (mpg, hp)
```r
> cyldata <- dcast(carMelt, cyl ~ variable,mean)
> cyldata
  cyl      mpg        hp
1   4 26.66364  82.63636
2   6 19.74286 122.28571
3   8 15.10000 209.21429
```


you can use tapply or split or ddply
