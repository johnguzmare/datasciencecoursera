Reading from MySQL
=========================

### Install MySQL on mac


download mysql pkg

```r
cd /usr/local/mysql/bin/
./mysql -u root -p
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('aQ9819000.');
ALTER USER 'root'@'localhost' PASSWORD EXPIRE NEVER;
```
Install pre-requisite for R connector

```r
brew install mariadb-connector-c
```

### Install and load on R Studio

```r
> install.packages("RMySQL")
> library("RMySQL")
Loading required package: DBI
```

### Connect to sample database
```r
> ucsc <- dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu")
> result <- dbGetQuery(ucsc,"show databases;");
```
```r
> head(result)
            Database
1 information_schema
2            ailMel1
3            allMis1
4            anoCar1
5            anoCar2
6            anoGam1
```
```r
> dbDisconnect(ucsc)
[1] TRUE
```

### Connect to specific database
```r
> ucsc <- dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu", db="hg19")
```

### Get table names
```r
> allTables <- dbListTables(ucsc)
> head(allTables)
[1] "HInv"         "HInvGeneMrna" "acembly"      "acemblyClass" "acemblyPep"  
[6] "affyCytoScan"

> length(allTables)
[1] 11040

> allTables [1:5]
[1] "HInv"         "HInvGeneMrna" "acembly"      "acemblyClass" "acemblyPep"  
```

### Get table fields
```r
> dbListFields(ucsc,"HInvGeneMrna")
 [1] "bin"         "matches"     "misMatches"  "repMatches"  "nCount"      "qNumInsert" 
 [7] "qBaseInsert" "tNumInsert"  "tBaseInsert" "strand"      "qName"       "qSize"      
[13] "qStart"      "qEnd"        "tName"       "tSize"       "tStart"      "tEnd"       
[19] "blockCount"  "blockSizes"  "qStarts"     "tStarts" 
   
> dbListFields(ucsc,"affyU133Plus2")
 [1] "bin"         "matches"     "misMatches"  "repMatches"  "nCount"      "qNumInsert" 
 [7] "qBaseInsert" "tNumInsert"  "tBaseInsert" "strand"      "qName"       "qSize"      
[13] "qStart"      "qEnd"        "tName"       "tSize"       "tStart"      "tEnd"       
[19] "blockCount"  "blockSizes"  "qStarts"     "tStarts"    
```
### Query a table
```r
> dbGetQuery(ucsc,"select count(*) from affyU133Plus2")
  count(*)
1    58463
```
```r
> result <- dbReadTable(ucsc,"affyU133Plus2")
> head(result)
  bin matches misMatches repMatches nCount qNumInsert qBaseInsert tNumInsert
1 585     530          4          0     23          3          41          3
2 585    3355         17          0    109          9          67          9
3 585    4156         14          0     83         16          18          2
4 585    4667          9          0     68         21          42          3
5 585    5180         14          0    167         10          38          1
6 585     468          5          0     14          0           0          0
```
### Fetch queries
```r
> ucsc <- dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu", db="hg19")
> query <- dbSendQuery(ucsc,"select * from affyU133Plus2 where misMatches between 1 and 3")
There were 16 warnings (use warnings() to see them)
> affyMis <- fetch(query);
> dim(affyMis)
[1] 500  22
> quantile(affyMis$misMatches)
  0%  25%  50%  75% 100% 
   1    1    2    2    3 
> affyMis$misMatches
  [1] 3 2 3 1 1 1 3 3 1 1 1 1 3 1 3 1 1 2 2 1 2 2 2 2 2 3 3 2 3 3 3 1 1 3 3 1 1 2 2 2 1
 [42] 1 2 2 1 1 3 3 1 1 1 1 1 3 3 1 1 2 3 3 1 1 1 3 2 2 3 1 3 3 2 1 2 3 2 1 2 3 1 2 2 1
 [83] 2 1 1 1 2 1 2 1 1 2 1 2 1 3 1 1 1 1 2 2 1 1 1 1 1 3 2 3 1 1 3 3 3 1 3 1 1 1 2 1 2
[124] 2 2 2 2 2 1 1 2 2 2 1 1 1 3 1 2 3 1 1 2 2 2 1 1 1 1 1 2 2 3 2 1 1 1 1 1 1 3 1 1 1
[165] 3 3 1 1 1 2 2 3 1 3 3 3 3 1 3 2 3 1 3 2 2 3 1 2 3 1 1 1 2 3 1 2 1 1 3 3 3 2 1 1 3
[206] 3 1 1 1 3 1 1 3 1 1 2 1 1 1 1 3 3 3 2 2 2 1 3 3 1 1 1 2 2 1 1 1 1 3 3 3 1 1 1 1 1
[247] 2 2 1 1 1 3 2 2 3 1 2 2 2 3 2 3 1 1 2 2 1 2 1 2 1 1 1 1 2 1 1 1 3 2 1 2 2 3 1 3 3
[288] 1 2 1 2 3 1 2 3 1 1 1 1 3 2 3 2 1 1 1 3 1 3 1 1 2 3 1 1 3 2 2 2 1 3 1 1 2 2 1 1 1
[329] 1 2 2 1 2 1 1 2 1 2 2 1 2 2 3 1 1 1 1 2 3 1 1 3 2 1 1 3 1 2 1 2 1 1 3 3 1 2 1 2 1
[370] 2 1 2 3 1 2 2 2 2 2 3 1 1 2 1 3 2 1 3 1 2 2 2 1 2 1 3 3 1 2 1 1 1 2 1 1 1 1 1 3 3
[411] 3 3 3 2 1 1 1 1 3 3 3 3 1 1 3 2 2 1 1 2 2 2 1 1 2 2 2 2 3 3 1 2 2 1 3 3 2 1 2 1 3
[452] 1 3 1 1 3 3 1 1 2 2 1 2 2 2 1 1 1 1 3 1 1 2 1 1 3 2 1 1 1 1 1 2 1 2 2 3 3 2 1 1 3
[493] 2 1 2 3 3 1 1 2
```
```r
> affMisSmall <- fetch(query,n=10);

> dim(affMisSmall)
[1] 10 22

> quantile(affMisSmall$misMatches)
  0%  25%  50%  75% 100% 
   1    1    2    3    3 
```

### Aditional resources

http://www.r-bloggers.com/mysql-and-r/
