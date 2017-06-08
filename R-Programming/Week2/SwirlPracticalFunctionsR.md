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

