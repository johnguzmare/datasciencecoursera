
## ----------------------------------------------------------------------------------------

##  Getting and Cleaning Data Course Project  

# run_analysis.R does the following:

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. Creates a second, independent tidy data set with the average of each variable for:
#    - each activity
#    - each subject.

# Note: This R file assume the data for the project is downloaded and unzipped in dir "UCI HAR Dataset"
# data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## ----------------------------------------------------------------------------------------

setwd("/Users/jguzman/Documents/onedrive/DataScience/gitRepo/Getting\ and\ Cleaning\ Data/Week4/Project")

library(reshape2)

# 1. Merges the training and the test sets to create one data set.

# Reading activity labels and get column V2
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
head(activityLabels)

# Reading feature vector and get column V2
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])
head(features)

# Reading trainings tables
trainingSet <- read.table("UCI HAR Dataset/train/X_train.txt")
trainingLabels <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Reading testing tables
testSet <- read.table("UCI HAR Dataset/test/X_test.txt")
testLabels <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Combine objects from train and test files by column
trainingSet <- cbind(trainSubjects, trainingLabels, trainingSet)
testSet <- cbind(testSubjects, testLabels, testSet)

# Merges the training and test sets by rows.
tData <- rbind(trainingSet, testSet)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

# Extract only the data on mean and standard deviation from features
tFeats <- grep(".*mean.*|.*std.*", features[,2])
tFeats.names <- features[tFeats,2]

# Set appropriately labels for variable names
tFeats.names <- gsub('-mean', 'Mean', tFeats.names)
tFeats.names <- gsub('-std', 'Std', tFeats.names)
tFeats.names <- gsub('[-()]', '', tFeats.names)

# 4. Appropriately labels the data set with descriptive variable names.
colnames(tData) <- c("subject", "activity", tFeats.names)

# 3. Uses descriptive activity names to name the activities in the data set
tData$activity <- factor(tData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
tData$subject <- as.factor(tData$subject)

# Creates a second, independent tidy data set with the average of each variable for:
#  - each subject
#  - each activity

tDataMean <- dcast(melt(tData, id = c("subject", "activity")), subject + activity ~ variable, mean)

# Export the tidyData set 
write.table(tDataMean, "tidy.txt", row.names = FALSE, quote = FALSE)



