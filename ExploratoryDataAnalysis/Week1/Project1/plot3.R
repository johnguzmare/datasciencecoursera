library(dplyr)
setwd("/Users/jguzman/Documents/onedrive/DataScience/gitRepo/ExploratoryDataAnalysis/Week1/Project1")

# Reads data from file
rawfile <- "household_power_consumption.txt"
hpc <- read.csv(rawfile, sep = ";", stringsAsFactors=FALSE )
hpcTbl <- tbl_df(hpc)
rm("hpc")

# Filter Dates for 1/2/2007 and 2/2/2007 
# mutate Global_active_power to numeric values
# mutate Sub_metering_n to numeric values
# mutate dateTime from Date and Time variables
hpcSubset <- filter(hpcTbl, Date %in% c("1/2/2007","2/2/2007")) %>%
    mutate( Global_active_power = as.numeric(Global_active_power)) %>%
    mutate( Sub_metering_1 = as.numeric(Sub_metering_1)) %>%
    mutate( Sub_metering_2 = as.numeric(Sub_metering_2)) %>%
    mutate( Sub_metering_3 = as.numeric(Sub_metering_3)) %>%
    mutate( dateTime = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S") )

# Check NA in columns
# colSums(is.na(hpcSubset))

## Prepare and Generate Plot 
png("plot3.png", width=480, height=480)

plot(x = hpcSubset$dateTime
     , y = hpcSubset$Sub_metering_1
     , type="l", xlab="", ylab="Energy sub metering")
lines(hpcSubset$dateTime, hpcSubset$Sub_metering_2,col="red")
lines(hpcSubset$dateTime, hpcSubset$Sub_metering_3,col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))


dev.off()

