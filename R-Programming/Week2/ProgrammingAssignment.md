
Programming Assignment
==========================


Part 1
----------

Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the directory specified in the 'directory' argument and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA. A prototype of the function is as follows

```r
pollutantmean <- function(directory, pollutant, id=1:332) {
    
    if(grep("specdata", directory) == 1) {
        directory <- ("./specdata/")
    }
    
    mvector <- c()
    
    selected_files <- as.character( list.files(directory) )
    
    fp <- paste(directory, selected_files, sep="")
    
    for(i in id) {
        cf <- read.csv(fp[i], header=T, sep=",")
        narm <- cf[!is.na(cf[, pollutant]), pollutant]
        mvector <- c(mvector, narm)
    }
    
    mean(mvector)    
}
```

Test

```r

> pollutantmean("specdata", "sulfate", 1:10)
[1] 4.064128
> pollutantmean("specdata", "nitrate", 70:72)
[1] 1.706047
> pollutantmean("specdata", "nitrate", 23)
[1] 1.280833

```

Part 2
-------------------
Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases. A prototype of this function follows

```r
complete <- function(directory, id = 1:332) {
    
    files <- list.files(directory, full.names = TRUE)
    
    full_data <- lapply(files[id], function(x) read.csv(x, header = TRUE))
    
    nobs <- sapply(full_data, function(x) sum(complete.cases(x)))
    
    data.frame('id' = id, 'nobs' = nobs)
    
    
}
```

Test

```r
> source("complete.R")

> complete("specdata", 1)
  id nobs
1  1  117

> complete("specdata", c(2, 4, 8, 10, 12))
  id nobs
1  2 1041
2  4  474
3  8  192
4 10  148
5 12   96

> complete("specdata", 30:25)
  id nobs
1 30  932
2 29  711
3 28  475
4 27  338
5 26  586
6 25  463

> complete("specdata", 3)
  id nobs
1  3  243
```


Part 3
-------------------
Write a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The function should return a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0. A prototype of this function follows
```r
corr <- function(directory, threshold = 0) {
    
    f <- list.files(directory, full.names = TRUE)
    data <- lapply(f, read.csv, header = TRUE)
    valid_data <- lapply(data, function(x) x[complete.cases(x),])
    
    if (is.null(valid_data) == TRUE){
        numeric(0)
    } else {
        corrs <- numeric(0)
        for (i in seq_along(valid_data)){
            if (nrow(valid_data[[i]]) >= threshold){
                corrs <- c(corrs, cor(valid_data[[i]]$sulfate, valid_data[[i]]$nitrate))
            }
        }
        corrs
    }
    
}
```

Test

```r
> source("corr.R")

> cr <- corr("specdata", 150)
> head(cr)
[1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814

> summary(cr)
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.21060 -0.05147  0.09333  0.12400  0.26840  0.76310 

> cr <- corr("specdata", 400)
> head(cr)
[1] -0.01895754 -0.04389737 -0.06815956 -0.07588814  0.76312884 -0.15782860
> summary(cr)
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.17620 -0.03109  0.10020  0.13970  0.26850  0.76310 

> cr <- corr("specdata", 5000)
> summary(cr)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
                                                
> length(cr)
[1] 0

> cr <- corr("specdata")
> summary(cr)
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max.     NA's 
-1.00000 -0.05282  0.10720  0.13680  0.27830  1.00000        9 
> length(cr)
[1] 332
```
