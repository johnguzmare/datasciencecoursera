Swirl Practical Excercise (Sapply & Rapply)
=========================

I've stored the dataset in a variable called flags. Type head(flags) to preview the first six lines (i.e. the 'head') of the dataset.

```r
> head(flags)

            name landmass zone area population language religion bars stripes
1    Afghanistan        5    1  648         16       10        2    0       3
2        Albania        3    1   29          3        6        6    0       0
3        Algeria        4    1 2388         20        8        2    2       0
4 American-Samoa        6    3    0          0        1        1    0       0
5        Andorra        3    1    0          0        6        0    3       0
6         Angola        4    2 1247          7       10        5    0       2
  colours red green blue gold white black orange mainhue circles crosses
1       5   1     1    0    1     1     1      0   green       0       0
2       3   1     0    0    1     0     1      0     red       0       0
3       3   1     1    0    0     1     0      0   green       0       0
4       5   1     0    1    1     1     0      1    blue       0       0
5       3   1     0    1    1     0     0      0    gold       0       0
6       3   1     0    0    1     0     1      0     red       0       0
  saltires quarters sunstars crescent triangle icon animate text topleft
1        0        0        1        0        0    1       0    0   black
2        0        0        1        0        0    0       1    0     red
3        0        0        1        1        0    0       0    0   green
4        0        0        0        0        1    1       1    0    blue
5        0        0        0        0        0    0       0    0    blue
6        0        0        1        0        0    1       0    0     red
  botright
1    green
2      red
3    white
4      red
5      red
6    black
```

You may need to scroll up to see all of the output. Now, let's check out the
dimensions of the dataset using dim(flags).

```r
> dim(flags)
[1] 194  30
```

As with any dataset, we'd like to know in what format the variables have been
stored. In other words, what is the 'class' of each variable? What happens if
we do class(flags)? Try it out.

```r
> class(flags)
[1] "data.frame"
```

Type cls_list <- lapply(flags, class) to apply the class() function to each
column of the flags dataset and store the result in a variable called
cls_list. Note that you just supply the name of the function you want to
apply (i.e. class), without the usual parentheses after it.

```r
> cls_list <- lapply(flags, class)

> cls_list
$name
[1] "factor"

$landmass
[1] "integer"

$zone
[1] "integer"

$area...

```


The 'l' in 'lapply' stands for 'list'. Type class(cls_list) to confirm that
lapply() returned a list.

```r
> class(cls_list) 
[1] "list"
```

You may remember from a previous lesson that lists are most helpful for storing multiple classes of data. In
this case, since every element of the list returned by lapply() is a character vector of length one (i.e.
"integer" and "vector"), cls_list can be simplified to a character vector. To do this manually, type
as.character(cls_list).

```r
> as.character(cls_list)
 [1] "factor"  "integer" "integer" "integer" "integer" "integer" "integer" "integer" "integer" "integer"
[11] "integer" "integer" "integer" "integer" "integer" "integer" "integer" "factor"  "integer" "integer"
[21] "integer" "integer" "integer" "integer" "integer" "integer" "integer" "integer" "factor"  "factor" 
```

sapply() allows you to automate this process by calling lapply() behind the scenes, but then attempting to
simplify (hence the 's' in 'sapply') the result for you. Use sapply() the same way you used lapply() to get
the class of each column of the flags dataset and store the result in cls_vect. If you need help, type
?sapply to bring up the documentation.
```r
> cls_vect <- sapply(flags, class)
```

Use class(cls_vect) to confirm that sapply() simplified the result to a character vector.

```r
> class(cls_vect)
[1] "character"
```
* if the result is a list where every element is of length one, then sapply() returns a vector. 
* If the result is a list where every element is a vector of the same length (> 1), sapply() returns a matrix.
* If sapply() can't figure things out, then it just returns a list, no different from what lapply() would give
you.

Columns 11 through 17 of our dataset are indicator variables, each representing a different color. The value
of the indicator variable is 1 if the color is present in a country's flag and 0 otherwise.

Therefore, if we want to know the total number of countries (in our dataset) with, for example, the color
orange on their flag, we can just add up all of the 1s and 0s in the 'orange' column. Try sum(flags$orange)
to see this.
```r
> sum(flags$orange)
[1] 26
```

Now we want to repeat this operation for each of the colors recorded in the dataset.
```r
flag_colors <- flags[, 11:17]
```

Use the head() function to look at the first 6 lines of flag_colors.

```r
> head(flag_colors)
  red green blue gold white black orange
1   1     1    0    1     1     1      0
2   1     0    0    1     0     1      0
3   1     1    0    0     1     0      0
4   1     0    1    1     1     0      1
5   1     0    1    1     0     0      0
6   1     0    0    1     0     1      0
```

To get a list containing the sum of each column of flag_colors, call the lapply() function with two
arguments. The first argument is the object over which we are looping (i.e. flag_colors) and the second
argument is the name of the function we wish to apply to each column (i.e. sum). Remember that the second
argument is just the name of the function with no parentheses, etc.

```r
> lapply(flag_colors,sum)
$red
[1] 153

$green
[1] 91

$blue
[1] 99

$gold
[1] 91

$white
[1] 146

$black
[1] 52

$orange
[1] 26
```

The result is a list, since lapply() always returns a list. Each element of this list is of length one, so
the result can be simplified to a vector by calling sapply() instead of lapply(). 

```r
> sapply(flag_colors,sum)
   red  green   blue   gold  white  black orange 
   153     91     99     91    146     52     26 
```

Perhaps it's more informative to find the proportion of flags (out of 194) containing each color. Since each
column is just a bunch of 1s and 0s, the arithmetic mean of each column will give us the proportion of 1s.
(If it's not clear why, think of a simpler situation where you have three 1s and two 0s -- (1 + 1 + 1 + 0 +
0)/5 = 3/5 = 0.6).

Use sapply() to apply the mean() function to each column of flag_colors. Remember that the second argument to
sapply() should just specify the name of the function (i.e. mean) that you want to apply.

```r
> sapply(flag_colors,mean)
      red     green      blue      gold     white     black    orange 
0.7886598 0.4690722 0.5103093 0.4690722 0.7525773 0.2680412 0.1340206
```

To illustrate this, let's extract columns 19 through 23 from the flags dataset and store the result in a new
data frame called flag_shapes. flag_shapes <- flags[, 19:23] will do it.
```r
> flag_shapes <- flags[, 19:23]
```

Each of these columns (i.e. variables) represents the number of times a particular shape or design appears on
a country's flag. We are interested in the minimum and maximum number of times each shape or design appears.

The range() function returns the minimum and maximum of its first argument, which should be a numeric vector.
Use lapply() to apply the range function to each column of flag_shapes. Don't worry about storing the result
in a new variable. By now, we know that lapply() always returns a list.

```r
> lapply(flag_shapes,range)
$circles
[1] 0 4

$crosses
[1] 0 2

$saltires
[1] 0 1

$quarters
[1] 0 4

$sunstars
[1]  0 50
```

Do the same operation, but using sapply() and store the result in a variable called shape_mat.

```r
> shape_mat <- sapply(flag_shapes,range)
     circles crosses saltires quarters sunstars
[1,]       0       0        0        0        0
[2,]       4       2        1        4       50
```
```r
> class(shape_mat)
[1] "matrix"
```

When given a vector, the unique() function returns a vector with all duplicate elements removed. In other
words, unique() returns a vector of only the 'unique' elements. To see how it works, try unique(c(3, 4, 5,
5, 5, 6, 6)).
```r
> unique(c(3, 4, 5, 5, 5, 6, 6))
[1] 3 4 5 6
```
We want to know the unique values for each variable in the flags dataset. To accomplish this, use lapply()
to apply the unique() function to each column in the flags dataset, storing the result in a variable called
unique_vals.
```r
> unique_vals <- lapply(flags,unique)
```
Apply the length() function to each element of the unique_vals list using sapply(). Remember, no
parentheses after the name of the function you are applying (i.e. length).
```r
> sapply(unique_vals,length)
      name   landmass       zone       area population   language   religion       bars    stripes    colours 
       194          6          4        136         48         10          8          5         12          8 
       red      green       blue       gold      white      black     orange    mainhue    circles    crosses 
         2          2          2          2          2          2          2          8          4          3 
  saltires   quarters   sunstars   crescent   triangle       icon    animate       text    topleft   botright 
         2          3         14          2          2          2          2          2          7          8 
```
Pretend you are interested in only the second item from each element of the unique_vals list that you just
created. Since each element of the unique_vals list is a vector and we're not aware of any built-in
function in R that returns the second element of a vector, we will construct our own function.
```r
lapply(unique_vals, function(elem) elem[2]) 
```
