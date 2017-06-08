
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
