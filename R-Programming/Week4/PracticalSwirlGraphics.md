Practice Programming Assignment: swirl Lesson 3: Base Graphics
=========================


| One of the greatest strengths of R, relative to other programming languages, is the ease with which we
| can create publication-quality graphics. In this lesson, you'll learn about base graphics in R.


| We do not cover the more advanced portions of graphics in R in this lesson. These include lattice,
| ggplot2 and ggvis.

| There is a school of thought that this approach is backwards, that we should teach ggplot2 first. See
| http://varianceexplained.org/r/teach_ggplot2_to_beginners/ for an outline of this view.


| Load the included data frame cars with data(cars).

> data(cars)

| All that hard work is paying off!

| To fix ideas, we will work with simple data frames. Our main goal is to introduce various plotting
| functions and their arguments. All the output would look more interesting with larger, more complex
| data sets.

| Pull up the help page for cars.

> ?cars


| As you can see in the help page, the cars data set has only two variables: speed and stopping
| distance. Note that the data is from the 1920s.

| Run head() on the cars data.

> head(cars)
  speed dist
1     4    2
2     4   10
3     7    4
4     7   22
5     8   16
6     9   10

| Before plotting, it is always a good idea to get a sense of the data. Key R commands for doing so
| include, dim(), names(), head(), tail() and summary().

| Run the plot() command on the cars data frame.

> plot(cars)



| As always, R tries very hard to give you something sensible given the information that you have
| provided to it. First, R notes that the data frame you have given it has just two columns, so it
| assumes that you want to plot one column versus the other.

| Second, since we do not provide labels for either axis, R uses the names of the columns. Third, it
| creates axis tick marks at nice round numbers and labels them accordingly. Fourth, it uses the other
| defaults supplied in plot().


| We will now spend some time exploring plot, but many of the topics covered here will apply to most
| other R graphics functions. Note that 'plot' is short for scatterplot.


| Look up the help page for plot().

> ?plot

| The help page for plot() highlights the different arguments that the function can take. The two most
| important are x and y, the variables that will be plotted. For the next set of questions, include the
| argument names in your answers. That is, do not type plot(cars$speed, cars$dist), although that will
| work. Instead, use plot(x = cars$speed, y = cars$dist).

| Use plot() command to show speed on the x-axis and dist on the y-axis from the cars data frame. Use
| the form of the plot command in which vectors are explicitly passed in as arguments for x and y.

> plot(x = cars$speed, y = cars$dist)

![rplot05](https://user-images.githubusercontent.com/5162499/27059749-d5f7a73c-4f9d-11e7-97e5-c9aff9f325c5.png)

| Note that this produces a slightly different answer than plot(cars). In this case, R is not sure what
| you want to use as the labels on the axes, so it just uses the arguments which you pass in, data frame
| name and dollar signs included.


| Note that there are other ways to call the plot command, i.e., using the "formula" interface. For
| example, we get a similar plot to the above with plot(dist ~ speed, cars). However, we will wait till
| later in the lesson before using the formula interface.


| Use plot() command to show dist on the x-axis and speed on the y-axis from the cars data frame. This
| is the opposite of what we did above.

> plot(y = cars$speed, x = cars$dist)

![rplot06](https://user-images.githubusercontent.com/5162499/27059750-d60e8506-4f9d-11e7-8c90-9eeb42a7f672.png)

| It probably makes more sense for speed to go on the x-axis since stopping distance is a function of
| speed more than the other way around. So, for the rest of the questions in this portion of the lesson,
| always assign the arguments accordingly.


| In fact, you can assume that the answers to the next few questions are all of the form plot(x =
| cars$speed, y = cars$dist, ...) but with various arguments used in place of the ...


| Recreate the plot with the label of the x-axis set to "Speed".

> plot(x = cars$speed, y = cars$dist, xlab="Speed")

![rplot07](https://user-images.githubusercontent.com/5162499/27059753-d61761b2-4f9d-11e7-87e1-2227dd8aa2ed.png)

| Recreate the plot with the label of the y-axis set to "Stopping
| Distance".

> plot(x = cars$speed, y = cars$dist,ylab="Stopping Distance", xlab="Speed")

![rplot08](https://user-images.githubusercontent.com/5162499/27059752-d6172fa8-4f9d-11e7-9d9e-f7283af4a490.png)

| That's not the answer I was looking for, but try again. Or, type info() for more options.

| Type plot(x = cars$speed, y = cars$dist, ylab = "Stopping Distance") to create the plot.

> plot(x = cars$speed, y = cars$dist, ylab = "Stopping Distance")

![rplot09](https://user-images.githubusercontent.com/5162499/27059755-d61a8df6-4f9d-11e7-9e46-746c9bf96f0b.png)

| Recreate the plot with "Speed" and "Stopping Distance" as axis labels.

> plot(x = cars$speed, y = cars$dist,ylab="Stopping Distance", xlab="Speed")

![rplot17](https://user-images.githubusercontent.com/5162499/27059868-a11d6488-4f9e-11e7-9b1a-e1b59a72e65c.png)

| The reason that plots(cars) worked at the beginning of the lesson was that R was smart enough to know that the
| first element (i.e., the first column) in cars should be assigned to the x argument and the second element to the
| y argument. To save on typing, the next set of answers will all be of the form, plot(cars, ...) with various
| arguments added.

| For each question, we will only want one additional argument at a time. Of course, you can pass in more than one
| argument when doing a real project.

| Plot cars with a main title of "My Plot". Note that the argument for the main title is "main" not "title".

> plot(cars, main = "My Plot")

![rplot10](https://user-images.githubusercontent.com/5162499/27059751-d616ca68-4f9d-11e7-908b-57a225671cc2.png)

| Plot cars with a sub title of "My Plot Subtitle".

> plot(cars, sub = "My Plot Subtitle")

![rplot11](https://user-images.githubusercontent.com/5162499/27059754-d617d43a-4f9d-11e7-9977-47f63c5da7c8.png)

| The plot help page (?plot) only covers a small number of the many arguments that can be passed in to plot() and to
| other graphical functions. To begin to explore the many other options, look at ?par. Let's look at some of the
| more commonly used ones. Continue using plot(cars, ...) as the base answer to these questions.

| Plot cars so that the plotted points are colored red. (Use col = 2 to achieve this effect.)

> plot(cars, col = 2)

![rplot12](https://user-images.githubusercontent.com/5162499/27059756-d6288afa-4f9d-11e7-9c39-771e62dbc5c6.png)

| Plot cars while limiting the x-axis to 10 through 15.  (Use xlim = c(10, 15) to achieve this effect.)

> plot(cars, xlim = c(10, 15))

![rplot13](https://user-images.githubusercontent.com/5162499/27059760-d634b488-4f9d-11e7-8171-a78ab613387b.png)

| You can also change the shape of the symbols in the plot. The help page for points (?points) provides the details.

| Plot cars using triangles.  (Use pch = 2 to achieve this effect.)

> plot(cars,pch = 2)

![rplot14](https://user-images.githubusercontent.com/5162499/27059757-d62f5fd8-4f9d-11e7-8676-1265c267fc34.png)

| Arguments like "col" and "pch" may not seem very intuitive. And that is because they aren't! So, many/most people
| use more modern packages, like ggplot2, for creating their graphics in R.

| It is, however, useful to have an introduction to base graphics because many of the idioms in lattice and ggplot2
| are modeled on them.

| Let's now look at some other functions in base graphics that may be useful, starting with boxplots.

| Load the mtcars data frame.

> data(mtcars)


| Anytime that you load up a new data frame, you should explore it before using it. In the middle of a swirl lesson,
| just type play(). This temporarily suspends the lesson (without losing the work you have already done) and allows
| you to issue commands like dim(mtcars) and head(mtcars). Once you are done examining the data, just type nxt() and
| the lesson will pick up where it left off.

> play()

| Entering play mode. Experiment as you please, then type nxt() when you are ready to resume the lesson.

> head(mtcars)
                   mpg cyl disp  hp drat    wt  qsec vs am gear carb
Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
> summary(mtcars)
      mpg             cyl             disp             hp             drat             wt             qsec      
 Min.   :10.40   Min.   :4.000   Min.   : 71.1   Min.   : 52.0   Min.   :2.760   Min.   :1.513   Min.   :14.50  
 1st Qu.:15.43   1st Qu.:4.000   1st Qu.:120.8   1st Qu.: 96.5   1st Qu.:3.080   1st Qu.:2.581   1st Qu.:16.89  
 Median :19.20   Median :6.000   Median :196.3   Median :123.0   Median :3.695   Median :3.325   Median :17.71  
 Mean   :20.09   Mean   :6.188   Mean   :230.7   Mean   :146.7   Mean   :3.597   Mean   :3.217   Mean   :17.85  
 3rd Qu.:22.80   3rd Qu.:8.000   3rd Qu.:326.0   3rd Qu.:180.0   3rd Qu.:3.920   3rd Qu.:3.610   3rd Qu.:18.90  
 Max.   :33.90   Max.   :8.000   Max.   :472.0   Max.   :335.0   Max.   :4.930   Max.   :5.424   Max.   :22.90  
       vs               am              gear            carb      
 Min.   :0.0000   Min.   :0.0000   Min.   :3.000   Min.   :1.000  
 1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:3.000   1st Qu.:2.000  
 Median :0.0000   Median :0.0000   Median :4.000   Median :2.000  
 Mean   :0.4375   Mean   :0.4062   Mean   :3.688   Mean   :2.812  
 3rd Qu.:1.0000   3rd Qu.:1.0000   3rd Qu.:4.000   3rd Qu.:4.000  
 Max.   :1.0000   Max.   :1.0000   Max.   :5.000   Max.   :8.000  
> dim(mtcars)
[1] 32 11


| Instead of adding data columns directly as input arguments, as we did with plot(), it is often handy to pass in
| the entire data frame. This is what the "data" argument in boxplot() allows.

| boxplot(), like many R functions, also takes a "formula" argument, generally an expression with a tilde ("~") which
| indicates the relationship between the input variables. This allows you to enter something like mpg ~ cyl to plot the
| relationship between cyl (number of cylinders) on the x-axis and mpg (miles per gallon) on the y-axis.

| Use boxplot() with formula = mpg ~ cyl and data = mtcars to create a box plot.

> boxplot(formula = mpg ~ cyl, data = mtcars)

![rplot15](https://user-images.githubusercontent.com/5162499/27059759-d631af22-4f9d-11e7-91ba-24f49feb3fd8.png)
| The plot shows that mpg is much lower for cars with more cylinders. Note that we can use the same set of arguments that
| we explored with plot() above to add axis labels, titles and so on.

| When looking at a single variable, histograms are a useful tool. hist() is the associated R function. Like plot(), hist()
| is best used by just passing in a single vector.

| Use hist() with the vector mtcars$mpg to create a histogram.

> hist(mtcars$mpg )

![rplot16](https://user-images.githubusercontent.com/5162499/27059758-d62fd512-4f9d-11e7-9404-98c7bd73344f.png)

| In this lesson, you learned how to work with base graphics in R. The best place to go from here is to study the ggplot2
| package. If you want to explore other elements of base graphics, then this web page
| (http://www.ling.upenn.edu/~joseff/rstudy/week4.html) provides a useful overview.


