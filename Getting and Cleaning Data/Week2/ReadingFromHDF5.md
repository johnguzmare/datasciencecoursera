HDF5 interface to R
========================

This R/Bioconductor package provides an interface between HDF5 and R. HDF5's main features are the ability to store and access very large and/or complex datasets and a wide variety of metadata on mass storage (disk) through a completely portable file format. The rhdf5 package is thus suited for the exchange of large and/or complex datasets between R and other software package, and for letting R applications work on datasets that are larger than the available RAM.

### Installation

To install this package, start R and enter:

```r
> source("https://bioconductor.org/biocLite.R")
> biocLite("rhdf5")
```
### Load and sample file
```r
> library(rhdf5)
> created = h5createFile("example.h5")
> created
[1] TRUE
```
### Create groups
```r
> created = h5createGroup("example.h5","foo")
> created = h5createGroup("example.h5","baa")
> created = h5createGroup("example.h5","foo/foobaa")
> h5ls("example.h5")
  group   name     otype dclass dim
0     /    baa H5I_GROUP           
1     /    foo H5I_GROUP           
2  /foo foobaa H5I_GROUP 
```
### Write to groups

#### Matrix
```r
> A = matrix(1:10,nr=5,nc=2)
> h5write(A,"example.h5","foo/A")
```
#### Multidimesional Array
```r
> B <- array(seq(0.1,2.0,by=0.1),dim=c(5,2,2))
> attr(B,"scale") <- "liter"
> h5write(B,"example.h5","foo/foobaa/B")

> h5ls("example.h5")
        group   name       otype  dclass       dim
0           /    baa   H5I_GROUP                  
1           /    foo   H5I_GROUP                  
2        /foo      A H5I_DATASET INTEGER     5 x 2
3        /foo foobaa   H5I_GROUP                  
4 /foo/foobaa      B H5I_DATASET   FLOAT 5 x 2 x 2
```
### Write a dataset 
```r
> df = data.frame(1L:5L,seq(0,1,length.out = 5), c("ab","cde","fghi","a","s"),stringsAsFactors = FALSE)
> h5write(df,"example.h5","df")
> h5ls("example.h5")
        group   name       otype   dclass       dim
0           /    baa   H5I_GROUP                   
1           /     df H5I_DATASET COMPOUND         5
2           /    foo   H5I_GROUP                   
3        /foo      A H5I_DATASET  INTEGER     5 x 2
4        /foo foobaa   H5I_GROUP                   
5 /foo/foobaa      B H5I_DATASET    FLOAT 5 x 2 x 2
```
### Reading data 
```r
> readA = h5read("example.h5","foo/A")
> readA
     [,1] [,2]
[1,]    1    6
[2,]    2    7
[3,]    3    8
[4,]    4    9
[5,]    5   10
```
```r
> readB = h5read("example.h5","foo/foobaa/B")
> readB
, , 1

     [,1] [,2]
[1,]  0.1  0.6
[2,]  0.2  0.7
[3,]  0.3  0.8
[4,]  0.4  0.9
[5,]  0.5  1.0

, , 2

     [,1] [,2]
[1,]  1.1  1.6
[2,]  1.2  1.7
[3,]  1.3  1.8
[4,]  1.4  1.9
[5,]  1.5  2.0
```
```r
> readdf = h5read("example.h5","df")
> readdf
  X1L.5L seq.0..1..length.out...5. c..ab....cde....fghi....a....s..
1      1                      0.00                               ab
2      2                      0.25                              cde
3      3                      0.50                             fghi
4      4                      0.75                                a
5      5                      1.00                                s
```
