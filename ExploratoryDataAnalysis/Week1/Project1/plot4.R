library(dplyr)
setwd("/Users/jguzman/Documents/onedrive/DataScience/gitRepo/ExploratoryDataAnalysis/Week1/Project1")

# Reads data from file
rawfile <- "household_power_consumption.txt"
hpc <- read.csv(rawfile, sep = ";", stringsAsFactors=FALSE )
hpcTbl <- tbl_df(hpc)
rm("hpc")

# Filter Dates for 1/2/2007 and 2/2/2007 
# mutate Global_active_power to numeric values
# mutate Global_reactive_power to numeric values
# mutate Voltage to numeric values
# mutate Sub_metering_n to numeric values
# mutate dateTime from Date and Time variables
hpcSubset <- filter(hpcTbl, Date %in% c("1/2/2007","2/2/2007")) %>%
    mutate( Global_active_power = as.numeric(Global_active_power)) %>%
    mutate( Global_reactive_power = as.numeric(Global_reactive_power)) %>%
    mutate( Voltage = as.numeric(Voltage)) %>%
    mutate( Sub_metering_1 = as.numeric(Sub_metering_1)) %>%
    mutate( Sub_metering_2 = as.numeric(Sub_metering_2)) %>%
    mutate( Sub_metering_3 = as.numeric(Sub_metering_3)) %>%
    mutate( dateTime = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S") )

# Check NA in columns
# colSums(is.na(hpcSubset))

## Prepare and Generate Plots

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# Plot 1 - Global Active Power
plot(x = hpcSubset$dateTime
     , y = hpcSubset$Global_active_power
     , type="l", xlab="", ylab="Global Active Power")

# Plot 2 - Voltage
plot(x = hpcSubset$dateTime
     , y = hpcSubset$Voltage
     , type="l", xlab="datetime", ylab="Voltage")

# Plot 3 - Energy sub metering
plot(x = hpcSubset$dateTime
     , y = hpcSubset$Sub_metering_1
     , type="l", xlab="", ylab="Energy sub metering")
lines(hpcSubset$dateTime, hpcSubset$Sub_metering_2,col="red")
lines(hpcSubset$dateTime, hpcSubset$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

# Plot 4 - Global_reactive_power
plot(x = hpcSubset$dateTime
     , y = hpcSubset$Global_reactive_power
     , type="l", xlab="datetime", ylab="Global_reactive_power")


dev.off()

