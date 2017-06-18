Lesson 1: Principles of Analytic Graphs
=========

  This lesson requires the ???jpeg??? package.

  Principles_of_Analytic_Graphs. (Slides for this and other Data Science courses may be found at github
  https://github.com/DataScienceSpecialization/courses/. If you care to use them, they must be downloaded as a zip file
  and viewed locally. This lesson corresponds to 04_ExploratoryAnalysis/Principles_of_Analytic_Graphics.)
  In this lesson, we'll discuss some basic principles of presenting data effectively. These will illustrate some
  fundamental concepts of displaying results in order to make them more meaningful and convincing. These principles are
  cribbed from Edward Tufte's great 2006 book, Beautiful Evidence. You can read more about them at the www.edwardtufte.com
  website.

  As a warm-up, which of the following would NOT be a good use of analytic graphing?

1: To show causality, mechanism, explanation
2: To show multivariate data
3: To decide which horse to bet on at the track
4: To show comparisons

3

  You're ready to start. Graphs give us a visual form of data, and the first principle of analytic graphs is to show some
  comparison. You'll hear more about this when you study statistical inference (another great course BTW), but evidence
  for a hypothesis is always relative to another competing or alternative hypothesis.


  Consider this boxplot which shows the relationship between the use of an air cleaner and the number of symptom-free days
  of asthmatic children. (The top and bottom lines of the box indicate the 25% and 75% quartiles of the data, and the
  horizontal line in the box shows the 50%.) Since the box is above 0, the number of symptom-free days for children with
  asthma is bigger using the air cleaner. This is good, right?

  The results for the median (50%) number of children is shown by the dark horizontal line which is around +1, so the
  improvement is about 1 day.

1: 12
2: 1
3: -2

2

  By showing the two boxplots side by side, you can clearly see that using the air cleaner increases the number of
  symptom-free days for most asthmatic children. The plot on the right (using the air cleaner) is generally higher than
  the one on the left (the control group).

4: 4

  So the first principle was to show a comparison. The second principle is to show causality or a mechanism of how your
  theory of the data works. This explanation or systematic structure shows your causal framework for thinking about the
  question you're trying to answer.

  Consider this plot which shows the dual boxplot we just showed, but next to it we have a corresponding plot of changes
  in measures of particulate matter.

  This picture tries to explain how the air cleaner increases the number of symptom-free days for asthmatic children.
  What mechanism does the graph imply?

![plot](Rplot01.png) 

1: That the air cleaner reduces pollution
2: That the air cleaner increases pollution
3: That the air in the control group is cleaner than the air in the other group
4: That the children in the control group are healthier

Selection: 1

  So the first principle was to show some comparison, the second was to show a mechanism, so what will the third
  principle say to show?
  Multivariate data!

  What is multivariate data you might ask? In technical (scientific) literature this term means more than 2 variables.
  Two-variable plots are what you saw in high school algebra.  Remember those x,y plots when you were learning about
  slopes and intercepts and equations of lines? They're valuable, but usually questions are more complicated and require
  more variables.

  Sometimes, if you restrict yourself to two variables you'll be misled and draw an incorrect conclusion.

  Consider this plot which shows the relationship between air pollution (x-axis) and mortality rates among the elderly
  (y-axis). The blue regression line shows a surprising result. (You'll learn about regression lines when you take the
  fabulous Regression Models course.)

![plot](Rplot02.png)  

  What does the blue regression line indicate?

1: As pollution increases more people die
2: As pollution increases the number of deaths doesn't change
3: As pollution increases fewer people die
4: Pollution doesn't really increase, it just gets reported more

Selection: 3


  Fewer deaths with more pollution? That's a surprise! Something's gotta be wrong, right? In fact, this is an example of
  Simpson's paradox, or the Yule???Simpson effect. Wikipedia (http://en.wikipedia.org/wiki/Simpson%27s_paradox) tells us
  that this "is a paradox in probability and statistics, in which a trend that appears in different groups of data
  disappears when these groups are combined."

  Suppose we divided this mortality/pollution data into the four seasons. Would we see different trends?

  Yes, we do! Plotting the same data for the 4 seasons individually we see a different result.

![plot](Rplot03.png)

  What does the new plot indicate?

1: Pollution doesn't really increase, it just gets reported more
2: As pollution increases fewer people die in all seasons
3: As pollution increases the seasons change
4: As pollution increases more people die in all seasons

Selection: 4

  The fourth principle of analytic graphing involves integrating evidence. This means not limiting yourself to one form
  of expression. You can use words, numbers, images as well as diagrams. Graphics should make use of many modes of data
  presentation. Remember, "Don't let the tool drive the analysis!"

  To show you what we mean, here's an example of a figure taken from a paper published in the Journal of the AMA. It
  shows the relationship between pollution and hospitalization of people with heart disease. As you can see, it's a lot
  different from our previous plots. The solid circles in the center portion indicate point estimates of percentage
  changes in hospitalization rates for different levels of pollution. The lines through the circles indicate confidence
  intervals associated with these estimates. (You'll learn more about confidence intervals in another great course, the
  one on statistical inference.)

![plot](Rplot04.png)

  Note that on the right side of the figure is another column of numbers, one for each of the point estimates given. This
  column shows posterior probabilities that relative risk is greater than 0. This, in effect, is a measure of the
  strength of the evidence showing the correlation between pollution and hospitalization.  The point here is that all of
  this information is located in one picture so that the reader can see the strength of not only the correlations but the
  evidence as well.

  The fifth principle of graphing involves describing and documenting the evidence with sources and appropriate labels
  and scales. Credibility is important so the data graphics should tell a complete story. Also, using R, you want to
  preserve any code you use to generate your data and graphics so that the research can be replicated if necessary. This
  allows for easy verification or finding bugs in your analysis.

  The sixth and final principle of analytic graphing is maybe the most important. Content is king! If you don't have
  something interesting to report, your graphs won't save you. Analytical presentations ultimately stand or fall
  depending on the quality, relevance, and integrity of their content.


Lesson 2: Exploratory Graphs
=========

  In this lesson, we'll discuss why graphics are an important tool for data scientists and the special role that exploratory
  graphs play in the field.

  Exploratory graphs serve mostly the same functions as graphs. They help us find patterns in data and understand its
  properties. They suggest modeling strategies and help to debug analyses. We DON'T use exploratory graphs to communicate
  results.

  Instead, exploratory graphs are the initial step in an investigation, the "quick and dirty" tool used to point the data
  scientist in a fruitful direction. A scientist might need to make a lot of exploratory graphs in order to develop a personal
  understanding of the problem being studied. Plot details such as axes, legends, color and size are cleaned up later to
  convey more information in an aesthetically pleasing way.

  To demonstrate these ideas, we've copied some data for you from the U.S. Environmental Protection Agency (EPA) which sets
  national ambient air quality standards for outdoor air pollution. These Standards say that for fine particle pollution
  (PM2.5), the "annual mean, averaged over 3 years" cannot exceed 12 micro grams per cubic meter. We stored the data from the
  U.S. EPA web site in the data frame pollution. Use the R function head to see the first few entries of pollution.

```r
> head(pollution)
       pm25  fips region longitude latitude
1  9.771185 01003   east -87.74826 30.59278
2  9.993817 01027   east -85.84286 33.26581
3 10.688618 01033   east -87.72596 34.73148
4 11.337424 01049   east -85.79892 34.45913
5 12.119764 01055   east -86.03212 34.01860
6 10.827805 01069   east -85.35039 31.18973
```

  We see right away that there's at least one county exceeding the EPA's standard of 12 micrograms per cubic meter. What else
  do we see?

  We see 5 columns of data. The pollution count is in the first column labeled pm25. We'll work mostly with that. The other 4
  columns are a fips code indicating the state (first 2 digits) and county (last 3 digits) with that count, the associated
  region (east or west), and the longitude and latitude of the area. Now run the R command dim with pollution as an argument
  to see how long the table is.
```r
> dim(pollution)
[1] 576   5
```
  So there are 576 entries in pollution. We'd like to investigate the question "Are there any counties in the U.S. that exceed
  that national standard (12 micro grams per cubic meter) for fine particle pollution?" We'll look at several one dimensional
  summaries of the data to investigate this question.

  The first technique uses the R command summary, a 5-number summary which returns 6 numbers. Run it now with the pm25 column
  of pollution as its argument. Recall that the construct for this is pollution$pm25.
```r
> summary(pollution$pm25)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  3.383   8.549  10.050   9.836  11.360  18.440 
  ```
  This shows us basic info about the pm25 data, namely its Minimum (0 percentile) and Maximum (100 percentile) values, and
  three Quartiles of the data. These last indicate the pollution measures at which 25%, 50%, and 75% of the counties fall
  below. In addition to these 5 numbers we see the Mean or average measure of particulate pollution across the 576 counties.

  Half the measured counties have a pollution level less than or equal to what number of micrograms per cubic meter?
```r
1: 9.836
2: 8.549
3: 11.360
4: 10.050

Selection: 4
```
  To save you a lot of typing we've saved off pollution$pm25 for you in the variable ppm. You can use ppm now in place of the
  longer expression. Try it now as the argument of the R command quantile. See how the results look a lot like the results of
  the output of the summary command.
```r
> quantile(ppm)
       0%       25%       50%       75%      100% 
 3.382626  8.548799 10.046697 11.356012 18.440731 
```

  See how the results are similar to those returned by summary? Quantile gives the quartiles, right? What is the one value
  missing from this quantile output that summary gave you?
```r
1: the minimum value
2: the mean
3: the maximum value
4: the median

Selection: 2
```
![plot](Rplot05.png)

  The boxplot shows us the same quartile data that summary and quantile did. The lower and upper edges of the blue box
  respectively show the values of the 25% and 75% quantiles.

  What do you think the horizontal line inside the box represents?
```r
1: the median
2: the minimum value
3: the mean
4: the maximum value

Selection: 1
```
  The "whiskers" of the box (the vertical lines extending above and below the box) relate to the range parameter of boxplot,
  which we let default to the value 1.5 used by R. The height of the box is the interquartile range, the difference between
  the 75th and 25th quantiles. In this case that difference is 2.8. The whiskers are drawn to be a length of range*2.8 or
  1.5*2.8. This shows us roughly how many, if any, data points are outliers, that is, beyond this range of values.

  Note that boxplot is part of R's base plotting package. A nice feature that this package provides is its ability to overlay
  features. That is, you can add to (annotate) an existing plot.

  To see this, run the R command abline with the argument h equal to 12. Recall that 12 is the EPA standard for air quality.
```r
> abline(h = 12)
```
![plot](Rplot06.png)

  Now use the R command hist (another function from the base package) with the argument ppm. Specify the color parameter col
  equal to "green". This will plot a histogram of the data.

                                                          

  So abline "adds one or more straight lines through the current plot." We see from the plot that the bulk of the measured
  counties comply with the standard since they fall under the line marking that standard.
                                                                            

  Now use the R command hist (another function from the base package) with the argument ppm. Specify the color parameter col
  equal to "green". This will plot a histogram of the data.
```r
> hist(ppm, col = "green")
```
![plot](Rplot07.png)                                                                          

  The histogram gives us a little more detailed information about our data, specifically the distribution of the pollution
  counts, or how many counties fall into each bucket of measurements.
```r
> rug(ppm)
```
![plot](Rplot08.png)

  This one-dimensional plot, with its grayscale representation, gives you a little more detailed information about how many
  data points are in each bucket and where they lie within the bucket. It shows (through density of tick marks) that the
  greatest concentration of counties has between 9 and 12 micrograms per cubic meter just as the histogram did.

  To illustrate this a little more, we've defined for you two vectors, high and low, containing pollution data of high
  (greater than 15) and low (less than 5) values respectively. Look at low now and see how it relates to the output of rug.
```r
> low
 [1] 3.494351 4.186090 4.917140 4.504539 4.793644 4.601408 4.195688 4.625279 4.460193 4.978397 4.324736 4.175901 3.382626
[14] 4.132739 4.955570 4.565808

> high
[1] 16.19452 15.80378 18.44073 16.66180 15.01573 17.42905 16.25190 16.18358
```
  Again, we see one data point greater than 18, one between 17 and 18, several between 16 and 17 and two between 15 and 16,
  verifying what rug indicated.

  Now rerun hist with 3 arguments, ppm as its first, col equal to "green", and the argument breaks equal to 100.
```r
> hist(ppm, col = "green", breaks = 100)
```
![plot](Rplot09.png)

  What do you think the breaks argument specifies in this case?
```r
1: the number of data points to graph
2: the number of buckets to split the data into
3: the number of counties exceeding the EPA standard
4: the number of stars in the sky

Selection: 2
```
  So this histogram with more buckets is not nearly as smooth as the preceding one. In fact, it's a little too noisy to see
  the distribution clearly. When you're plotting histograms you might have to experiment with the argument breaks to get a
  good idea of your data's distribution. For fun now, rerun the R command rug with the argument ppm.
```r
> rug(ppm)
```
![plot](Rplot10.png)

  See how rug works with the existing plot? It automatically adjusted its pocket size to that of the last plot plotted.

  Now run the command abline with the argument v equal to 12 and the argument lwd equal to 2.
```r
> abline(v=12, lwd=2)
```
![plot](Rplot11.png)

  See the vertical line at 12? Not very visible, is it, even though you specified a line width of 2? Run abline with the
  argument v equal to median(ppm), the argument col equal to "magenta", and the argument lwd equal to 4.

```r
> abline(v= median(ppm), col="magenta", lwd = 4)
```
![plot](Rplot12.png)

  Better, right? Thicker and more of a contrast in color. This shows that although the median (50%) is below the standard,
  there are a fair number of counties in the U.S that have pollution levels higher than the standard.

  Now recall that our pollution data had 5 columns of information. So far we've only looked at the pm25 column. We can also
  look at other information. To remind yourself what's there run the R command names with pollution as the argument.

```r
>  names(pollution)
[1] "pm25"      "fips"      "region"    "longitude" "latitude" 
```
  Longitude and latitude don't sound interesting, and each fips is unique since it identifies states (first 2 digits) and
  counties (last 3 digits). Let's look at the region column to see what's there. Run the R command table on this column. Use
  the construct pollution$region. Store the result in the variable reg.
```r
> reg <- table(pollution$region)

> reg

east west 
 442  134 
 ```
   Lot more counties in the east than west. We'll use the R command barplot (another type of one-dimensional summary) to plot
  this information. Call barplot with reg as its first argument, the argument col equal to "wheat", and the argument main
  equal to the string "Number of Counties in Each Region".
```r
> barplot(reg, col = "wheat", main = "Number of Counties in Each Region")

![plot](Rplot13.png)
```
  So we've seen several examples of one-dimensional graphs that summarize data. Two dimensional graphs include scatterplots,
  multiple graphs which we'll see more examples of, and overlayed one-dimensional plots which the R packages such as lattice
  and ggplot2 provide.

  Some graphs have more than two-dimensions. These include overlayed or multiple two-dimensional plots and spinning plots.
  Some three-dimensional plots are tricky to understand so have limited applications. We'll see some examples now of more
  complicated graphs, in particular, we'll show two graphs together.

  First we'll show how R, in one line and using base plotting, can display multiple boxplots. We simply specify that we want
  to see the pollution data as a function of region. We know that our pollution data characterized each of the 576 entries as
  belonging to one of two regions (east and west).

  We use the R formula y ~ x to show that y (in this case pm25) depends on x (region). Since both come from the same data
  frame (pollution) we can specify a data argument set equal to pollution. By doing this, we don't have to type pollution$pm25
  (or ppm) and pollution$region. We can just specify the formula pm25~region. Call boxplot now with this formula as its
  argument, data equal to pollution, and col equal to "red".
```r
> boxplot( pm25 ~ region,pollution, col = "red")
```
![plot](Rplot14.png)

  Two for the price of one! Similarly we can plot multiple histograms in one plot, though to do this we have to use more than
  one R command. First we have to set up the plot window with the R command par which specifies how we want to lay out the
  plots, say one above the other. We also use par to specify margins, a 4-long vector which indicates the number of lines for
  the bottom, left, top and right. Type the R command par(mfrow=c(2,1),mar=c(4,4,2,1)) now. Don't expect to see any new
  result.
```r
> par(mfrow=c(2,1)
+ ,mar=c(4,4,2,1))
```
  So we set up the plot window for two rows and one column with the mfrow argument. The mar argument set up the margins.
  Before we plot the histograms let's explore the R command subset which, not surprisingly, "returns subsets of vectors,
  matrices or data frames which meet conditions". We'll use subset to pull off the data we want to plot. Call subset now with
  pollution as its first argument and a boolean expression testing region for equality with the string "east". Put the result
  in the variable east.
```r
> east <- subset(pollution, region == "east")

> head(east)
       pm25  fips region longitude latitude
1  9.771185 01003   east -87.74826 30.59278
2  9.993817 01027   east -85.84286 33.26581
3 10.688618 01033   east -87.72596 34.73148
4 11.337424 01049   east -85.79892 34.45913
5 12.119764 01055   east -86.03212 34.01860
6 10.827805 01069   east -85.35039 31.18973
```
  So east holds more information than we need. We just want to plot a histogram with the pm25 portion. Call hist now with the
  pm25 portion of east as its first argument and col equal to "green" as its second.
```r
> hist(east$pm25, col = "green")
```
  Now, here's a challenge for you. Plot the histogram of the counties from the west using just one R command. Let the
  appropriate subset command (with the pm25 portion specified) be the first argument and col (equal to "green") the second.
  To cut down on your typing, use the up arrow key to get your last command and replace "east" with the subset command. Make
  sure the boolean argument checks for equality between region and "west".
```r
> hist(subset(pollution,region=="west")$pm25, col = "green") 
```
![plot](Rplot15.png)

  Scatter plots are two-dimensional plots which show the relationship between two variables, usually x and y. Let's look at a
  scatterplot showing the relationship between latitude and the pm25 data. We'll use plot, a function from R's base plotting
  package.

  We've seen that we can use a function call as an argument when calling another function. We'll do this again when we call
  plot with the arguments latitude and pm25 which are both from our data frame pollution. We'll call plot from inside the R
  command with which evaluates "an R expression in an environment constructed from data". We'll use pollution as the first
  argument to with and the call to plot as the second. This allows us to avoid typing "pollution$" before the arguments to
  plot, so it saves us some typing and adds to your base of R knowledge. Try this now.

```r
> with(pollution,plot(latitude,pm25))
```
![plot](Rplot16.png)

  Note that the first argument is plotted along the x-axis and the second along the y. Now use abline to add a horizontal line
  at 12. Use two additional arguments, lwd equal to 2 and lty also equal to 2. See what happens.


> abline(h=12, lwd=2,lty=2)

![plot](Rplot17.png)

  See how lty=2 made the line dashed? Now let's replot the scatterplot. This time, instead of using with, call plot directly
  with 3 arguments. The first 2 are pollution$latitude and ppm. The third argument, col, we'll use to add color and more
  information to our plot. Set this argument (col) equal to pollution$region and see what happens.

```r
> plot(pollution$latitude,ppm, col = pollution$region)
```
![plot](Rplot18.png)

  We've got two colors on the map to distinguish between counties in the east and those in the west. Can we figure out which
  color is east and which west? See that the high (greater than 50) and low (less than 25) latitudes are both red. Latitudes
  indicate distance from the equator, so which half of the U.S. (east or west) has counties at the extreme north and south?
```r
1: east
2: west
Selection: 2
```
  As before, use abline to add a horizontal line at 12. Use two additional arguments, lwd equal to 2 and lty also equal to 2.
```r
> abline (h=12, lwd = 2, lty=2)
```
![plot](Rplot19.png)

  We see many counties are above the healthy standard set by the EPA, but it's hard to tell overall, which region, east or
  west, is worse.

  Let's plot two scatterplots distinguished by region.

  As we did with multiple histograms, we first have to set up the plot window with the R command par. This time, let's plot
  the scatterplots side by side (one row and two columns). We also need to use different margins. Type the R command par(mfrow
  = c(1, 2), mar = c(5, 4, 2, 1)) now. Don't expect to see any new result.
```r
> par(mfrow = c(1, 2), mar = c(5, 4, 2, 1))
```
  For the first scatterplot, on the left, we'll plot the latitudes and pm25 counts from the west. We already pulled out the
  information for the counties in the east. Let's now get the information for the counties from the west. Create the variable
  west by using the subset command with pollution as the first argument and the appropriate boolean as the second.
```r
west <- subset(pollution,region=="west")
```
  Now call plot with three arguments. These are west$latitude (x-axis), west$pm25 (y-axis), and the argument main equal to the
  string "West" (title). Do this now.
```r
> plot(x=west$latitude, y=west$pm25, main = "West")
```

![plot](Rplot20.png)

  For the second scatterplot, on the right, we'll plot the latitudes and pm25 counts from the east.

  As before, use the up arrow key and change the 3 "West" strings to "East".
```r
> plot(x=east$latitude, y=east$pm25, main = "East")
```

![plot](Rplot21.png)

  See how R took care of all the details for you? Nice, right? It looks like there are more dirty
  counties in the east but the extreme dirt (greater than 15) is in the west.

  Which of the following characterizes exploratory plots?
```r
1: slow and steady
2: quick and dead
3: slow and clean
4: quick and dirty
Selection: 4
```
  True or false? Plots let you summarize the data (usually graphically) and highlight any broad
  features
```r
1: False
2: True

Selection: 2
```





