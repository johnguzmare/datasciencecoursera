
Week 1 - Quiz 1
==============

Question 1
--------------------
The American Community Survey distributes downloadable data about United States communities. 
Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv

and load the data into R. The code book, describing the variable names is here:

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf

How many properties are worth $1,000,000 or more?

Answer

53

Download and load file

```r
> fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
> download.file(fileUrl, destfile="housing.csv", method="curl")
```

Explanation

```r
> hdata <- read.table("housing.csv", sep=",", header=TRUE)
> sum(!is.na(hdata$VAL[hdata$VAL==24]))
> [1] 53
```
or

```r
> hdata <- data.table(read.csv("housing.csv"))
> setkey(hdata, VAL)
> hdata[, .N, key(dt)]
> [1] 53

```

Question 2
-----------------
Use the data you loaded from Question 1. Consider the variable FES in the code book. Which of the "tidy data" principles does this variable violate?

Answer

Tidy data has one variable per column.

You can not get the answer using just the data file 

```r
> fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
> download.file(fileUrl, destfile="housing.csv", method="curl")
> hdata <- read.table("housing.csv", sep=",", header=TRUE)
> hdata$FES
```

You have to check the variable description in the code book to notice FES column represent 
several variables 


Question 3
-----------------
Download the Excel spreadsheet on Natural Gas Aquisition Program here:

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx

Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:

dat

What is the value of:

sum(dat$Zip*dat$Ext,na.rm=T)
(original data source: http://catalog.data.gov/dataset/natural-gas-acquisition-program)

Answer

36534720

Explanation

```r
> fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
> download.file(fileUrl, destfile="./data/nga.xlsx", method="curl")
> dateDownloaded <- date()
> library(xlsx)
> colIndex <- 7:15
> rowIndex <- 18:23
> dat <- read.xlsx("./data/nga.xlsx", sheetIndex=1, header=TRUE, colIndex=colIndex, rowIndex=rowIndex)
> sum(dat$Zip*dat$Ext,na.rm=T)
> [1] 36534720
```

Question 4
-----------------
Read the XML data on Baltimore restaurants from here:

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml

How many restaurants have zipcode 21231?

Answer

127

Explanation

```r
> fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
> doc <- xmlTreeParse(fileUrl, useInternal=TRUE)
> rootNode <- xmlRoot(doc)
> sum(xpathSApply(rootNode, "//zipcode", xmlValue)==21231)
> [1] 127
```

Question 5
-------------------
The American Community Survey distributes downloadable data about United States communities. 
Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv

using the fread() command load the data into an R object

DT
Which of the following is the fastest way to calculate the average value of the variable

pwgtp15
broken down by sex using the data.table package?

Answer

DT[,mean(pwgtp15),by=SEX]

Explanation

You have to run every statement at least twice to get the lowest output time 

```r

> fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
> download.file(fileUrl, destfile="hdata.csv", method="curl")
> DT <- fread("hdata.csv")
> file.info("hdata.csv")$size
> system.time(DT[,mean(pwgtp15),by=SEX])
> system.time(mean(DT[DT$SEX==1,]$pwgtp15))+system.time(mean(DT[DT$SEX==2,]$pwgtp15))
> system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
> system.time(mean(DT$pwgtp15,by=DT$SEX))
> system.time(tapply(DT$pwgtp15,DT$SEX,mean))
> system.time(rowMeans(DT)[DT$SEX==1])+system.time(rowMeans(DT)[DT$SEX==2])

```
