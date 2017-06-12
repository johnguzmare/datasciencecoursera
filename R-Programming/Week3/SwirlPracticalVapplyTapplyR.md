
Swirl Practical Excercise (Vapply & Tapply)
===========================================

| Whereas sapply() tries to 'guess' the correct format of the result, vapply() allows you to specify it
| explicitly. If the result doesn't match the format you specify, vapply() will throw an error, causing the
| operation to stop. This can prevent significant problems in your code that might be caused by getting
| unexpected return values from sapply().

| Try vapply(flags, unique, numeric(1)), which says that you expect each element of the result to be a
| numeric vector of length 1. Since this is NOT actually the case, YOU WILL GET AN ERROR. Once you get the
| error, type ok() to continue to the next question.

```r 
> vapply(flags, unique, numeric(1))
Error in vapply(flags, unique, numeric(1)) : values must be length 1,
 but FUN(X[[1]]) result is length 194
> ok()
```
```r
> sapply(flags, class)
      name   landmass       zone       area population   language   religion       bars    stripes    colours 
  "factor"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer" 
       red      green       blue       gold      white      black     orange    mainhue    circles    crosses 
 "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"   "factor"  "integer"  "integer" 
  saltires   quarters   sunstars   crescent   triangle       icon    animate       text    topleft   botright 
 "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"   "factor"   "factor" 
```

| If we wish to be explicit about the format of the result we expect, we can use vapply(flags, class,
| character(1)). The 'character(1)' argument tells R that we expect the class function to return a character
| vector of length 1 when applied to EACH column of the flags dataset. Try it now.
```r 
> vapply(flags, class, character(1))
      name   landmass       zone       area population   language   religion       bars    stripes    colours 
  "factor"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer" 
       red      green       blue       gold      white      black     orange    mainhue    circles    crosses 
 "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"   "factor"  "integer"  "integer" 
  saltires   quarters   sunstars   crescent   triangle       icon    animate       text    topleft   botright 
 "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"   "factor"   "factor" 
```
| You might think of vapply() as being 'safer' than sapply(), since it requires you to specify the format of
| the output in advance, instead of just allowing R to 'guess' what you wanted. In addition, vapply() may
| perform faster than sapply() for large datasets. However, when doing data analysis interactively (at the
| prompt), sapply() saves you some typing and will often be good enough.


| The 'landmass' variable in our dataset takes on integer values between 1 and 6, each of which represents a
| different part of the world. Use table(flags$landmass) to see how many flags/countries fall into each
| group.

> table(flags$landmass)

 1  2  3  4  5  6 
31 17 35 52 39 20 

| The 'animate' variable in our dataset takes the value 1 if a country's flag contains an animate image (e.g.
| an eagle, a tree, a human hand) and 0 otherwise. Use table(flags$animate) to see how many flags contain an
| animate image.

> table(flags$animate)

  0   1 
155  39 

| If you take the arithmetic mean of a bunch of 0s and 1s, you get the proportion of 1s. Use
| tapply(flags$animate, flags$landmass, mean) to apply the mean function to the 'animate' variable separately
| for each of the six landmass groups, thus giving us the proportion of flags containing an animate image
| WITHIN each landmass group.

> tapply(flags$animate, flags$landmass, mean)
        1         2         3         4         5         6 
0.4193548 0.1764706 0.1142857 0.1346154 0.1538462 0.3000000 

| The first landmass group (landmass = 1) corresponds to North America and contains the highest proportion of
| flags with an animate image (0.4194).

| Similarly, we can look at a summary of population values (in round millions) for countries with and without
| the color red on their flag with tapply(flags$population, flags$red, summary).

> tapply(flags$population, flags$red, summary)

$`0`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   0.00    0.00    3.00   27.63    9.00  684.00 

$`1`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    0.0     0.0     4.0    22.1    15.0  1008.0 

Lastly, use the same approach to look at a summary of population values for each of the six landmasses.

> tapply(flags$population, flags$landmass, summary)
$`1`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   0.00    0.00    0.00   12.29    4.50  231.00 

$`2`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   0.00    1.00    6.00   15.71   15.00  119.00 

$`3`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   0.00    0.00    8.00   13.86   16.00   61.00 

$`4`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  0.000   1.000   5.000   8.788   9.750  56.000 

$`5`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   0.00    2.00   10.00   69.18   39.00 1008.00 

$`6`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   0.00    0.00    0.00   11.30    1.25  157.00 
