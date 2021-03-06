Practical R Exercise in Swirl (Funtions)
==========================================

```r
| Let's try using a few basic functions just for fun. The Sys.Date() function returns a string
| representing today's date. Type Sys.Date() below and see what happens.

> Sys.Date()
[1] "2017-06-08"
```
```r

| The mean() function takes a vector of numbers as input, and returns the average of all of the
| numbers in the input vector. Inputs to functions are often called arguments. Providing arguments
| to a function is also sometimes called passing arguments to that function. Arguments you want to
| pass to a function go inside the function's parentheses. Try passing the argument c(2, 4, 5) to
| the mean() function.

> mean(c(2, 4, 5))
[1] 3.666667
```

```r
| The last R expression to be evaluated in a function will become the return value of that
| function. We want this function to take one argument, x, and return x without modifying it.
| Delete the pound sign so that x is returned without any modification. Make sure to save your
| script before you type submit().

| Now that you've created your first function let's test it! Type: boring_function('My first
| function!'). If your function works, it should just return the string: 'My first function!'

> boring_function('My first function!')
[1] "My first function!"


```

```r

| If you want to see the source code for any function, just type the function name without any
| arguments or parentheses. Let's try this out with the function you just created. Type:
| boring_function to view its source code.

> boring_function
function(x) {
  x
}

```

```r

| Time to make a more useful function! We're going to replicate the functionality of the mean()
| function by creating a function called: my_mean(). Remember that to calculate the average of all
| of the numbers in a vector you find the sum of all the numbers in the vector, and then divide
| that sum by the number of numbers in the vector.

| Now test out your my_mean() function by finding the mean of the vector c(4, 5, 10).

> my_mean(c(4, 5, 10))
[1] 6.333333


```

```r

| Next, let's try writing a function with default arguments. You can set default values for a
| function's arguments, and this can be useful if you think someone who uses your function will
| set a certain argument to the same value most of the time.

remainder.R
```

```r

| Let's do some testing of the remainder function. Run remainder(5) and see what happens.

> remainder(5)
[1] 1

>  remainder(11, 5)
[1] 1

> remainder(divisor = 11, num = 5)
[1] 5

> remainder(4, div = 2)
[1] 0

> args(remainder) 
function (num, divisor = 2) 
NULL


```

```r

| You may not realize it but I just tricked you into doing something pretty interesting! args() is
| a function, remainder() is a function, yet remainder was an argument for args(). Yes it's true:
| you can pass functions as arguments! This is a very powerful concept. Let's write a script to
| see how it works.

Evaluate.R

| Let's take your new evaluate() function for a spin! Use evaluate to find the standard deviation
| of the vector c(1.4, 3.6, 7.9, 8.8).

> evaluate(sd,c(1.4, 3.6, 7.9, 8.8))
[1] 3.514138

```

```r
| You may be surprised to learn that you can pass a function as an argument without first defining
| the passed function. Functions that are not named are appropriately known as anonymous
| functions.
| Let's use the evaluate function to explore how anonymous functions work. For the first argument
| of the evaluate function we're going to write a tiny function that fits on one line. In the
| second argument we'll pass some data to the tiny anonymous function in the first argument.
| Type the following command and then we'll discuss how it works: evaluate(function(x){x+1}, 6)

> evaluate(function(x){x+1}, 6)
[1] 7
```

```r

| Try using evaluate() along with an anonymous function to return the first element of the vector
| c(8, 4, 0). Your anonymous function should only take one argument which should be a variable
| `x`.

> evaluate(function(x){x[1]}, c(8, 4, 0))
[1] 8

```

```r

| Now try using evaluate() along with an anonymous function to return the last element of the
| vector c(8, 4, 0). Your anonymous function should only take one argument which should be a
| variable `x`.

> evaluate(function(x){x[length(x)]}, c(8, 4, 0))
[1] 0

```

```r

| Now let's test out your telegram function. Use your new telegram function passing in whatever
| arguments you wish!

> telegram("Hello")
[1] "START Hello STOP"

```

```r

| Your function should have three sections: capture the ellipsis in a list(), unpack the arguments
| from the ellipsis and assign them to variables, then pass those variables to paste().
```

```r
mad_libs <- function(...){
    # Do your argument unpacking here!
    args <- list(...)
    
    place <- args[["place"]]
    adjective <- args[["adjective"]]
    noun <- args[["noun"]]
    # Don't modify any code below this comment.
    # Notice the variables you'll need to create in order for the code below to
    # be functional!
    paste("News from", place, "today where", adjective, "students took to the streets in protest of the new", noun, "being         installed on campus.")
}
```

```r

> mad_libs(place="Here",adjective="adjective", noun="noun")
[1] "News from Here today where adjective students took to the streets in protest of the new noun being installed on campus."

```

```r


| You made your own binary operator! Let's test it out. Paste together the strings: 'I', 'love',
| 'R!' using your new binary operator.
```

```r
"%p%" <- function(left, right){ # Remember to add arguments!
    paste(left,right)
}
```

```r
> "I" %p% "love" %p% "R!"  
[1] "I love R!"
```

