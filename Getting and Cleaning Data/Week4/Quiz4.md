

## Question 1

The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv

and load the data into R. The code book, describing the variable names is here:

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf

Apply strsplit() to split all the names of the data frame on the characters “wgtp”. What is the value of the 123 element of the resulting list?

```r
> download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "quiz4data.csv")
trying URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
Content type 'text/csv' length 4246554 bytes (4.0 MB)
==================================================
downloaded 4.0 MB

> d <- read.csv("quiz4data.csv")
> head(d)
```
```r
> strsplit(names(d), split = "wgtp")[123]
[[1]]
[1] ""   "15"
```

## Question 2

Load the Gross Domestic Product data for the 190 ranked countries in this data set:

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv

Remove the commas from the GDP numbers in millions of dollars and average them. What is the average?

Original data sources:

http://data.worldbank.org/data-catalog/GDP-ranking-table

```r
> download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "quiz4data.csv")
trying URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
Content type 'text/csv' length 9630 bytes
==================================================
downloaded 9630 bytes

> data <- read.csv("quiz4data.csv")
> head(data)
    X Gross.domestic.product.2012 X.1           X.2          X.3 X.4 X.5 X.6 X.7 X.8
1                                  NA                                 NA  NA  NA  NA
2                                  NA               (millions of      NA  NA  NA  NA
3                         Ranking  NA       Economy  US dollars)      NA  NA  NA  NA
4                                  NA                                 NA  NA  NA  NA
5 USA                           1  NA United States  16,244,600       NA  NA  NA  NA
6 CHN                           2  NA         China   8,227,103       NA  NA  NA  NA
> 

```

```r
> clean <- gsub(",","",data[,5])
> head(clean,3)
[1] ""             "(millions of" "US dollars)" 
> head(clean,10)
 [1] ""             "(millions of" "US dollars)"  ""             " 16244600 "   " 8227103 "   
 [7] " 5959718 "    " 3428131 "    " 2612878 "    " 2471784 "   
```
```r
> mean(as.numeric(clean[1:215]),na.rm = TRUE)
[1] 377652.4
```

## Question 3

In the data set from Question 2 what is a regular expression that would allow you to count the number of countries whose name begins with "United"? Assume that the variable with the country names in it is named countryNames. How many countries begin with United?

```r
grep("^United",countryNames), 3
```

## Question 4

Load the Gross Domestic Product data for the 190 ranked countries in this data set:

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv

Load the educational data from this data set:

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv

Match the data based on the country shortcode. Of the countries for which the end of the fiscal year is available, how many end in June?


## Question 5

You can use the quantmod (http://www.quantmod.com/) package to get historical stock prices for publicly traded companies on the NASDAQ and NYSE. Use the following code to download data on Amazon’s stock price and get the times the data was sampled.
```r
library(quantmod)
library(lubridate)
```
```r
amzn = getSymbols("AMZN",auto.assign=FALSE)

sampleTimes = index(amzn)
length(grep("^2012",sampleTimes))
sampleTimes[grep("^2012",sampleTimes)]
```
```r
sum(weekdays(as.Date(sampleTimes[grep("^2012",sampleTimes)]))=="Monday")
```



```r
> download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "quiz4data2.csv")
trying URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
Content type 'text/csv' length 9630 bytes
==================================================
downloaded 9630 bytes

> 
> download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile = "quiz4data3.csv")
trying URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
Content type 'text/csv' length 59792 bytes (58 KB)
==================================================
downloaded 58 KB
```
```r
> data2 <- read.csv("quiz4data2.csv")
> data3 <- read.csv("quiz4data3.csv")
> 
> setnames(data2, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", "Long.Name", "gdp"))

> 
> all <- merge(data2, data3, by = "CountryCode")
> 
> table(grepl("june", tolower(all$Special.Notes)), grepl("fiscal year end", tolower(all$Special.Notes)))[4]
```
