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

