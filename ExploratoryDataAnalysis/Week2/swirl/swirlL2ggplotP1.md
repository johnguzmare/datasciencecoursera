Lesson 3: Ggplot1 Part 1 & 2
=====

> str(mpg)
Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	234 obs. of  11 variables:
 $ manufacturer: chr  "audi" "audi" "audi" "audi" ...
 $ model       : chr  "a4" "a4" "a4" "a4" ...
 $ displ       : num  1.8 1.8 2 2 2.8 2.8 3.1 1.8 1.8 2 ...
 $ year        : int  1999 1999 2008 2008 1999 1999 2008 1999 1999 2008 ...
 $ cyl         : int  4 4 4 4 6 6 6 4 4 4 ...
 $ trans       : chr  "auto(l5)" "manual(m5)" "manual(m6)" "auto(av)" ...
 $ drv         : chr  "f" "f" "f" "f" ...
 $ cty         : int  18 21 20 21 16 18 18 18 16 20 ...
 $ hwy         : int  29 29 31 30 26 26 27 26 25 28 ...
 $ fl          : chr  "p" "p" "p" "p" ...
 $ class       : chr  "compact" "compact" "compact" "compact" ...
 
 we want to see if there's a correlation between engine displacement
 (displ) and highway miles per gallon (hwy). As we did with the plot function of the base
 system we could simply call qplot with 3 arguments, the first two are the variables we
 want to examine and the third argument data is set equal to the name of the dataset
 which contains them (in this case, mpg).

 > qplot(displ,hwy,data=mpg)
 
 > qplot(displ,hwy,data=mpg, color=drv)
 
 > qplot(displ,hwy,data=mpg, color=drv, geom=c("point","smooth"))
 
 The all-purpose qplot can also create box and whisker plots.  Call qplot now with 4
 arguments. First specify the variable by which you'll split the data, in this case drv,
 then specify the variable which you want to examine, in this case hwy. The third
 argument is data (set equal to mpg), and the fourth, the geom, set equal to the string
 "boxplot"

> qplot(drv,hwy,data=mpg, color=drv, geom=c("boxplot"))

Rplot09.png)

> qplot(drv,hwy,data=mpg,geom="boxplot") 

Rplot10.png)

 We see 3 boxes, one for each drive. Now to impress you, call qplot with 5 arguments. The
 first 4 are just as you used previously, (drv, hwy, data set equal to mpg, and geom set
 equal to the string "boxplot"). Now add a fifth argument, color, equal to manufacturer.

> qplot(drv,hwy,data=mpg,geom="boxplot",color=manufacturer) 

Rplot11.png)

> qplot(hwy,data=mpg,fill=drv) 

> qplot(displ,hwy,data=mpg,facets = .~drv)

Rplot12.png)

> qplot(hwy,data=mpg,facets = drv~.,binwidth=2) 

ggplot2
-----


> g <- ggplot(mpg,aes(displ,hwy))
> g+geom_point()
> g+geom_point()+geom_smooth()
> g+geom_point()+geom_smooth(method = "lm")
> g+geom_point()+geom_smooth(method = "lm")+facet_grid(. ~ drv)
> g+geom_point()+geom_smooth(method = "lm")+facet_grid(. ~ drv)+ggtitle("Swirl Rules!")

> g+geom_point(color="pink",size=4,alpha=1/2)
> g+geom_point(size=4,alpha=1/2, aes(color=drv))

> g+geom_point(aes(color=drv))
+labs(title="Swirl Rules!")
+labs(x="Displacement",y="Hwy Mileage")

> g+geom_point(aes(color=drv),size=2,alpha=1/2)
+geom_smooth(size=4,linetype=3,method = "lm",se=FALSE)

A simple, yet comfortingly familiar scatterplot appears. Let's make our display a 2
 dimensional multi-panel plot. Recall your last command (with the up arrow) and add to it
 a call the function facet_grid. Give it 2 arguments. The first is the formula drv~cyl,
 and the second is the argument margins set equal to TRUE. Try this now.
 
> g <- ggplot(mpg,aes(x=displ,y=hwy,color=factor(year)))
> g+geom_point()+facet_grid(drv~cyl,margins=TRUE)

  A 4 by 5 plot, huh? The margins argument tells ggplot to display the marginal totals
 over each row and column, so instead of seeing 3 rows (the number of drv factors) and 4
 columns (the number of cyl factors) we see a 4 by 5 display. Note that the panel in
 position (4,5) is a tiny version of the scatterplot of the entire dataset.
 
 
 
 density
 > qplot(price,data=diamonds,geom="density")
 
 Rplot14.png)
 
 > qplot(price,data=diamonds,geom="density", color=cut)
 
 Rplot13.png)
 
 
 > qplot(carat,price,data=diamonds)
 
 Rplot15.png)
 
 
 > qplot(carat,price,data=diamonds,shape=cut)
 
 Rplot16.png)
 
 > qplot(carat,price,data=diamonds,color=cut)
 
 Rplot17.png)
 
 
 > qplot(carat,price,data=diamonds, color=cut) + geom_smooth(method="lm")
 
 Rplot18.png)
 
 
 
> g <- ggplot(diamonds,aes(depth,price))
> g + geom_point(alpha=1/3)

 
> cutpoints <- quantile(diamonds$carat,seq(0,1,length=4),na.rm=TRUE)
> cutpoints
       0% 33.33333% 66.66667%      100% 
     0.20      0.50      1.00      5.01 
     
Rplot19.png)

> diamonds$car2 <- cut(diamonds$carat,cutpoints)

> g <- ggplot(diamonds,aes(depth,price))

> g+geom_point(alpha=1/3)+facet_grid(cut~car2) 

Rplot20.png)

> diamonds[myd,]
# A tibble: 12 x 11
   carat       cut color clarity depth table price     x     y     z   car2
   <dbl>     <ord> <ord>   <ord> <dbl> <dbl> <int> <dbl> <dbl> <dbl> <fctr>
 1   0.2   Premium     E     SI2  60.2    62   345  3.79  3.75  2.27     NA
 2   0.2   Premium     E     VS2  59.8    62   367  3.79  3.77  2.26     NA
 3   0.2   Premium     E     VS2  59.0    60   367  3.81  3.78  2.24     NA
 4   0.2   Premium     E     VS2  61.1    59   367  3.81  3.78  2.32     NA
 5   0.2   Premium     E     VS2  59.7    62   367  3.84  3.80  2.28     NA
 6   0.2     Ideal     E     VS2  59.7    55   367  3.86  3.84  2.30     NA
 7   0.2   Premium     F     VS2  62.6    59   367  3.73  3.71  2.33     NA
 8   0.2     Ideal     D     VS2  61.5    57   367  3.81  3.77  2.33     NA
 9   0.2 Very Good     E     VS2  63.4    59   367  3.74  3.71  2.36     NA
10   0.2     Ideal     E     VS2  62.2    57   367  3.76  3.73  2.33     NA
11   0.2   Premium     D     VS2  62.3    60   367  3.73  3.68  2.31     NA
12   0.2   Premium     D     VS2  61.7    60   367  3.77  3.72  2.31     NA

