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


| Note that this produces a slightly different answer than plot(cars). In this case, R is not sure what
| you want to use as the labels on the axes, so it just uses the arguments which you pass in, data frame
| name and dollar signs included.


| Note that there are other ways to call the plot command, i.e., using the "formula" interface. For
| example, we get a similar plot to the above with plot(dist ~ speed, cars). However, we will wait till
| later in the lesson before using the formula interface.


| Use plot() command to show dist on the x-axis and speed on the y-axis from the cars data frame. This
| is the opposite of what we did above.

> plot(y = cars$speed, x = cars$dist)


| It probably makes more sense for speed to go on the x-axis since stopping distance is a function of
| speed more than the other way around. So, for the rest of the questions in this portion of the lesson,
| always assign the arguments accordingly.


| In fact, you can assume that the answers to the next few questions are all of the form plot(x =
| cars$speed, y = cars$dist, ...) but with various arguments used in place of the ...


| Recreate the plot with the label of the x-axis set to "Speed".

> plot(x = cars$speed, y = cars$dist, xlab="Speed")

| Recreate the plot with the label of the y-axis set to "Stopping
| Distance".

> plot(x = cars$speed, y = cars$dist,col="Stopping Distance", xlab="Speed")
Error in plot.xy(xy, type, ...) : invalid color name 'Stopping Distance'
> plot(x = cars$speed, y = cars$dist,ylab="Stopping Distance", xlab="Speed")

| That's not the answer I was looking for, but try again. Or, type info() for more options.

| Type plot(x = cars$speed, y = cars$dist, ylab = "Stopping Distance") to create the plot.

> plot(x = cars$speed, y = cars$dist, ylab = "Stopping Distance")


| Recreate the plot with "Speed" and "Stopping Distance" as axis labels.

> plot(x = cars$speed, y = cars$dist,ylab="Stopping Distance", xlab="Speed")


| The reason that plots(cars) worked at the beginning of the lesson was that R was smart enough to know that the
| first element (i.e., the first column) in cars should be assigned to the x argument and the second element to the
| y argument. To save on typing, the next set of answers will all be of the form, plot(cars, ...) with various
| arguments added.


