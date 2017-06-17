library(dplyr)
setwd("/Users/jguzman/Documents/onedrive/DataScience/gitRepo/ExploratoryDataAnalysis/Week1/Project1")

# Reads data from file
rawfile <- "household_power_consumption.txt"
hpc <- read.csv(rawfile, sep = ";", stringsAsFactors=FALSE )
hpcTbl <- tbl_df(hpc)
rm("hpc")

# Filter Dates for 1/2/2007 and 2/2/2007 
# mutate Global_active_power to numeric values
# mutate dateTime from Date and Time variables
hpcSubset <- filter(hpcTbl, Date %in% c("1/2/2007","2/2/2007")) %>%
    mutate( Global_active_power = as.numeric(Global_active_power)) %>%
    mutate( dateTime = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S") )

# Check NA in columns
# colSums(is.na(hpcSubset))

## Prepare and Generate Plot 
png("plot2.png", width=480, height=480)

plot(x = hpcSubset$dateTime
     , y = hpcSubset$Global_active_power
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")


dev.off()

