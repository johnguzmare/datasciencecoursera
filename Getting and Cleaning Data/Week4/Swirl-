Practical R Exercises in swirl
=========

Lesson 2: Grouping and Chaining with dplyr
-----


  In the last lesson, you learned about the five main data manipulation 'verbs' in
  dplyr: select(), filter(), arrange(), mutate(), and summarize(). The last of these,
  summarize(), is most powerful when applied to grouped data.

  I've made the dataset available to you in a data frame called mydf. Put it in a 'data
  frame tbl' using the tbl_df() function and store the result in a object called cran.
  If you're not sure what I'm talking about, you should start with the previous lesson.
  Otherwise, practice makes perfect!
```r
> cran <- tbl_df(mydf)
```
  To avoid confusion and keep things running smoothly, let's remove the original
  dataframe from your workspace with rm("mydf").
```r
> rm("mydf")
```
  Print cran to the console.
```r
> cran
# A tibble: 225,468 × 11
       X       date     time    size r_version r_arch      r_os      package version
   <int>      <chr>    <chr>   <int>     <chr>  <chr>     <chr>        <chr>   <chr>
1      1 2014-07-08 00:54:41   80589     3.1.0 x86_64   mingw32    htmltools   0.2.4
2      2 2014-07-08 00:59:53  321767     3.1.0 x86_64   mingw32      tseries 0.10-32
3      3 2014-07-08 00:47:13  748063     3.1.0 x86_64 linux-gnu        party  1.0-15
4      4 2014-07-08 00:48:05  606104     3.1.0 x86_64 linux-gnu        Hmisc  3.14-4
5      5 2014-07-08 00:46:50   79825     3.0.2 x86_64 linux-gnu       digest   0.6.4
6      6 2014-07-08 00:48:04   77681     3.1.0 x86_64 linux-gnu randomForest   4.6-7
7      7 2014-07-08 00:48:35  393754     3.1.0 x86_64 linux-gnu         plyr   1.8.1
8      8 2014-07-08 00:47:30   28216     3.0.2 x86_64 linux-gnu      whisker   0.3-2
9      9 2014-07-08 00:54:58    5928      <NA>   <NA>      <NA>         Rcpp  0.10.4
10    10 2014-07-08 00:15:35 2206029     3.0.2 x86_64 linux-gnu     hflights     0.1
# ... with 225,458 more rows, and 2 more variables: country <chr>, ip_id <int>

```
  Group cran by the package variable and store the result in a new object called
  by_package.
```r
> by_package <- group_by(cran,package)
```
  Let's take a look at by_package. Print it to the console.
```r
> by_package 
Source: local data frame [225,468 x 11]
Groups: package [6,023]

       X       date     time    size r_version r_arch      r_os      package version
   <int>      <chr>    <chr>   <int>     <chr>  <chr>     <chr>        <chr>   <chr>
1      1 2014-07-08 00:54:41   80589     3.1.0 x86_64   mingw32    htmltools   0.2.4
2      2 2014-07-08 00:59:53  321767     3.1.0 x86_64   mingw32      tseries 0.10-32
3      3 2014-07-08 00:47:13  748063     3.1.0 x86_64 linux-gnu        party  1.0-15
4      4 2014-07-08 00:48:05  606104     3.1.0 x86_64 linux-gnu        Hmisc  3.14-4
5      5 2014-07-08 00:46:50   79825     3.0.2 x86_64 linux-gnu       digest   0.6.4
6      6 2014-07-08 00:48:04   77681     3.1.0 x86_64 linux-gnu randomForest   4.6-7
7      7 2014-07-08 00:48:35  393754     3.1.0 x86_64 linux-gnu         plyr   1.8.1
8      8 2014-07-08 00:47:30   28216     3.0.2 x86_64 linux-gnu      whisker   0.3-2
9      9 2014-07-08 00:54:58    5928      <NA>   <NA>      <NA>         Rcpp  0.10.4
10    10 2014-07-08 00:15:35 2206029     3.0.2 x86_64 linux-gnu     hflights     0.1
# ... with 225,458 more rows, and 2 more variables: country <chr>, ip_id <int>
```
  At the top of the output above, you'll see 'Groups: package', which tells us that
  this tbl has been grouped by the package variable. Everything else looks the same,
  but now any operation we apply to the grouped data will take place on a per package
  basis.

  That's exactly what you'll get if you use summarize() to apply mean(size) to the
  grouped data in by_package. Give it a shot.
```r
> summarize(by_package, mean(size))
# A tibble: 6,023 × 2
       package `mean(size)`
         <chr>        <dbl>
1           A3     62194.96
2          abc   4826665.00
3     abcdeFBA    455979.87
4  ABCExtremes     22904.33
5     ABCoptim     17807.25
6        ABCp2     30473.33
7     abctools   2589394.00
8          abd    453631.24
9         abf2     35692.62
10       abind     32938.88
# ... with 6,013 more rows

```
```r
pack_sum <- summarize(by_package,
                      count = n(),
                      unique = n_distinct(ip_id),
                      countries = n_distinct(country),
                      avg_bytes = mean(size))
                      
  Print the resulting tbl, pack_sum, to the console to examine its
  contents.

> pack_sum
# A tibble: 6,023 x 5
       package count unique countries  avg_bytes
         <chr> <int>  <int>     <int>      <dbl>
 1          A3    25     24        10   62194.96
 2         abc    29     25        16 4826665.00
 3    abcdeFBA    15     15         9  455979.87
 4 ABCExtremes    18     17         9   22904.33
 5    ABCoptim    16     15         9   17807.25
 6       ABCp2    18     17        10   30473.33
 7    abctools    19     19        11 2589394.00
 8         abd    17     16        10  453631.24
 9        abf2    13     13         9   35692.62
10       abind   396    365        50   32938.88
# ... with 6,013 more rows
```

  The 'count' column, created with n(), contains the total number of rows
  (i.e. downloads) for each package. The 'unique' column, created with
  n_distinct(ip_id), gives the total number of unique downloads for each
  package, as measured by the number of distinct ip_id's. The 'countries'
  column, created with n_distinct(country), provides the number of
  countries in which each package was downloaded. And finally, the
  'avg_bytes' column, created with mean(size), contains the mean download
  size (in bytes) for each package.

  Naturally, we'd like to know which packages were most popular on the
  day these data were collected (July 8, 2014). Let's start by isolating
  the top 1% of packages, based on the total number of downloads as
  measured by the 'count' column.

  We need to know the value of 'count' that splits the data into the top
  1% and bottom 99% of packages based on total downloads. In statistics,
  this is called the 0.99, or 99%, sample quantile. Use
  quantile(pack_sum$count, probs = 0.99) to determine this number.
```r
> quantile(pack_sum$count, probs = 0.99)
   99% 
679.56 
```
  Now we can isolate only those packages which had more than 679 total
  downloads. Use filter() to select all rows from pack_sum for which
  'count' is strictly greater (>) than 679. Store the result in a new
  object called top_counts.
```r
> filter(pack_sum, count>679 )
# A tibble: 61 x 5
      package count unique countries   avg_bytes
        <chr> <int>  <int>     <int>       <dbl>
 1     bitops  1549   1408        76   28715.046
 2        car  1008    837        64 1229122.307
 3    caTools   812    699        64  176589.018
 4 colorspace  1683   1433        80  357411.197
 5 data.table   680    564        59 1252721.215
 6        DBI  2599    492        48  206933.250
 7   devtools   769    560        55  212932.640
 8  dichromat  1486   1257        74  134731.938
 9     digest  2210   1894        83  120549.294
10     doSNOW   740     75        24    8363.755
# ... with 51 more rows

```




  Now we can isolate only those packages which had more than 679 total
  downloads. Use filter() to select all rows from pack_sum for which
  'count' is strictly greater (>) than 679. Store the result in a new
  object called top_counts.
```r
> filter(pack_sum, count>679 )
# A tibble: 61 x 5
      package count unique countries   avg_bytes
        <chr> <int>  <int>     <int>       <dbl>
 1     bitops  1549   1408        76   28715.046
 2        car  1008    837        64 1229122.307
 3    caTools   812    699        64  176589.018
 4 colorspace  1683   1433        80  357411.197
 5 data.table   680    564        59 1252721.215
 6        DBI  2599    492        48  206933.250
 7   devtools   769    560        55  212932.640
 8  dichromat  1486   1257        74  134731.938
 9     digest  2210   1894        83  120549.294
10     doSNOW   740     75        24    8363.755
# ... with 51 more rows
```

  Store the result of filter(pack_sum, count > 679) in a new object
  called top_counts.
```r
> top_counts <- filter(pack_sum, count>679 )
```
  There are only 61 packages in our top 1%, so we'd like to see all of them.
  Since dplyr only shows us the first 10 rows, we can use the View()
  function to see more.

  View all 61 rows with View(top_counts). Note that the 'V' in View() is
  capitalized.

```r
> View(top_counts)
```

  arrange() the rows of top_counts based on the 'count' column and assign
  the result to a new object called top_counts_sorted. We want the packages
  with the highest number of downloads at the top, which means we want
  'count' to be in descending order. If you need help, check out ?arrange
  and/or ?desc.
```r
> top_counts_sorted <- arrange(top_counts, desc(count))
```
 Now use View() again to see all 61 rows of top_counts_sorted.
```r
> View(top_counts)
```
  If we use total number of downloads as our metric for popularity, then the
  above output shows us the most popular packages downloaded from the
  RStudio CRAN mirror on July 8, 2014. Not surprisingly, ggplot2 leads the
  pack with 4602 downloads, followed by Rcpp, plyr, rJava, ....

  Perhaps we're more interested in the number of *unique* downloads on this
  particular day. In other words, if a package is downloaded ten times in
  one day from the same computer, we may wish to count that as only one
  download. That's what the 'unique' column will tell us.

  Like we did with 'count', let's find the 0.99, or 99%, quantile for the
  'unique' variable with quantile(pack_sum$unique, probs = 0.99).
```r
> quantile(pack_sum$unique, probs = 0.99)
99% 
465 
```
  Apply filter() to pack_sum to select all rows corresponding to values of
  'unique' that are strictly greater than 465. Assign the result to a object
  called top_unique.
```r
> top_unique <- filter(pack_sum, unique > 465)
```

  Let's View() our top contenders!
```r
> View(top_unique)
```
  Now arrange() top_unique by the 'unique' column, in descending order, to
  see which packages were downloaded from the greatest number of unique IP
  addresses. Assign the result to top_unique_sorted.
```r
> top_unique_sorted <- arrange(top_unique, desc(unique)
+ )
```
  View() the sorted data.
```r
> View(top_unique_sorted)
```
  Our final metric of popularity is the number of distinct countries from
  which each package was downloaded. We'll approach this one a little
  differently to introduce you to a method called 'chaining' (or 'piping').


  Chaining allows you to string together multiple function calls in a way
  that is compact and readable, while still accomplishing the desired
  result. To make it more concrete, let's compute our last popularity metric
  from scratch, starting with our original data.

  I've opened up a script that contains code similar to what you've seen so
  far. Don't change anything. Just study it for a minute, make sure you
  understand everything that's there, then submit() when you are ready to
  move on.

Summarize2.R
----
```r
by_package <- group_by(cran, package)
pack_sum <- summarize(by_package,
                      count = n(),
                      unique = n_distinct(ip_id),
                      countries = n_distinct(country),
                      avg_bytes = mean(size))

# Here's the new bit, but using the same approach we've
# been using this whole time.

top_countries <- filter(pack_sum, countries > 60)
result1 <- arrange(top_countries, desc(countries), avg_bytes)

# Print the results to the console.
print(result1)
```
```r
# A tibble: 46 x 5
        package count unique countries  avg_bytes
          <chr> <int>  <int>     <int>      <dbl>
 1         Rcpp  3195   2044        84 2512100.35
 2       digest  2210   1894        83  120549.29
 3      stringr  2267   1948        82   65277.17
 4         plyr  2908   1754        81  799122.79
 5      ggplot2  4602   1680        81 2427716.05
 6   colorspace  1683   1433        80  357411.20
 7 RColorBrewer  1890   1584        79   22763.99
 8       scales  1726   1408        77  126819.33
 9       bitops  1549   1408        76   28715.05   <----
10     reshape2  2032   1652        76  330128.26   <----
# ... with 36 more rows
```

  It's worth noting that we sorted primarily by country, but used avg_bytes
  (in ascending order) as a tie breaker. This means that if two packages
  were downloaded from the same number of countries, the package with a
  smaller average download size received a higher ranking.

  We'd like to accomplish the same result as the last script, but avoid
  saving our intermediate results. This requires embedding function calls
  within one another.

summarize3.R
---
```r
result2 <-
  arrange(
    filter(
      summarize(
        group_by(cran,
                 package
        ),
        count = n(),
        unique = n_distinct(ip_id),
        countries = n_distinct(country),
        avg_bytes = mean(size)
      ),
      countries > 60
    ),
    desc(countries),
    avg_bytes
  )
  ```
  ```r
  # A tibble: 46 x 5
        package count unique countries  avg_bytes
          <chr> <int>  <int>     <int>      <dbl>
 1         Rcpp  3195   2044        84 2512100.35
 2       digest  2210   1894        83  120549.29
 3      stringr  2267   1948        82   65277.17
 4         plyr  2908   1754        81  799122.79
 5      ggplot2  4602   1680        81 2427716.05
 6   colorspace  1683   1433        80  357411.20
 7 RColorBrewer  1890   1584        79   22763.99
 8       scales  1726   1408        77  126819.33
 9       bitops  1549   1408        76   28715.05
10     reshape2  2032   1652        76  330128.26
# ... with 36 more rows
```
  In this script, we've used a special chaining operator, %>%, which was
  originally introduced in the magrittr R package and has now become a key
  component of dplyr. You can pull up the related documentation with ?chain.
  The benefit of %>% is that it allows us to chain the function calls in a
  linear fashion. The code to the right of %>% operates on the result from
  the code to the left of %>%.
  
  Once again, just try to understand the code, then type submit() to
  continue.


summarize4.R
---

```r
result3 <-
  cran %>%
  group_by(package) %>%
  summarize(count = n(),
            unique = n_distinct(ip_id),
            countries = n_distinct(country),
            avg_bytes = mean(size)
  ) %>%
  filter(countries > 60) %>%
  arrange(desc(countries), avg_bytes)

# Print result to console
print(result3)
```
```r
# A tibble: 46 x 5
        package count unique countries  avg_bytes
          <chr> <int>  <int>     <int>      <dbl>
 1         Rcpp  3195   2044        84 2512100.35
 2       digest  2210   1894        83  120549.29
 3      stringr  2267   1948        82   65277.17
 4         plyr  2908   1754        81  799122.79
 5      ggplot2  4602   1680        81 2427716.05
 6   colorspace  1683   1433        80  357411.20
 7 RColorBrewer  1890   1584        79   22763.99
 8       scales  1726   1408        77  126819.33
 9       bitops  1549   1408        76   28715.05
10     reshape2  2032   1652        76  330128.26
# ... with 36 more rows
```
  So, the results of the last three scripts are all identical. But, the
  third script provides a convenient and concise alternative to the more
  traditional method that we've taken previously, which involves saving
  results as we go along.

Chain1.R
---

```r
# select() the following columns from cran. Keep in mind
# that when you're using the chaining operator, you don't
# need to specify the name of the data tbl in your call to
# select().
#
# 1. ip_id
# 2. country
# 3. package
# 4. size
cran %>%
  select(ip_id,country,package,size) %>%
	print
```

```r

# A tibble: 225,468 x 4
   ip_id country      package    size
   <int>   <chr>        <chr>   <int>
 1     1      US    htmltools   80589
 2     2      US      tseries  321767
 3     3      US        party  748063
 4     3      US        Hmisc  606104
 5     4      CA       digest   79825
 6     3      US randomForest   77681
 7     3      US         plyr  393754
 8     5      US      whisker   28216
 9     6      CN         Rcpp    5928
10     7      US     hflights 2206029
# ... with 225,458 more rows
```


Chain2.R
----

```r
# Use mutate() to add a column called size_mb that contains
# the size of each download in megabytes (i.e. size / 2^20).
#
# If you want your results printed to the console, add
# print to the end of your chain.

cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20)
```

```r
# A tibble: 225,468 x 5
   ip_id country      package    size     size_mb
   <int>   <chr>        <chr>   <int>       <dbl>
 1     1      US    htmltools   80589 0.076855659
 2     2      US      tseries  321767 0.306860924
 3     3      US        party  748063 0.713408470
 4     3      US        Hmisc  606104 0.578025818
 5     4      CA       digest   79825 0.076127052
 6     3      US randomForest   77681 0.074082375
 7     3      US         plyr  393754 0.375513077
 8     5      US      whisker   28216 0.026908875
 9     6      CN         Rcpp    5928 0.005653381
10     7      US     hflights 2206029 2.103833199
# ... with 225,458 more rows

```


Chain3.R
------

```r
# Use filter() to select all rows for which size_mb is
# less than or equal to (<=) 0.5.
#
# If you want your results printed to the console, add
# print to the end of your chain.

cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
    filter(size_mb <= 0.5) %>%
      print
  # Your call to filter() goes here
```
```r
# A tibble: 142,021 x 5
   ip_id country      package   size     size_mb
   <int>   <chr>        <chr>  <int>       <dbl>
 1     1      US    htmltools  80589 0.076855659
 2     2      US      tseries 321767 0.306860924
 3     4      CA       digest  79825 0.076127052
 4     3      US randomForest  77681 0.074082375
 5     3      US         plyr 393754 0.375513077
 6     5      US      whisker  28216 0.026908875
 7     6      CN         Rcpp   5928 0.005653381
 8    13      DE        ipred 186685 0.178036690
 9    14      US       mnormt  36204 0.034526825
10    16      US    iterators 289972 0.276538849
# ... with 142,011 more rows
```


Chain4.R
------

```r
# arrange() the result by size_mb, in descending order.
#
# If you want your results printed to the console, add
# print to the end of your chain.

cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
  filter(size_mb <= 0.5) %>%
  # Your call to arrange() goes here
  arrange(desc(size_mb)) %>%
  print
 
```

```r
  
  
# A tibble: 142,021 x 5
   ip_id country               package   size   size_mb
   <int>   <chr>                 <chr>  <int>     <dbl>
 1 11034      DE                  phia 524232 0.4999466
 2  9643      US                   tis 524152 0.4998703
 3  1542      IN               RcppSMC 524060 0.4997826
 4 12354      US                 lessR 523916 0.4996452
 5 12072      US            colorspace 523880 0.4996109
 6  2514      KR              depmixS4 523863 0.4995947
 7  1111      US              depmixS4 523858 0.4995899
 8  8865      CR              depmixS4 523858 0.4995899
 9  5908      CN RcmdrPlugin.KMggplot2 523852 0.4995842
10 12354      US RcmdrPlugin.KMggplot2 523852 0.4995842
# ... with 142,011 more rows
```
