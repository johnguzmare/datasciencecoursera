Practical R excecises in swirl
=================================

Isntall Swirl
----------------
Since swirl is an R package, you can easily install it by entering a single command from the R console:

```r
install.packages("swirl")
```
If you've installed swirl in the past make sure you have version 2.2.21 or later. You can check this with:


```r
packageVersion("swirl")
```

Load swirl
----------------

Every time you want to use swirl, you need to first load the package. From the R console:

```r
library(swirl)
```

Install the R Progroamming course
----------------

swirl offers a variety of interactive courses, but for our purposes, you want the one called R Programming. Type the following from the R prompt to install this course:

```r
install_from_swirl("R Programming")
```

Start swirl and complete the lessons
------------------
Type the following from the R console to start swirl:

```r
swirl()
```

```r
| Please choose a course, or type 0 to exit swirl.

1: R Programming
2: Take me to the swirl course repository!

Selection: 1

```

```r
| Please choose a lesson, or type 0 to return to course menu.

 1: Basic Building Blocks      2: Workspace and Files     
 3: Sequences of Numbers       4: Vectors                 
 5: Missing Values             6: Subsetting Vectors      
 7: Matrices and Data Frames   8: Logic                   
 9: Functions                 10: lapply and sapply       
11: vapply and tapply         12: Looking at Data         
13: Simulation                14: Dates and Times         
15: Base Graphics             

Selection: 8

```

```r
| Creating logical expressions requires logical operators. You're probably familiar with
| arithmetic operators like `+`, `-`, `*`, and `/`. The first logical operator we are going to
| discuss is the equality operator, represented by two equals signs `==`. Use the equality
| operator below to find out if TRUE is equal to TRUE.

> TRUE==TRUE
[1] TRUE

```

```r

| To test out this property, try evaluating (FALSE == TRUE) == FALSE .

> (FALSE == TRUE) == FALSE
[1] TRUE
```

```r
| The equality operator can also be used to compare numbers. Use `==` to see if 6 is equal to 7.

> 6 == 7
[1] FALSE
```

```r
| Write an expression to test whether 6 is less than 7.
> 6 < 7
[1] TRUE
```

```r
| Write an expression to test whether 10 is less than or equal to 10.
> 10 <= 10
[1] TRUE
```

```r
| Which of the following evaluates to FALSE?

1: 9 >= 10
2: 6 < 8
3: 7 == 7
4: 0 > -36

Selection: 1
```

```r
| Which of the following evaluates to TRUE?

1: 9 >= 10
2: 7 == 9
3: -6 > -7
4: 57 < 8

Selection: 3
```

```r
| Try writing an expression to see if 5 is not equal to 7.

> 5 != 7
[1] TRUE
```

```r
| Try using the NOT operator and the equals operator to find the opposite of whether 5 is
| equal to 7.

> !(5==7)
[1] TRUE
```

```r
| Which of the following evaluates to FALSE?

1: !FALSE
2: 7 != 8
3: !(0 >= -1)
4: 9 < 10

Selection: 3
```

```r
| What do you think the following expression will evaluate to?: (TRUE != FALSE) == !(6 == 7)

1: TRUE
2: FALSE
3: %>%
4: Can there be objective truth when programming?

Selection: 1
```

```r
| Let's look at how the AND operator works. There are two AND operators in R, `&` and `&&`. Both
| operators work similarly, if the right and left operands of AND are both TRUE the entire
| expression is TRUE, otherwise it is FALSE. For example, TRUE & TRUE evaluates to TRUE. Try
| typing FALSE & FALSE to how it is evaluated.

> FALSE & FALSE
[1] FALSE
```
```r
| You can use the `&` operator to evaluate AND across a vector. The `&&` version of AND only
| evaluates the first member of a vector. Let's test both for practice. Type the expression TRUE &
| c(TRUE, FALSE, FALSE). 
| This is the equivalent statement as c(TRUE, TRUE, TRUE) & c(TRUE, FALSE, FALSE).

> TRUE & c(TRUE, FALSE, FALSE)
[1]  TRUE FALSE FALSE

```
```r

| Now we'll type the same expression except we'll use the `&&` operator. Type the expression TRUE
| && c(TRUE, FALSE, FALSE).

> TRUE && c(TRUE, FALSE, FALSE)
[1] TRUE

```

```r
```

```r
```
