Practical R Exercises in swirl
========

Lesson 1: Manipulating Data with dplyr
----

| I've created a variable called path2csv, which contains the full file
| path to the dataset. Call read.csv() with two arguments, path2csv and
| stringsAsFactors = FALSE, and save the result in a new variable called
| mydf. Check ?read.csv if you need help.

```r
> mydf <- read.csv(path2csv,stringsAsFactors = FALSE)

> dim(mydf)
[1] 225468     11

```

| Now use head() to preview the data.

```r
> head(mydf)
  X       date     time   size r_version r_arch      r_os      package
1 1 2014-07-08 00:54:41  80589     3.1.0 x86_64   mingw32    htmltools
2 2 2014-07-08 00:59:53 321767     3.1.0 x86_64   mingw32      tseries
3 3 2014-07-08 00:47:13 748063     3.1.0 x86_64 linux-gnu        party
4 4 2014-07-08 00:48:05 606104     3.1.0 x86_64 linux-gnu        Hmisc
5 5 2014-07-08 00:46:50  79825     3.0.2 x86_64 linux-gnu       digest
6 6 2014-07-08 00:48:04  77681     3.1.0 x86_64 linux-gnu randomForest
  version country ip_id
1   0.2.4      US     1
2 0.10-32      US     2
3  1.0-15      US     3
4  3.14-4      US     3
5   0.6.4      CA     4
6   4.6-7      US     3

```

| The dplyr package was automatically installed (if necessary) and loaded
| at the beginning of this lesson. Normally, this is something you would
| have to do on your own. Just to build the habit, type library(dplyr)
| now to load the package again.

```r
> library(dplyr)

```

| It's important that you have dplyr version 0.4.0 or later. To confirm
| this, type packageVersion("dplyr").


```r
> packageVersion("dplyr")
[1] ‘0.5.0’

```

| The first step of working with data in dplyr is to load the data into
| what the package authors call a 'data frame tbl' or 'tbl_df'. Use the
| following code to create a new tbl_df called cran:
| 
| cran <- tbl_df(mydf).


```r
> cran <- tbl_df(mydf)

```

| To avoid confusion and keep things running smoothly, let's remove the
| original data frame from your workspace with rm("mydf").


```r
> rm("mydf")

```

| From ?tbl_df, "The main advantage to using a tbl_df over a regular data
| frame is the printing." Let's see what is meant by this. Type cran to
| print our tbl_df to the console.

```r
> cran
# A tibble: 225,468 x 11
       X       date     time    size r_version r_arch      r_os
   <int>      <chr>    <chr>   <int>     <chr>  <chr>     <chr>
 1     1 2014-07-08 00:54:41   80589     3.1.0 x86_64   mingw32
 2     2 2014-07-08 00:59:53  321767     3.1.0 x86_64   mingw32
 3     3 2014-07-08 00:47:13  748063     3.1.0 x86_64 linux-gnu
 4     4 2014-07-08 00:48:05  606104     3.1.0 x86_64 linux-gnu
 5     5 2014-07-08 00:46:50   79825     3.0.2 x86_64 linux-gnu
 6     6 2014-07-08 00:48:04   77681     3.1.0 x86_64 linux-gnu
 7     7 2014-07-08 00:48:35  393754     3.1.0 x86_64 linux-gnu
 8     8 2014-07-08 00:47:30   28216     3.0.2 x86_64 linux-gnu
 9     9 2014-07-08 00:54:58    5928      <NA>   <NA>      <NA>
10    10 2014-07-08 00:15:35 2206029     3.0.2 x86_64 linux-gnu
# ... with 225,458 more rows, and 4 more variables: package <chr>,
#   version <chr>, country <chr>, ip_id <int>

```

| According to the "Introduction to dplyr" vignette written by the
| package authors, "The dplyr philosophy is to have small functions that
| each do one thing well." Specifically, dplyr supplies five 'verbs' that
| cover most fundamental data manipulation tasks: 

* select()
* filter()
* arrange()
* mutate()
* summarize()


Select Function
----

| As may often be the case, particularly with larger datasets, we are
| only interested in some of the variables. Use select(cran, ip_id,
| package, country) to select only the ip_id, package, and country
| variables from the cran dataset.


```r
> select(cran, ip_id, package, country) 
# A tibble: 225,468 x 3
   ip_id      package country
   <int>        <chr>   <chr>
 1     1    htmltools      US
 2     2      tseries      US
 3     3        party      US
 4     3        Hmisc      US
 5     4       digest      CA
 6     3 randomForest      US
 7     3         plyr      US
 8     5      whisker      US
 9     6         Rcpp      CN
10     7     hflights      US
# ... with 225,458 more rows

```

| The first thing to notice is that we don't have to type cran$ip_id,
| cran$package, and cran$country, as we normally would when referring to
| columns of a data frame. The select() function knows we are referring
| to columns of the cran dataset.

| Also, note that the columns are returned to us in the order we
| specified, even though ip_id is the rightmost column in the original
| dataset.

| Normally, this notation is reserved for numbers, but select() allows
| you to specify a sequence of columns this way, which can save a bunch
| of typing. Use select(cran, r_arch:country) to select all columns
| starting from r_arch and ending with country.

```r
> select(cran, r_arch:country)
# A tibble: 225,468 x 5
   r_arch      r_os      package version country
    <chr>     <chr>        <chr>   <chr>   <chr>
 1 x86_64   mingw32    htmltools   0.2.4      US
 2 x86_64   mingw32      tseries 0.10-32      US
 3 x86_64 linux-gnu        party  1.0-15      US
 4 x86_64 linux-gnu        Hmisc  3.14-4      US
 5 x86_64 linux-gnu       digest   0.6.4      CA
 6 x86_64 linux-gnu randomForest   4.6-7      US
 7 x86_64 linux-gnu         plyr   1.8.1      US
 8 x86_64 linux-gnu      whisker   0.3-2      US
 9   <NA>      <NA>         Rcpp  0.10.4      CN
10 x86_64 linux-gnu     hflights     0.1      US
# ... with 225,458 more rows

```
| We can also select the same columns in reverse order. Give it a try.

```r
> select(cran, country:r_arch)
# A tibble: 225,468 x 5
   country version      package      r_os r_arch
     <chr>   <chr>        <chr>     <chr>  <chr>
 1      US   0.2.4    htmltools   mingw32 x86_64
 2      US 0.10-32      tseries   mingw32 x86_64
 3      US  1.0-15        party linux-gnu x86_64
 4      US  3.14-4        Hmisc linux-gnu x86_64
 5      CA   0.6.4       digest linux-gnu x86_64
 6      US   4.6-7 randomForest linux-gnu x86_64
 7      US   1.8.1         plyr linux-gnu x86_64
 8      US   0.3-2      whisker linux-gnu x86_64
 9      CN  0.10.4         Rcpp      <NA>   <NA>
10      US     0.1     hflights linux-gnu x86_64
# ... with 225,458 more rows

```

| Instead of specifying the columns we want to keep, we can also specify
| the columns we want to throw away. To see how this works, do
| select(cran, -time) to omit the time column.


```r
> select(cran, -time) 
# A tibble: 225,468 x 10
       X       date    size r_version r_arch      r_os      package
   <int>      <chr>   <int>     <chr>  <chr>     <chr>        <chr>
 1     1 2014-07-08   80589     3.1.0 x86_64   mingw32    htmltools
 2     2 2014-07-08  321767     3.1.0 x86_64   mingw32      tseries
 3     3 2014-07-08  748063     3.1.0 x86_64 linux-gnu        party
 4     4 2014-07-08  606104     3.1.0 x86_64 linux-gnu        Hmisc
 5     5 2014-07-08   79825     3.0.2 x86_64 linux-gnu       digest
 6     6 2014-07-08   77681     3.1.0 x86_64 linux-gnu randomForest
 7     7 2014-07-08  393754     3.1.0 x86_64 linux-gnu         plyr
 8     8 2014-07-08   28216     3.0.2 x86_64 linux-gnu      whisker
 9     9 2014-07-08    5928      <NA>   <NA>      <NA>         Rcpp
10    10 2014-07-08 2206029     3.0.2 x86_64 linux-gnu     hflights
# ... with 225,458 more rows, and 3 more variables: version <chr>,
#   country <chr>, ip_id <int>

```

| Use this knowledge to omit all columns X:size using select().

```r
> select(cran, -(X:size)) 
# A tibble: 225,468 x 7
   r_version r_arch      r_os      package version country ip_id
       <chr>  <chr>     <chr>        <chr>   <chr>   <chr> <int>
 1     3.1.0 x86_64   mingw32    htmltools   0.2.4      US     1
 2     3.1.0 x86_64   mingw32      tseries 0.10-32      US     2
 3     3.1.0 x86_64 linux-gnu        party  1.0-15      US     3
 4     3.1.0 x86_64 linux-gnu        Hmisc  3.14-4      US     3
 5     3.0.2 x86_64 linux-gnu       digest   0.6.4      CA     4
 6     3.1.0 x86_64 linux-gnu randomForest   4.6-7      US     3
 7     3.1.0 x86_64 linux-gnu         plyr   1.8.1      US     3
 8     3.0.2 x86_64 linux-gnu      whisker   0.3-2      US     5
 9      <NA>   <NA>      <NA>         Rcpp  0.10.4      CN     6
10     3.0.2 x86_64 linux-gnu     hflights     0.1      US     7
# ... with 225,458 more rows


```
| Now that you know how to select a subset of columns using select(), a
| natural next question is "How do I select a subset of rows?" That's
| where the filter() function comes in.

filter function
-----------------

| Use filter(cran, package == "swirl") to select all rows for which the
| package variable is equal to "swirl". Be sure to use two equals signs
| side-by-side!


```r 
> filter(cran, package == "swirl")
# A tibble: 820 x 11
       X       date     time   size r_version r_arch         r_os package
   <int>      <chr>    <chr>  <int>     <chr>  <chr>        <chr>   <chr>
 1    27 2014-07-08 00:17:16 105350     3.0.2 x86_64      mingw32   swirl
 2   156 2014-07-08 00:22:53  41261     3.1.0 x86_64    linux-gnu   swirl
 3   358 2014-07-08 00:13:42 105335    2.15.2 x86_64      mingw32   swirl
 4   593 2014-07-08 00:59:45 105465     3.1.0 x86_64 darwin13.1.0   swirl
 5   831 2014-07-08 00:55:27 105335     3.0.3 x86_64      mingw32   swirl
 6   997 2014-07-08 00:33:06  41261     3.1.0 x86_64      mingw32   swirl
 7  1023 2014-07-08 00:35:36 106393     3.1.0 x86_64      mingw32   swirl
 8  1144 2014-07-08 00:00:39 106534     3.0.2 x86_64    linux-gnu   swirl
 9  1402 2014-07-08 00:41:41  41261     3.1.0   i386      mingw32   swirl
10  1424 2014-07-08 00:44:49 106393     3.1.0 x86_64    linux-gnu   swirl
# ... with 810 more rows, and 3 more variables: version <chr>,
#   country <chr>, ip_id <int>

```

| You can specify as many conditions as you want, separated by commas.
| For example filter(cran, r_version == "3.1.1", country == "US") will
| return all rows of cran corresponding to downloads from users in the US
| running R version 3.1.1. Try it out.

```r

> filter(cran, r_version == "3.1.1", country == "US") 
# A tibble: 1,588 x 11
       X       date     time    size r_version r_arch         r_os
   <int>      <chr>    <chr>   <int>     <chr>  <chr>        <chr>
 1  2216 2014-07-08 00:48:58  385112     3.1.1 x86_64 darwin13.1.0
 2 17332 2014-07-08 03:39:57  197459     3.1.1 x86_64 darwin13.1.0
 3 17465 2014-07-08 03:25:38   23259     3.1.1 x86_64 darwin13.1.0
 4 18844 2014-07-08 03:59:17  190594     3.1.1 x86_64 darwin13.1.0
 5 30182 2014-07-08 04:13:15   77683     3.1.1   i386      mingw32
 6 30193 2014-07-08 04:06:26 2351969     3.1.1   i386      mingw32
 7 30195 2014-07-08 04:07:09  299080     3.1.1   i386      mingw32
 8 30217 2014-07-08 04:32:04  568036     3.1.1   i386      mingw32
 9 30245 2014-07-08 04:10:41  526858     3.1.1   i386      mingw32
10 30354 2014-07-08 04:32:51 1763717     3.1.1   i386      mingw32
# ... with 1,578 more rows, and 4 more variables: package <chr>,
#   version <chr>, country <chr>, ip_id <int>

```

| Edit your previous call to filter() to instead return rows
| corresponding to users in "IN" (India) running an R version that is
| less than or equal to "3.0.2". The up arrow on your keyboard may come
| in handy here. Don't forget your double quotes!


```r
> filter(cran, r_version <= "3.0.2", country == "IN") 
# A tibble: 4,139 x 11
       X       date     time     size r_version r_arch      r_os
   <int>      <chr>    <chr>    <int>     <chr>  <chr>     <chr>
 1   348 2014-07-08 00:44:04 10218907     3.0.0 x86_64   mingw32
 2  9990 2014-07-08 02:11:32   397497     3.0.2 x86_64 linux-gnu
 3  9991 2014-07-08 02:11:32   119199     3.0.2 x86_64 linux-gnu
 4  9992 2014-07-08 02:11:33    81779     3.0.2 x86_64 linux-gnu
 5 10022 2014-07-08 02:19:45  1557078    2.15.0 x86_64   mingw32
 6 10023 2014-07-08 02:19:46  1184285    2.15.1   i686 linux-gnu
 7 10189 2014-07-08 02:38:06   908854     3.0.2 x86_64 linux-gnu
 8 10199 2014-07-08 02:38:28   178436     3.0.2 x86_64 linux-gnu
 9 10200 2014-07-08 02:38:29    51811     3.0.2 x86_64 linux-gnu
10 10201 2014-07-08 02:38:29    65245     3.0.2 x86_64 linux-gnu
# ... with 4,129 more rows, and 4 more variables: package <chr>,
#   version <chr>, country <chr>, ip_id <int>

```

| Our last two calls to filter() requested all rows for which some
| condition AND another condition were TRUE. We can also request rows for
| which EITHER one condition OR another condition are TRUE. For example,
| filter(cran, country == "US" | country == "IN") will gives us all rows
| for which the country variable equals either "US" or "IN". Give it a
| go.

```r
> filter(cran, country == "US" | country == "IN")
# A tibble: 95,283 x 11
       X       date     time    size r_version r_arch      r_os
   <int>      <chr>    <chr>   <int>     <chr>  <chr>     <chr>
 1     1 2014-07-08 00:54:41   80589     3.1.0 x86_64   mingw32
 2     2 2014-07-08 00:59:53  321767     3.1.0 x86_64   mingw32
 3     3 2014-07-08 00:47:13  748063     3.1.0 x86_64 linux-gnu
 4     4 2014-07-08 00:48:05  606104     3.1.0 x86_64 linux-gnu
 5     6 2014-07-08 00:48:04   77681     3.1.0 x86_64 linux-gnu
 6     7 2014-07-08 00:48:35  393754     3.1.0 x86_64 linux-gnu
 7     8 2014-07-08 00:47:30   28216     3.0.2 x86_64 linux-gnu
 8    10 2014-07-08 00:15:35 2206029     3.0.2 x86_64 linux-gnu
 9    11 2014-07-08 00:15:25  526858     3.0.2 x86_64 linux-gnu
10    12 2014-07-08 00:14:45 2351969    2.14.1 x86_64 linux-gnu
# ... with 95,273 more rows, and 4 more variables: package <chr>,
#   version <chr>, country <chr>, ip_id <int>

> filter(cran, size > 100500, r_os == "linux-gnu")
# A tibble: 33,683 x 11
       X       date     time    size r_version r_arch      r_os  package
   <int>      <chr>    <chr>   <int>     <chr>  <chr>     <chr>    <chr>
 1     3 2014-07-08 00:47:13  748063     3.1.0 x86_64 linux-gnu    party
 2     4 2014-07-08 00:48:05  606104     3.1.0 x86_64 linux-gnu    Hmisc
 3     7 2014-07-08 00:48:35  393754     3.1.0 x86_64 linux-gnu     plyr
 4    10 2014-07-08 00:15:35 2206029     3.0.2 x86_64 linux-gnu hflights
 5    11 2014-07-08 00:15:25  526858     3.0.2 x86_64 linux-gnu     LPCM
 6    12 2014-07-08 00:14:45 2351969    2.14.1 x86_64 linux-gnu  ggplot2
 7    14 2014-07-08 00:15:35 3097729     3.0.2 x86_64 linux-gnu     Rcpp
 8    15 2014-07-08 00:14:37  568036     3.1.0 x86_64 linux-gnu    rJava
 9    16 2014-07-08 00:15:50 1600441     3.1.0 x86_64 linux-gnu  RSQLite
10    18 2014-07-08 00:26:59  186685     3.1.0 x86_64 linux-gnu    ipred
# ... with 33,673 more rows, and 3 more variables: version <chr>,
#   country <chr>, ip_id <int>

```

| Okay, ready to put all of this together? Use filter() to return all
| rows of cran for which r_version is NOT NA. Hint: You will need to use
| !is.na() as part of your second argument to filter().


```r
> filter(cran,!is.na(r_version))
# A tibble: 207,205 x 11
       X       date     time    size r_version r_arch      r_os
   <int>      <chr>    <chr>   <int>     <chr>  <chr>     <chr>
 1     1 2014-07-08 00:54:41   80589     3.1.0 x86_64   mingw32
 2     2 2014-07-08 00:59:53  321767     3.1.0 x86_64   mingw32
 3     3 2014-07-08 00:47:13  748063     3.1.0 x86_64 linux-gnu
 4     4 2014-07-08 00:48:05  606104     3.1.0 x86_64 linux-gnu
 5     5 2014-07-08 00:46:50   79825     3.0.2 x86_64 linux-gnu
 6     6 2014-07-08 00:48:04   77681     3.1.0 x86_64 linux-gnu
 7     7 2014-07-08 00:48:35  393754     3.1.0 x86_64 linux-gnu
 8     8 2014-07-08 00:47:30   28216     3.0.2 x86_64 linux-gnu
 9    10 2014-07-08 00:15:35 2206029     3.0.2 x86_64 linux-gnu
10    11 2014-07-08 00:15:25  526858     3.0.2 x86_64 linux-gnu
# ... with 207,195 more rows, and 4 more variables: package <chr>,
#   version <chr>, country <chr>, ip_id <int>

```

Arrange function 
----


| To see how arrange() works, let's first take a subset of cran. select()
| all columns from size through ip_id and store the result in cran2.

> cran2 <- select(cran,size:ip_id)


| Now, to order the ROWS of cran2 so that ip_id is in ascending order
| (from small to large), type arrange(cran2, ip_id). You may want to make
| your console wide enough so that you can see ip_id, which is the last
| column.

```r
> arrange(cran2, ip_id)
# A tibble: 225,468 x 8
     size r_version r_arch         r_os     package version country ip_id
    <int>     <chr>  <chr>        <chr>       <chr>   <chr>   <chr> <int>
 1  80589     3.1.0 x86_64      mingw32   htmltools   0.2.4      US     1
 2 180562     3.0.2 x86_64      mingw32        yaml  2.1.13      US     1
 3 190120     3.1.0   i386      mingw32       babel   0.2-6      US     1
 4 321767     3.1.0 x86_64      mingw32     tseries 0.10-32      US     2
 5  52281     3.0.3 x86_64 darwin10.8.0    quadprog   1.5-5      US     2
 6 876702     3.1.0 x86_64    linux-gnu         zoo  1.7-11      US     2
 7 321764     3.0.2 x86_64    linux-gnu     tseries 0.10-32      US     2
 8 876702     3.1.0 x86_64    linux-gnu         zoo  1.7-11      US     2
 9 321768     3.1.0 x86_64      mingw32     tseries 0.10-32      US     2
10 784093     3.1.0 x86_64    linux-gnu strucchange   1.5-0      US     2
# ... with 225,458 more rows

```

| To do the same, but in descending order, change the second argument to
| desc(ip_id), where desc() stands for 'descending'. Go ahead.

```r
> arrange(cran2, desc(ip_id))
# A tibble: 225,468 x 8
      size r_version r_arch         r_os      package version country
     <int>     <chr>  <chr>        <chr>        <chr>   <chr>   <chr>
 1    5933      <NA>   <NA>         <NA>          CPE   1.4.2      CN
 2  569241     3.1.0 x86_64      mingw32 multcompView   0.1-5      US
 3  228444     3.1.0 x86_64      mingw32        tourr   0.5.3      NZ
 4  308962     3.1.0 x86_64 darwin13.1.0          ctv   0.7-9      CN
 5  950964     3.0.3   i386      mingw32        knitr     1.6      CA
 6   80185     3.0.3   i386      mingw32    htmltools   0.2.4      CA
 7 1431750     3.0.3   i386      mingw32        shiny  0.10.0      CA
 8 2189695     3.1.0 x86_64      mingw32       RMySQL   0.9-3      US
 9 4818024     3.1.0   i386      mingw32       igraph   0.7.1      US
10  197495     3.1.0 x86_64      mingw32         coda  0.16-1      US
# ... with 225,458 more rows, and 1 more variables: ip_id <int>

```

| We can also arrange the data according to the values of multiple
| variables. For example, arrange(cran2, package, ip_id) will first
| arrange by package names (ascending alphabetically), then by ip_id.
| This means that if there are multiple rows with the same value for
| package, they will be sorted by ip_id (ascending numerically). Try
| arrange(cran2, package, ip_id) now.

```r
> arrange(cran2, package, ip_id)
# A tibble: 225,468 x 8
    size r_version r_arch         r_os package version country ip_id
   <int>     <chr>  <chr>        <chr>   <chr>   <chr>   <chr> <int>
 1 71677     3.0.3 x86_64 darwin10.8.0      A3   0.9.2      CN  1003
 2 71672     3.1.0 x86_64    linux-gnu      A3   0.9.2      US  1015
 3 71677     3.1.0 x86_64      mingw32      A3   0.9.2      IN  1054
 4 70438     3.0.1 x86_64 darwin10.8.0      A3   0.9.2      CN  1513
 5 71677      <NA>   <NA>         <NA>      A3   0.9.2      BR  1526
 6 71892     3.0.2 x86_64    linux-gnu      A3   0.9.2      IN  1542
 7 71677     3.1.0 x86_64    linux-gnu      A3   0.9.2      ZA  2925
 8 71672     3.1.0 x86_64      mingw32      A3   0.9.2      IL  3889
 9 71677     3.0.3 x86_64      mingw32      A3   0.9.2      DE  3917
10 71672     3.1.0 x86_64      mingw32      A3   0.9.2      US  4219
# ... with 225,458 more rows

```

| Arrange cran2 by the following three variables, in this order: country
| (ascending), r_version (descending), and ip_id (ascending).

```r
> arrange(cran2,country,desc(r_version),ip_id)
# A tibble: 225,468 x 8
      size r_version r_arch      r_os       package   version country
     <int>     <chr>  <chr>     <chr>         <chr>     <chr>   <chr>
 1 1556858     3.1.1   i386   mingw32 RcppArmadillo 0.4.320.0      A1
 2 1823512     3.1.0 x86_64 linux-gnu          mgcv     1.8-1      A1
 3   15732     3.1.0   i686 linux-gnu          grnn     0.1.0      A1
 4 3014840     3.1.0 x86_64   mingw32          Rcpp    0.11.2      A1
 5  660087     3.1.0   i386   mingw32           xts     0.9-7      A1
 6  522261     3.1.0   i386   mingw32           FNN       1.1      A1
 7  522263     3.1.0   i386   mingw32           FNN       1.1      A1
 8 1676627     3.1.0 x86_64 linux-gnu         rgeos     0.3-5      A1
 9 2118530     3.1.0 x86_64 linux-gnu     spacetime     1.1-0      A1
10 2217180     3.1.0 x86_64   mingw32         gstat    1.0-19      A1
# ... with 225,458 more rows, and 1 more variables: ip_id <int>

```

Mutate function 
----

| To illustrate the next major function in dplyr, let's take another
| subset of our original data. Use select() to grab 3 columns from cran
| -- ip_id, package, and size (in that order) -- and store the result in
| a new variable called cran3.

```r
> cran3 <- select(cran,ip_id,package,size)

```

| Take a look at cran3 now.


```r
> cran3
# A tibble: 225,468 x 3
   ip_id      package    size
   <int>        <chr>   <int>
 1     1    htmltools   80589
 2     2      tseries  321767
 3     3        party  748063
 4     3        Hmisc  606104
 5     4       digest   79825
 6     3 randomForest   77681
 7     3         plyr  393754
 8     5      whisker   28216
 9     6         Rcpp    5928
10     7     hflights 2206029
# ... with 225,458 more rows

```

| It's common to create a new variable based on the value of one or more
| variables already in a dataset. The mutate() function does exactly
| this.

| The size variable represents the download size in bytes, which are
| units of computer memory. These days, megabytes (MB) are a more common
| unit of measurement. One megabyte is equal to 2^20 bytes. That's 2 to
| the power of 20, which is approximately one million bytes!

| We want to add a column called size_mb that contains the download size
| in megabytes. Here's the code to do it:
| 
| mutate(cran3, size_mb = size / 2^20)


```r
> mutate(cran3, size_mb = size / 2^20)
# A tibble: 225,468 x 4
   ip_id      package    size     size_mb
   <int>        <chr>   <int>       <dbl>
 1     1    htmltools   80589 0.076855659
 2     2      tseries  321767 0.306860924
 3     3        party  748063 0.713408470
 4     3        Hmisc  606104 0.578025818
 5     4       digest   79825 0.076127052
 6     3 randomForest   77681 0.074082375
 7     3         plyr  393754 0.375513077
 8     5      whisker   28216 0.026908875
 9     6         Rcpp    5928 0.005653381
10     7     hflights 2206029 2.103833199
# ... with 225,458 more rows

```

| An even larger unit of memory is a gigabyte (GB), which equals 2^10
| megabytes. We might as well add another column for download size in
| gigabytes!

| One very nice feature of mutate() is that you can use the value
| computed for your second column (size_mb) to create a third column, all
| in the same line of code. To see this in action, repeat the exact same
| command as above, except add a third argument creating a column that is
| named size_gb and equal to size_mb / 2^10.


```r
> mutate(cran3, size_mb = size / 2^20, size_gb = size_mb / 2^10)
# A tibble: 225,468 x 5
   ip_id      package    size     size_mb      size_gb
   <int>        <chr>   <int>       <dbl>        <dbl>
 1     1    htmltools   80589 0.076855659 7.505435e-05
 2     2      tseries  321767 0.306860924 2.996689e-04
 3     3        party  748063 0.713408470 6.966880e-04
 4     3        Hmisc  606104 0.578025818 5.644783e-04
 5     4       digest   79825 0.076127052 7.434282e-05
 6     3 randomForest   77681 0.074082375 7.234607e-05
 7     3         plyr  393754 0.375513077 3.667120e-04
 8     5      whisker   28216 0.026908875 2.627820e-05
 9     6         Rcpp    5928 0.005653381 5.520880e-06
10     7     hflights 2206029 2.103833199 2.054525e-03
# ... with 225,458 more rows

```

| Let's try one more for practice. Pretend we discovered a glitch in the
| system that provided the original values for the size variable. All of
| the values in cran3 are 1000 bytes less than they should be. Using
| cran3, create just one new column called correct_size that contains the
| correct size.


```r
> mutate(cran3, correct_size = size + 1000)
# A tibble: 225,468 x 4
   ip_id      package    size correct_size
   <int>        <chr>   <int>        <dbl>
 1     1    htmltools   80589        81589
 2     2      tseries  321767       322767
 3     3        party  748063       749063
 4     3        Hmisc  606104       607104
 5     4       digest   79825        80825
 6     3 randomForest   77681        78681
 7     3         plyr  393754       394754
 8     5      whisker   28216        29216
 9     6         Rcpp    5928         6928
10     7     hflights 2206029      2207029
# ... with 225,458 more rows

```

| The last of the five core dplyr verbs, summarize(), collapses the
| dataset to a single row. Let's say we're interested in knowing the
| average download size. summarize(cran, avg_bytes = mean(size)) will
| yield the mean value of the size variable. Here we've chosen to label
| the result 'avg_bytes', but we could have named it anything. Give it a
| try.

```r
> summarize(cran, avg_bytes = mean(size))
# A tibble: 1 x 1
  avg_bytes
      <dbl>
1  844086.5

```
