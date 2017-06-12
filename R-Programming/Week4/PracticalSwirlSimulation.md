Practice Programming Assignment: swrl Lesson 2: Simulation
======================


| One of the great advantages of using a statistical programming language like R is its vast collection of tools for simulating random numbers.                                                                                                                                         

| This lesson assumes familiarity with a few common probability distributions, but these topics will only be discussed with respect to random number
| generation. Even if you have no prior experience with these concepts, you should be able to complete the lesson and understand the main ideas.
                                                                                                                              
| The first function we'll use to generate random numbers is sample(). Use ?sample to pull up the documentation.

| Let's simulate rolling four six-sided dice: sample(1:6, 4, replace = TRUE).

```r
> sample(1:6, 4, replace = TRUE)
[1] 5 4 2 2
```

| sample(1:6, 4, replace = TRUE) instructs R to randomly select four numbers between 1 and 6, WITH
| replacement. Sampling with replacement simply means that each number is "replaced" after it is
| selected, so that the same number can show up more than once. This is what we want here, since what
| you roll on one die shouldn't affect what you roll on any of the others.

| Now sample 10 numbers between 1 and 20, WITHOUT replacement. To sample without replacement, simply
| leave off the 'replace' argument.
```r
> sample(1:20, 10)
 [1] 10  9  8 19  1  2  7  6 11 17
 ```
 
 | Now, suppose we want to simulate 100 flips of an unfair two-sided coin. This particular coin has a 0.3
| probability of landing 'tails' and a 0.7 probability of landing 'heads'.
                                                                                       

| Let the value 0 represent tails and the value 1 represent heads. Use sample() to draw a sample of size
| 100 from the vector c(0,1), with replacement. Since the coin is unfair, we must attach specific
| probabilities to the values 0 (tails) and 1 (heads) with a fourth argument, prob = c(0.3, 0.7). Assign
| the result to a new variable called flips.

```r
> flips <- sample(c(0,1),100,prob = c(0.3, 0.7), replace = TRUE)

> flips
  [1] 1 0 1 1 1 0 0 1 1 1 1 1 0 1 0 1 1 1 0 0 1 1 1 1 1 1 1 0 1 0 1 1 1 0 1 0 0 1 1 1 0 0 0 0 1 1 1 1 1 1
 [51] 1 1 1 1 1 0 1 0 1 1 1 1 1 0 1 1 1 0 0 1 1 1 0 1 1 0 0 1 0 0 1 0 1 1 0 0 1 0 1 1 1 0 0 1 1 1 0 0 1 1
```                                                                 

| Since we set the probability of landing heads on any given flip to be 0.7, we'd expect approximately
| 70 of our coin flips to have the value 1. Count the actual number of 1s contained in flips using the
| sum() function.

| sum(flips) will add up all the 1s and 0s, giving you the total number of 1s in flips.
```r
> sum(flips)
[1] 66
```
| A coin flip is a binary outcome (0 or 1) and we are performing 100 independent trials (coin flips), so
| we can use rbinom() to simulate a binomial random variable. Pull up the documentation for rbinom()
| using ?rbinom.
```r
> ?rbinom
```
| Each probability distribution in R has an r*** function (for "random"), a d*** function (for
| "density"), a p*** (for "probability"), and q*** (for "quantile"). We are most interested in the r***
| functions in this lesson, but I encourage you to explore the others on your own.

| A binomial random variable represents the number of 'successes' (heads) in a given number of
| independent 'trials' (coin flips). Therefore, we can generate a single random variable that represents
| the number of heads in 100 flips of our unfair coin using rbinom(1, size = 100, prob = 0.7). Note that
| you only specify the probability of 'success' (heads) and NOT the probability of 'failure' (tails).
| Try it now.

```r
> rbinom(1, size = 100, prob = 0.7)
[1] 75
```

| Equivalently, if we want to see all of the 0s and 1s, we can request 100 observations, each of size 1,
| with success probability of 0.7. Give it a try, assigning the result to a new variable called flips2.

```r
> flips2 <- rbinom(100, size = 1, prob = 0.7)
```

| View the contents of flips2.
```r
> flips2
  [1] 0 1 1 1 1 1 1 1 0 0 1 1 1 1 1 0 0 0 1 1 1 1 1 1 0 0 0 1 0 1 1 1 0 1 0 0 1 0 1 1 0 1 1 0 0 0 0 1 1 1
 [51] 1 1 1 1 1 1 1 0 1 1 1 1 0 1 1 1 0 1 0 1 1 1 1 0 0 1 0 1 1 0 1 0 1 1 0 1 0 1 0 0 1 1 1 1 1 1 1 1 1 0
```

| Now use sum() to count the number of 1s (heads) in flips2. It should be close to 70!

| The standard normal distribution has mean 0 and standard deviation 1. As you can see under the 'Usage'
| section in the documentation, the default values for the 'mean' and 'sd' arguments to rnorm() are 0
| and 1, respectively. Thus, rnorm(10) will generate 10 random numbers from a standard normal
| distribution. Give it a try.
```r
> rnorm(10) 
 [1]  2.06167416 -1.29005999  0.57118945  1.78539023  0.21294024  0.88469215 -0.90197026 -0.05474996
 [9] -1.35675471  0.31723058
```
| Now do the same, except with a mean of 100 and a standard deviation of 25.
```r
> rnorm(10,mean = 100,sd = 25) 
 [1]  70.01123 145.22626  92.44610 146.26939  84.91696  81.08245  87.52683  62.45064  58.34817  73.71970
```

| Finally, what if we want to simulate 100 *groups* of random numbers, each containing 5 values
| generated from a Poisson distribution with mean 10? Let's start with one group of 5 numbers, then I'll
| show you how to repeat the operation 100 times in a convenient and compact way.

| Generate 5 random values from a Poisson distribution with mean 10. Check out the documentation for
| rpois() if you need help.
```r
> ?rpois()
> rpois(5, lambda = 10)
[1]  6 12 10  8 12
```

| Now use replicate(100, rpois(5, 10)) to perform this operation 100 times. Store the result in a new
| variable called my_pois.
```r
> my_pois <- replicate(100, rpois(5, 10))

> my_pois
     [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12] [,13] [,14] [,15] [,16] [,17] [,18]
[1,]    7    8    9   19    8    7   14   11   12    13    11     6     8    12     5     7    13     3
[2,]    5   11   10    8    8   10    3   11    9     5    11    12     7    10     5     8    12     6
[3,]   12    7    8   13    6   11   11    5    7     9     8    12    13     9    15     8    13     5
[4,]    7   11   11    7   18    3    7    7    6     8    14    10     9     9    10    12    10     8
[5,]   10   13   10   16    8   15   11   13    4     6     7     5    10    10    12    13    11     8
     [,19] [,20] [,21] [,22] [,23] [,24] [,25] [,26] [,27] [,28] [,29] [,30] [,31] [,32] [,33] [,34]
[1,]    11    11    11     7    10    11    12    11    11    12     7    11     9    11    16    13
[2,]     6     9    13     6    12    10     9     9     9    11    12     9     6     8     8    17
[3,]    17    14     9    10     7     8    11     8     6     7     8     6    11    12    10     4
[4,]    13     8    12    14    11    11     9     9    13    10     7    10     9     9    12    14
[5,]    11     9     8    14    10    15     7     6    12    11    13     9    12    10    11    13
     [,35] [,36] [,37] [,38] [,39] [,40] [,41] [,42] [,43] [,44] [,45] [,46] [,47] [,48] [,49] [,50]
[1,]     5     9     6     9    11     9     8    12    11    14    10     9     7    16    13    14
[2,]     9    10    13     9     7     5    12    10    11    11    12    10    14    14    11    13
[3,]    12     7    10    12    11    15     8    15    16     9    10    20     4    11     8     7
[4,]     5    10    12    11     4    10    16     7    13     8     7     8     6    13    10     8
[5,]    12     5    13     8     8     9     8    12    12    10    11     4    14    11    12     9
     [,51] [,52] [,53] [,54] [,55] [,56] [,57] [,58] [,59] [,60] [,61] [,62] [,63] [,64] [,65] [,66]
[1,]    13    12    11    19    11    10     8    10     6     9     9     9     6    11    13    14
[2,]     7    10    14     8    12     8     7    12    15    13    10     9     7     9     5    12
[3,]    10    11    14     8    11     7     8    15     5    10     8     7     6     8    15    14
[4,]    12    13    10    13    14    11     7    12    10    10    13     9    14     8    12    12
[5,]     9     9     8    15     8    10     5     9     9    12     6     8     4     7    13    10
     [,67] [,68] [,69] [,70] [,71] [,72] [,73] [,74] [,75] [,76] [,77] [,78] [,79] [,80] [,81] [,82]
[1,]     6     8     6    12    10     8    11    13     5    16    12     9     9     8     7    12
[2,]    13    13    10    11    13     9     7     8     8     6    17     6     6     5    13    13
[3,]    11    10    15    13     8     6    11     9    14    14    11    14    13     7     5     7
[4,]     6    13     5     9     6     5    16    12    10    10     4    11    18    14     6     9
[5,]    12     8     8     7     8     8    11    22    14    15    17     6     8    10    16    13
     [,83] [,84] [,85] [,86] [,87] [,88] [,89] [,90] [,91] [,92] [,93] [,94] [,95] [,96] [,97] [,98]
[1,]     6     8     8    17    13    10    11     9    11    14     6     6     8    14    12    12
[2,]    11    11    16     6    15     4     8     9     7     3    15     7    15     5    12    13
[3,]    12     9     5    14    10    19     9    13    18    10    13     3    16    13    11    12
[4,]     8    12    10     8     8     9     9    22     8    15     6    13    10    17     8     7
[5,]    10    12     6     9     7     9    11    11    11     9    15    10    12    13     7    12
     [,99] [,100]
[1,]     8     10
[2,]    11      7
[3,]     9      6
[4,]    14     10
[5,]    11      9
```

| replicate() created a matrix, each column of which contains 5 random numbers generated from a Poisson
| distribution with mean 10. Now we can find the mean of each column in my_pois using the colMeans()
| function. Store the result in a variable called cm.

```r
> cm <- colMeans(my_pois)
```

| And let's take a look at the distribution of our column means by plotting a histogram with hist(cm).
```r
> hist(cm)
```

