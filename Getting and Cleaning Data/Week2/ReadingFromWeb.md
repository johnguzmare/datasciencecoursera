
Reading Data From the Web
======

webscraping
-----

webscraping is programatically extracting data from HTML code of websites or from URLs. It can be a great way to get data.

```r
con = url("https://scholar.google.com/citations?user=WW1n2yAAAAAJ")
htmlCode = readLines(con)
close(con)
htmlCode
```

XML package
-------

```r
library(XML)
url <- "https://scholar.google.com/citations?user=WW1n2yAAAAAJ"
html <- htmlTreeParse(url,useInternalNodes=T)

xpathSApply(,"//title", xmlValue)

xpathSApply(,"//td[@id='col-citedby']", xmlValue)
```

httr package
-------
```r
library(httr); html2 = GET(url)
content2 = content(html2,as="text")
parsedHtml = htmlParse(content2,asText=TRUE)
parsedHtml = htmlParse(content2,asText=TRUE)
xpathSApply(,"//title", xmlValue)
```

pg1 = GET(url)
pg1

Response...

pg1 = GET(url,authenticate("",""))
pg2

Response... 
  Status:200
  Content-type: application/json
{
  "authenticated":true,
  "user",:"user"
}


Using handles
---------

google = handle("http://google.com")
pg1 = GET(handle=google,path="/")
pg2 = GET(handle=google,path="search")

