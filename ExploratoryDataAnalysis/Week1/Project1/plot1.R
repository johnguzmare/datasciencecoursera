library(dplyr)
setwd("/Users/jguzman/Documents/onedrive/DataScience/gitRepo/ExploratoryDataAnalysis/Week1/Project1")

# Reads data from file
rawfile <- "household_power_consumption.txt"
hpc <- read.csv(rawfile, sep = ";", stringsAsFactors=FALSE )
hpcTbl <- tbl_df(hpc)
rm("hpc")

# Filter Dates for 1/2/2007 and 2/2/2007
# mutate Global_active_power to numeric values
hpcSubset <- filter(hpcTbl, Date %in% c("1/2/2007","2/2/2007")) %>%
    mutate( Global_active_power = as.numeric(Global_active_power))

# Check NA in columns
# colSums(is.na(hpcSubset))


## Prepare and Generate Plot 
png("plot1.png", width=480, height=480)
hist(hpcSubset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()

