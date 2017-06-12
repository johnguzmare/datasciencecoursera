Practice Programming Assignment: swirl Lesson 1: Looking at Data
==============

| Whenever you're working with a new dataset, the first thing you should do is look
| at it! What is the format of the data? What are the dimensions? What are the
| variable names? How are the variables stored? Are there missing data? Are there any
| flaws in the data?

| This lesson will teach you how to answer these questions and more using R's
| built-in functions. We'll be using a dataset constructed from the United States
| Department of Agriculture's PLANTS Database
| (http://plants.usda.gov/adv_search.html).

| I've stored the data for you in a variable called plants. Type ls() to list the
| variables in your workspace, among which should be plants.

```r
> ls()
[1] "plants"
```
| Let's begin by checking the class of the plants variable with class(plants). This
| will give us a clue as to the overall structure of the data.
```r
> class(plants)
[1] "data.frame"
```
| Since the dataset is stored in a data frame, we know it is rectangular. In other
| words, it has two dimensions (rows and columns) and fits neatly into a table or
| spreadsheet. Use dim(plants) to see exactly how many rows and columns we're dealing
| with.
```r
> dim(plants)
[1] 5166   10
```
| The first number you see (5166) is the number of rows (observations) and the second
| number (10) is the number of columns (variables).


| You can also use nrow(plants) to see only the number of rows. Try it out.
```r
> nrow(plants)
[1] 5166
```
| ... And ncol(plants) to see only the number of columns.
```r
> ncol(plants)
[1] 10
```
| If you are curious as to how much space the dataset is occupying in memory, you can
| use object.size(plants).
```r
> object.size(plants)
644232 bytes
```
| Now that we have a sense of the shape and size of the dataset, let's get a feel for
| what's inside. names(plants) will return a character vector of column (i.e.
| variable) names. Give it a shot.
```r
> names(plants)
 [1] "Scientific_Name"      "Duration"             "Active_Growth_Period"
 [4] "Foliage_Color"        "pH_Min"               "pH_Max"              
 [7] "Precip_Min"           "Precip_Max"           "Shade_Tolerance"     
[10] "Temp_Min_F"          

```
| We've applied fairly descriptive variable names to this dataset, but that won't
| always be the case. A logical next step is to peek at the actual data. However, our
| dataset contains over 5000 observations (rows), so it's impractical to view the
| whole thing all at once.

| The head() function allows you to preview the top of the dataset. Give it a try
| with only one argument.

```r
> head(plants)
               Scientific_Name          Duration Active_Growth_Period Foliage_Color
1                  Abelmoschus              <NA>                 <NA>          <NA>
2       Abelmoschus esculentus Annual, Perennial                 <NA>          <NA>
3                        Abies              <NA>                 <NA>          <NA>
4               Abies balsamea         Perennial    Spring and Summer         Green
5 Abies balsamea var. balsamea         Perennial                 <NA>          <NA>
6                     Abutilon              <NA>                 <NA>          <NA>
  pH_Min pH_Max Precip_Min Precip_Max Shade_Tolerance Temp_Min_F
1     NA     NA         NA         NA            <NA>         NA
2     NA     NA         NA         NA            <NA>         NA
3     NA     NA         NA         NA            <NA>         NA
4      4      6         13         60        Tolerant        -43
5     NA     NA         NA         NA            <NA>         NA
6     NA     NA         NA         NA            <NA>         NA
```

| The same applies for using tail() to preview the end of the dataset. Use tail() to
| view the last 15 rows.
```r
> tail(plants,15)
                      Scientific_Name  Duration Active_Growth_Period Foliage_Color
5152                          Zizania      <NA>                 <NA>          <NA>
5153                 Zizania aquatica    Annual               Spring         Green
5154   Zizania aquatica var. aquatica    Annual                 <NA>          <NA>
5155                Zizania palustris    Annual                 <NA>          <NA>
5156 Zizania palustris var. palustris    Annual                 <NA>          <NA>
5157                      Zizaniopsis      <NA>                 <NA>          <NA>
5158             Zizaniopsis miliacea Perennial    Spring and Summer         Green
5159                            Zizia      <NA>                 <NA>          <NA>
5160                     Zizia aptera Perennial                 <NA>          <NA>
5161                      Zizia aurea Perennial                 <NA>          <NA>
5162                 Zizia trifoliata Perennial                 <NA>          <NA>
5163                          Zostera      <NA>                 <NA>          <NA>
5164                   Zostera marina Perennial                 <NA>          <NA>
5165                           Zoysia      <NA>                 <NA>          <NA>
5166                  Zoysia japonica Perennial                 <NA>          <NA>
     pH_Min pH_Max Precip_Min Precip_Max Shade_Tolerance Temp_Min_F
5152     NA     NA         NA         NA            <NA>         NA
5153    6.4    7.4         30         50      Intolerant         32
5154     NA     NA         NA         NA            <NA>         NA
5155     NA     NA         NA         NA            <NA>         NA
5156     NA     NA         NA         NA            <NA>         NA
5157     NA     NA         NA         NA            <NA>         NA
5158    4.3    9.0         35         70      Intolerant         12
5159     NA     NA         NA         NA            <NA>         NA
5160     NA     NA         NA         NA            <NA>         NA
5161     NA     NA         NA         NA            <NA>         NA
5162     NA     NA         NA         NA            <NA>         NA
5163     NA     NA         NA         NA            <NA>         NA
5164     NA     NA         NA         NA            <NA>         NA
5165     NA     NA         NA         NA            <NA>         NA
5166     NA     NA         NA         NA            <NA>         NA
```
```r
> summary(plants)
                     Scientific_Name              Duration   
 Abelmoschus                 :   1   Perennial        :3031  
 Abelmoschus esculentus      :   1   Annual           : 682  
 Abies                       :   1   Annual, Perennial: 179  
 Abies balsamea              :   1   Annual, Biennial :  95  
 Abies balsamea var. balsamea:   1   Biennial         :  57  
 Abutilon                    :   1   (Other)          :  92  
 (Other)                     :5160   NA's             :1030  
           Active_Growth_Period      Foliage_Color      pH_Min          pH_Max      
 Spring and Summer   : 447      Dark Green  :  82   Min.   :3.000   Min.   : 5.100  
 Spring              : 144      Gray-Green  :  25   1st Qu.:4.500   1st Qu.: 7.000  
 Spring, Summer, Fall:  95      Green       : 692   Median :5.000   Median : 7.300  
 Summer              :  92      Red         :   4   Mean   :4.997   Mean   : 7.344  
 Summer and Fall     :  24      White-Gray  :   9   3rd Qu.:5.500   3rd Qu.: 7.800  
 (Other)             :  30      Yellow-Green:  20   Max.   :7.000   Max.   :10.000  
 NA's                :4334      NA's        :4334   NA's   :4327    NA's   :4327    
   Precip_Min      Precip_Max         Shade_Tolerance   Temp_Min_F    
 Min.   : 4.00   Min.   : 16.00   Intermediate: 242   Min.   :-79.00  
 1st Qu.:16.75   1st Qu.: 55.00   Intolerant  : 349   1st Qu.:-38.00  
 Median :28.00   Median : 60.00   Tolerant    : 246   Median :-33.00  
 Mean   :25.57   Mean   : 58.73   NA's        :4329   Mean   :-22.53  
 3rd Qu.:32.00   3rd Qu.: 60.00                       3rd Qu.:-18.00  
 Max.   :60.00   Max.   :200.00                       Max.   : 52.00  
 NA's   :4338    NA's   :4338                         NA's   :4328    
 
 ```
| You can see that R truncated the summary for Active_Growth_Period by including a catch-all category called 'Other'. Since it is a categorical/factor
| variable, we can see how many times each value actually occurs in the data with table(plants$Active_Growth_Period).

```r
> table(plants$Active_Growth_Period)

Fall, Winter and Spring                  Spring         Spring and Fall       Spring and Summer    Spring, Summer, Fall                  Summer 
                     15                     144                      10                     447                      95                      92 
        Summer and Fall              Year Round 
                     24                       5 
```
| Perhaps the most useful and concise function for understanding the *str*ucture of your data is str(). Give it a try now.

```r
> str(plants)
'data.frame':	5166 obs. of  10 variables:
 $ Scientific_Name     : Factor w/ 5166 levels "Abelmoschus",..: 1 2 3 4 5 6 7 8 9 10 ...
 $ Duration            : Factor w/ 8 levels "Annual","Annual, Biennial",..: NA 4 NA 7 7 NA 1 NA 7 7 ...
 $ Active_Growth_Period: Factor w/ 8 levels "Fall, Winter and Spring",..: NA NA NA 4 NA NA NA NA 4 NA ...
 $ Foliage_Color       : Factor w/ 6 levels "Dark Green","Gray-Green",..: NA NA NA 3 NA NA NA NA 3 NA ...
 $ pH_Min              : num  NA NA NA 4 NA NA NA NA 7 NA ...
 $ pH_Max              : num  NA NA NA 6 NA NA NA NA 8.5 NA ...
 $ Precip_Min          : int  NA NA NA 13 NA NA NA NA 4 NA ...
 $ Precip_Max          : int  NA NA NA 60 NA NA NA NA 20 NA ...
 $ Shade_Tolerance     : Factor w/ 3 levels "Intermediate",..: NA NA NA 3 NA NA NA NA 2 NA ...
 $ Temp_Min_F          : int  NA NA NA -43 NA NA NA NA -13 NA ...

```
