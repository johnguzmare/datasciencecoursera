
Summarizing data
==================

Example dataset
---

```r
> fileUrl<-"https://data.baltimorecity.gov/Culture-Arts/Restaurants/k5ry-ef3g?accessType=DOWNLOAD"
> download.file(fileUrl,destfile = "./data/restaurants.csv",method = "curl")
```

Look a bit of data
---

```r
> restData <- read.csv("Restaurants.csv")
> head(restData,n=3)

   name zipCode neighborhood councilDistrict policeDistrict
1   410   21206    Frankford               2   NORTHEASTERN
2  1919   21231  Fells Point               1   SOUTHEASTERN
3 SAUTE   21224       Canton               1   SOUTHEASTERN
                         Location.1
1 4509 BELAIR ROAD\nBaltimore, MD\n
2    1919 FLEET ST\nBaltimore, MD\n
3   2844 HUDSON ST\nBaltimore, MD\n
> tail(restData,n=3)
             name zipCode  neighborhood councilDistrict
1325 ZINK'S CAFÂ    21213 Belair-Edison              13
1326 ZISSIMOS BAR   21211       Hampden               7
1327       ZORBAS   21224     Greektown               2
     policeDistrict                         Location.1
1325   NORTHEASTERN 3300 LAWNVIEW AVE\nBaltimore, MD\n
1326       NORTHERN      1023 36TH ST\nBaltimore, MD\n
1327   SOUTHEASTERN  4710 EASTERN Ave\nBaltimore, MD\n
> 
```
```r
> summary(restData)
                           name         zipCode      
 MCDONALD'S                  :   8   Min.   :-21226  
 POPEYES FAMOUS FRIED CHICKEN:   7   1st Qu.: 21202  
 SUBWAY                      :   6   Median : 21218  
 KENTUCKY FRIED CHICKEN      :   5   Mean   : 21185  
 BURGER KING                 :   4   3rd Qu.: 21226  
 DUNKIN DONUTS               :   4   Max.   : 21287  
 (Other)                     :1293                   
       neighborhood councilDistrict       policeDistrict
 Downtown    :128   Min.   : 1.000   SOUTHEASTERN:385   
 Fells Point : 91   1st Qu.: 2.000   CENTRAL     :288   
 Inner Harbor: 89   Median : 9.000   SOUTHERN    :213   
 Canton      : 81   Mean   : 7.191   NORTHERN    :157   
 Federal Hill: 42   3rd Qu.:11.000   NORTHEASTERN: 72   
 Mount Vernon: 33   Max.   :14.000   EASTERN     : 67   
 (Other)     :863                    (Other)     :145   
                          Location.1    
 1101 RUSSELL ST\nBaltimore, MD\n:   9  
 201 PRATT ST\nBaltimore, MD\n   :   8  
 2400 BOSTON ST\nBaltimore, MD\n :   8  
 300 LIGHT ST\nBaltimore, MD\n   :   5  
 300 CHARLES ST\nBaltimore, MD\n :   4  
 301 LIGHT ST\nBaltimore, MD\n   :   4  
 (Other)                         :1289  
```
```r
 > str(restData)
'data.frame':	1327 obs. of  6 variables:
 $ name           : Factor w/ 1277 levels "#1 CHINESE KITCHEN",..: 9 3 992 1 2 4 5 6 7 8 ...
 $ zipCode        : int  21206 21231 21224 21211 21223 21218 21205 21211 21205 21231 ...
 $ neighborhood   : Factor w/ 173 levels "Abell","Arlington",..: 53 52 18 66 104 33 98 133 98 157 ...
 $ councilDistrict: int  2 1 1 14 9 14 13 7 13 1 ...
 $ policeDistrict : Factor w/ 9 levels "CENTRAL","EASTERN",..: 3 6 6 4 8 3 6 4 6 6 ...
 $ Location.1     : Factor w/ 1210 levels "1 BIDDLE ST\nBaltimore, MD\n",..: 835 334 554 755 492 537 505 530 507 569 ...
>
```

Quantile and Quantitative variables
----
```r
> quantile(restData$councilDistrict,na.rm = TRUE)
  0%  25%  50%  75% 100% 
   1    2    9   11   14 
> quantile(restData$councilDistrict,probs = c(0.5,0.75,0.9))
50% 75% 90% 
  9  11  12 
```

Make a tables for specific variables 
-----

(1 dimension)
Try to include NA values in counters

```r
> table(restData$zipCode,useNA = "ifany")

-21226  21201  21202  21205  21206  21207  21208  21209  21210  21211  21212  21213  21214  21215  21216  21217  21218 
     1    136    201     27     30      4      1      8     23     41     28     31     17     54     10     32     69 
 21220  21222  21223  21224  21225  21226  21227  21229  21230  21231  21234  21237  21239  21251  21287 
     1      7     56    199     19     18      4     13    156    127      7      1      3      2      1 
```

(2 dimension)

```r
> table(restData$councilDistrict, restData$zipCode)
    
     -21226 21201 21202 21205 21206 21207 21208 21209 21210 21211 21212 21213 21214 21215 21216 21217 21218 21220 21222
  1       0     0    37     0     0     0     0     0     0     0     0     2     0     0     0     0     0     0     7
  2       0     0     0     3    27     0     0     0     0     0     0     0     0     0     0     0     0     0     0
  3       0     0     0     0     0     0     0     0     0     0     0     2    17     0     0     0     3     0     0
  4       0     0     0     0     0     0     0     0     0     0    27     0     0     0     0     0     0     0     0
  5       0     0     0     0     0     3     0     6     0     0     0     0     0    31     0     0     0     0     0
  6       0     0     0     0     0     0     0     1    19     0     0     0     0    15     1     0     0     0     0
  7       0     0     0     0     0     0     0     1     0    27     0     0     0     6     7    15     6     0     0
  8       0     0     0     0     0     1     0     0     0     0     0     0     0     0     0     0     0     0     0
  9       0     1     0     0     0     0     0     0     0     0     0     0     0     0     2     8     0     0     0
  10      1     0     1     0     0     0     0     0     0     0     0     0     0     0     0     0     0     1     0
  11      0   115   139     0     0     0     1     0     0     0     1     0     0     0     0     9     0     0     0
  12      0    20    24     4     0     0     0     0     0     0     0    13     0     0     0     0    26     0     0
  13      0     0     0    20     3     0     0     0     0     0     0    13     0     1     0     0     0     0     0
  14      0     0     0     0     0     0     0     0     4    14     0     1     0     1     0     0    34     0     0
```
  

Check for missing values
----

```r
> sum(is.na(restData$councilDistrict))
[1] 0
> any(is.na(restData$councilDistrict))
[1] FALSE
> all(restData$zipCode>0)
[1] FALSE
```


Check NA in columns
----

```r
> colSums(is.na(restData))
           name         zipCode    neighborhood councilDistrict  policeDistrict      Location.1 
              0               0               0               0               0               0 

> all(colSums(is.na(restData))==0)
[1] TRUE
```


Check specific characteristics
----
```r
> table(restData$zipCode %in% c("21212"))

FALSE  TRUE 
 1299    28 
> table(restData$zipCode %in% c("21212","21213"))

FALSE  TRUE 
 1268    59 
 ```

Cross Tabs
----

Flat tables
```r
ftable()
```
Creating new variables
-----


Sub set variables
```r
> s1 <- seq(1,10,by=2);s1
[1] 1 3 5 7 9
> s2 <- seq(1,10,by=3);s2
[1]  1  4  7 10
> x <- c(1,3,8,25,100);seq(along=x)
[1] 1 2 3 4 5
> 

> restData$nearMe = restData$neighborhood %in% c("Rolland Park","Homeland")
> table(restData$nearMe)

FALSE  TRUE 
 1323     4 
 
> restData$nearMe = restData$neighborhood %in% c("Roland Park","Homeland")
> table(restData$nearMe)

FALSE  TRUE 
 1314    13 
> 
```

Binary variables
-----
```r
> restData$zipWrong = ifelse(restData$zipCode<0,TRUE,FALSE)
> table(restData$zipWrong,restData$zipCode<0)
       
        FALSE TRUE
  FALSE  1326    0
  TRUE      0    1
> head(restData)
                   name zipCode neighborhood councilDistrict policeDistrict                          Location.1 nearMe
1                   410   21206    Frankford               2   NORTHEASTERN   4509 BELAIR ROAD\nBaltimore, MD\n  FALSE
2                  1919   21231  Fells Point               1   SOUTHEASTERN      1919 FLEET ST\nBaltimore, MD\n  FALSE
3                 SAUTE   21224       Canton               1   SOUTHEASTERN     2844 HUDSON ST\nBaltimore, MD\n  FALSE
4    #1 CHINESE KITCHEN   21211      Hampden              14       NORTHERN    3998 ROLAND AVE\nBaltimore, MD\n  FALSE
5 #1 chinese restaurant   21223     Millhill               9   SOUTHWESTERN 2481 frederick ave\nBaltimore, MD\n  FALSE
6             19TH HOLE   21218 Clifton Park              14   NORTHEASTERN    2722 HARFORD RD\nBaltimore, MD\n  FALSE
  zipWrong
1    FALSE
2    FALSE
3    FALSE
4    FALSE
5    FALSE
6    FALSE
```


Categorical variables
-----


cutting
```r
> restData$zipGroups = cut(restData$zipCode,breaks=quantile(restData$zipCode))
```

Easier cutting

```r
> install.packages("Hmisc")
> library(Hmisc)
> restData$zipGroups = cut2(restData$zipCode,g=4)
> table(restData$zipGroups)

[-21226,21205) [ 21205,21220) [ 21220,21227) [ 21227,21287] 
           338            375            300            314 
```

```r
> head(restData)

  zipWrong      zipGroups
1    FALSE [ 21205,21220)
2    FALSE [ 21227,21287]
3    FALSE [ 21220,21227)
4    FALSE [ 21205,21220)
5    FALSE [ 21220,21227)
6    FALSE [ 21205,21220)
```

Factor variables
----

```r
> restData$zcf <- factor(restData$zipCode)
> restData$zcf[1:10]
 [1] 21206 21231 21224 21211 21223 21218 21205 21211 21205 21231
32 Levels: -21226 21201 21202 21205 21206 21207 21208 21209 21210 21211 21212 21213 21214 21215 21216 21217 ... 21287
> class(restData$zcf)
[1] "factor"
```


Using mutate function
----

```r
> library(Hmisc)
library(plyr)

restData2 = mutate(resData,zipGroups=cut2(zipCode,g=4))
table(restData2$zipGroups)

```
