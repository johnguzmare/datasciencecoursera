Dates and Times with lubridate
======

  In this lesson, we'll explore the lubridate R package, by Garrett Grolemund and Hadley Wickham.
  According to the package authors, "lubridate has a consistent, memorable syntax, that makes working
  with dates fun instead of frustrating." If you've ever worked with dates in R, that statement
  probably has your attention.

  Unfortunately, due to different date and time representations, this lesson is only guaranteed to
  work with an `en_US.UTF-8` locale. To view your locale, type `Sys.getlocale("LC_TIME")`.
```r
> Sys.getlocale("LC_TIME")
[1] "en_US.UTF-8"
```

  lubridate was automatically installed (if necessary) and loaded upon starting this lesson. To build
  the habit, we'll go ahead and (re)load the package now. Type library(lubridate) to do so.
```r
> library(lubridate)
```

  lubridate contains many useful functions. We'll only be covering the basics here. Type help(package
  = lubridate) to bring up an overview of the package, including the package DESCRIPTION, a list of
  available functions, and a link to the official package vignette.
```r
> help(package = lubridate)

> this_day <- today()
> today()
[1] "2017-06-19"
```
  There are three components to this date. In order, they are year, month, and day. We can extract any
  of these components using the year(), month(), or day() function, respectively. Try any of those on
  this_day now.
```r
> year(this_day)
[1] 2017
```
  We can also get the day of the week from this_day using the wday() function. It will be represented
  as a number, such that 1 = Sunday, 2 = Monday, 3 = Tuesday, etc. Give it a shot.
```r
> wday(this_day)
[1] 2
```
  Now try the same thing again, except this time add a second argument, label = TRUE, to display the
  *name* of the weekday (represented as an ordered factor).
```r
> wday(this_day,label = TRUE)
[1] Mon
Levels: Sun < Mon < Tues < Wed < Thurs < Fri < Sat
```
  In addition to handling dates, lubridate is great for working with date and time combinations,
  referred to as date-times. The now() function returns the date-time representing this exact moment
  in time. Give it a try and store the result in a variable called this_moment.
```r
> this_moment <- now()
```
  View the contents of this_moment.
```r
> this_moment
[1] "2017-06-19 11:25:25 -05"
```
  Just like with dates, we can extract the year, month, day, or day of week. However, we can also use
  hour(), minute(), and second() to extract specific time information. Try any of these three new
  functions now to extract one piece of time information from this_moment.
```r
> minute(this_moment)
[1] 25
```
  today() and now() provide neatly formatted date-time information. When working with dates and times
  'in the wild', this won't always (and perhaps rarely will) be the case.
  Fortunately, lubridate offers a variety of functions for parsing date-times. These functions take
  the form of ymd(), dmy(), hms(), ymd_hms(), etc., where each letter in the name of the function
  stands for the location of years (y), months (m), days (d), hours (h), minutes (m), and/or seconds
  (s) in the date-time being read in.

  To see how these functions work, try ymd("1989-05-17"). You must surround the date with quotes.
  Store the result in a variable called my_date.
```r
> my_date <- ymd("1989-05-17")

> my_date
[1] "1989-05-17"

> class(my_date)
[1] "Date"
```
  So ymd() took a character string as input and returned an object of class POSIXct. It's not
  necessary that you understand what POSIXct is, but just know that it is one way that R stores
  date-time information internally.

  "1989-05-17" is a fairly standard format, but lubridate is 'smart' enough to figure out many
  different date-time formats. Use ymd() to parse "1989 May 17". Don't forget to put quotes around the
  date!
```r
> ymd("1989 May 17")
[1] "1989-05-17"
```
  Despite being formatted differently, the last two dates had the year first, then the month, then the
  day. Hence, we used ymd() to parse them. What do you think the appropriate function is for parsing
  "March 12, 1975"? Give it a try.
```r
> mdy("March 12, 1975")
[1] "1975-03-12"
```
  We can even throw something funky at it and lubridate will often know the right thing to do. Parse
  25081985, which is supposed to represent the 25th day of August 1985. Note that we are actually
  parsing a numeric value here -- not a character string -- so leave off the quotes.
```r
> dmy(25081985)
[1] "1985-08-25"
```
  You got a warning message because it was unclear what date you wanted. When in doubt, it's best to
  be more explicit. Repeat the same command, but add two dashes OR two forward slashes to "192012" so
  that it's clear we want January 2, 1920.

  In addition to dates, we can parse date-times. I've created a date-time object called dt1. Take a
  look at it now.
```r
> dt1
[1] "2014-08-23 17:23:02"
```
  Now parse dt1 with ymd_hms().
```r
> ymd_hms(dt1)
[1] "2014-08-23 17:23:02 UTC"


> ymd("1920/1/2")
[1] "1920-01-02"
```
  What if we have a time, but no date? Use the appropriate lubridate function to parse "03:22:14"
  (hh:mm:ss).
```r
> hms("03:22:14")
[1] "3H 22M 14S"
```
  lubridate is also capable of handling vectors of dates, which is particularly helpful when you need
  to parse an entire column of data. I've created a vector of dates called dt2. View its contents now.

  lubridate is also capable of handling vectors of dates, which is particularly helpful when you need
  to parse an entire column of data. I've created a vector of dates called dt2. View its contents now.
```r
> dt2
[1] "2014-05-14" "2014-09-22" "2014-07-11"

```
  Now parse dt2 using the appropriate lubridate function.
```r
> ymd(dt2)
[1] "2014-05-14" "2014-09-22" "2014-07-11"

```
  The update() function allows us to update one or more components of a date-time. For example, let's
  say the current time is 08:34:55 (hh:mm:ss). Update this_moment to the new time using the following
  command:
  ```r
  update(this_moment, hours = 8, minutes = 34, seconds = 55).

> update(this_moment, hours = 8, minutes = 34, seconds = 55)
[1] "2017-06-19 08:34:55 -05"
```
  It's important to recognize that the previous command does not alter this_moment unless we reassign
  the result to this_moment. To see this, print the contents of this_moment.
```r
> this_moment
[1] "2017-06-19 11:25:25 -05"
```
  Unless you're a superhero, some time has passed since you first created this_moment. Use update() to
  make it match the current time, specifying at least hours and minutes. Assign the result to
  this_moment, so that this_moment will contain the new time.
```r
> this_moment <- update(this_moment, hours = hour(now()), minutes = minute(now()), seconds = second(now()))

> this_moment
[1] "2017-06-19 11:46:18 -05"
```
  Now, pretend you are in New York City and you are planning to visit a friend in Hong Kong. You seem
  to have misplaced your itinerary, but you know that your flight departs New York at 17:34 (5:34pm)
  the day after tomorrow. You also know that your flight is scheduled to arrive in Hong Kong exactly
  15 hours and 50 minutes after departure.
  Let's reconstruct your itinerary from what you can remember, starting with the full date and time of
  your departure. We will approach this by finding the current date in New York, adding 2 full days,
  then setting the time to 17:34.

  To find the current date in New York, we'll use the now() function again. This time, however, we'll
  specify the time zone that we want: "America/New_York". Store the result in a variable called nyc.
  Check out ?now if you need help.
```r
> nyc <- now(tzone = "America/New_York")
```

  You are really on a roll!

  View the contents of nyc, which now contains the current date and time in New York.
```r
> nyc
[1] "2017-06-19 12:48:28 EDT"
```

  Your flight is the day after tomorrow (in New York time), so we want to add two days to nyc. One
  nice aspect of lubridate is that it allows you to use arithmetic operators on dates and times. In
  this case, we'd like to add two days to nyc, so we can use the following expression: nyc + days(2).
  Give it a try, storing the result in a variable called depart.
```r
> depart <- nyc + days(2)
> depart
[1] "2017-06-21 12:48:28 EDT"
```

  So now depart contains the date of the day after tomorrow. Use update() to add the correct hours
  (17) and minutes (34) to depart. Reassign the result to depart.
```r
> depart <- update(depart,hours = 17, minutes=34)
> depart
[1] "2017-06-21 17:34:28 EDT"
```

  Your friend wants to know what time she should pick you up from the airport in Hong Kong. Now that
  we have the exact date and time of your departure from New York, we can figure out the exact time of
  your arrival in Hong Kong.

  The first step is to add 15 hours and 50 minutes to your departure time. Recall that nyc + days(2)
  added two days to the current time in New York. Use the same approach to add 15 hours and 50 minutes
  to the date-time stored in depart. Store the result in a new variable called arrive.

```r
arrive <- depart + hours(15) + minutes(50)
```

  Use with_tz() to convert arrive to the "Asia/Hong_Kong" time zone. Reassign the result to arrive, so
  that it will get the new value.
```r
> arrive <- with_tz(arrive, tzone = "Asia/Hong_Kong")
```

  Print the value of arrive to the console, so that you can tell your friend what time to pick you up
  from the airport.
```r
> arrive
[1] "2017-06-22 21:24:28 HKT"
```
  Fast forward to your arrival in Hong Kong. You and your friend have just met at the airport and you
  realize that the last time you were together was in Singapore on June 17, 2008. Naturally, you'd
  like to know exactly how long it has been.

  Use the appropriate lubridate function to parse "June 17, 2008", just like you did near the
  beginning of this lesson. This time, however, you should specify an extra argument, tz =
  "Singapore". Store the result in a variable called last_time.
```r
> last_time <- mdy("June 17, 2008", tz ="Singapore")

> last_time
[1] "2008-06-17 +08"
```
  Create an interval() that spans from last_time to arrive. Store it in a new variable called
  how_long.
```r
> how_long <- interval(last_time, arrive)
```
  Now use as.period(how_long) to see how long it's been.
```r
> as.period(how_long)
[1] "9y 0m 5d 21H 24M 28.6759140491486S"
```
  This is where things get a little tricky. Because of things like leap years, leap seconds, and
  daylight savings time, the length of any given minute, day, month, week, or year is relative to when
  it occurs. In contrast, the length of a second is always the same, regardless of when it occurs.

  To address these complexities, the authors of lubridate introduce four classes of time related
  objects: instants, intervals, durations, and periods. These topics are beyond the scope of this
  lesson, but you can find a complete discussion in the 2011 Journal of Statistical Software paper
  titled 'Dates and Times Made Easy with lubridate'.

  This concludes our introduction to working with dates and times in lubridate. I created a little
  timer that started running in the background when you began this lesson. Type stopwatch() to see how
  long you've been working!



