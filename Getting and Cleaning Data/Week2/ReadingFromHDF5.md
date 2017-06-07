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
```r
`Matrix`
> A = matrix(1:10,nr=5,nc=2)
> h5write(A,"example.h5","foo/A")

`Multidimesional Array`
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

