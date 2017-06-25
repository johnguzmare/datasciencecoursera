Lesson 2: Working With Colors
====


  So we'll first discuss some functions that the grDevices package offers. The function
  colors() lists the names of 657 predefined colors you can use in any plotting function.
  These names are returned as strings. Run the R command sample with colors() as its first
  argument and 10 as its second to give you an idea of the choices you have.
  
  > sample(colors(),10)
 [1] "saddlebrown"    "grey98"         "chartreuse"     "wheat2"         "paleturquoise2"
 [6] "brown4"         "salmon2"        "gray84"         "magenta2"       "gray99"        


 Let's see what this means. Assign to the variable pal the output of a call to colorRamp
 with the single argument, c("red","blue").

> 
> pal <- colorRamp(c("red","blue"))

We don't see any output, but R has created the function pal which we can call with a
single argument between 0 and 1. Call pal now with the argument 0.

> pal(0)
     [,1] [,2] [,3]
[1,]  255    0    0


The function pal can take more than one argument. It returns one 3-long (or 4-long, but
more about this later) vector for each argument. To see this in action, call pal with
the argument seq(0,1,len=6).

> pal(seq(0,1,len=6))
     [,1] [,2] [,3]
[1,]  255    0    0
[2,]  204    0   51
[3,]  153    0  102
[4,]  102    0  153
[5,]   51    0  204
[6,]    0    0  255

We generated 1000 random normal pairs for you in the variables x and y. We'll plot them
in a scatterplot by calling plot with 4 arguments. The variables x and y are the first
2. The third is the print character argument pch. Set this equal to 19 (filled circles).
The final argument is col which should be set equal to a call to rgb. Give rgb 3
arguments, 0, .5, and .5.

> plot(x,y,pch=19,col=rgb(0, .5, .5))

Rplot06.png)

Well this picture is okay for a scatterplot, a nice mix of blue and green, but it really
 doesn't tell us too much information in the center portion, since the points are so
 thick there. We see there are a lot of points, but is one area more filled than another?
 We can't really discriminate between different point densities. This is where the alpha
 argument can help us. Recall your plot command (use the up arrow) and add a 4th
 argument, .3, to the call to rgb. This will be our value for alpha.

> plot(x,y,pch=19,col=rgb(0, .5, .5,alpha = .3))

Rplot07.png)

These colorBrewer palettes can be used in conjunction with the colorRamp() and
 colorRampPalette() functions. You would use colors from a colorBrewer palette as your
 base palette,i.e., as arguments to colorRamp or colorRampPalette which would interpolate
 them to create new colors.

 As an example of this, create a new object, cols by calling the function brewer.pal with
 2 arguments, 3 and "BuGn". The string "BuGn" is the second last palette in the
 sequential display. The 3 tells the function how many different colors we want.

> cols <- brewer.pal(3,"BuGn")

> showMe(cols)

Rplot08.png)





