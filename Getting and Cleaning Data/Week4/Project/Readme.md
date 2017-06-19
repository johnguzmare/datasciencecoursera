# Getting and Cleaning Data Course Project - Readme

## Synopsis

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

### Data

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
    
    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
    
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


### Assignment
create one R script called 'run_analysis.R' that does the following:

* 1- Merges the training and the test sets to create one data set.
* 2- Extracts only the measurements on the mean and standard deviation for each measurement.
* 3- Uses descriptive activity names to name the activities in the data set
* 4- Appropriately labels the data set with descriptive variable names.
* 5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Data processing

'Note:' file 'run_analysis.R' assume the data for the project is downloaded and unzipped in dir "UCI HAR Dataset"

### 1. Merges the training and the test sets to create one data set.

#### Reading activity labels and get column V2 as character
```r
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
head(activityLabels)
```

#### Reading feature vector and get column V2 as character
```r
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])
head(features)

```
#### Reading trainings tables 
```r
trainingSet <- read.table("UCI HAR Dataset/train/X_train.txt")
trainingLabels <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
```

#### Reading testing tables
```r
testSet <- read.table("UCI HAR Dataset/test/X_test.txt")
testLabels <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
```

#### Combine objects from train and test files by column
```r
trainingSet <- cbind(trainSubjects, trainingLabels, trainingSet)
testSet <- cbind(testSubjects, testLabels, testSet)
```

#### Merges the training and test sets by rows.
```r
tData <- rbind(trainingSet, testSet)
```

### 2. Extracts only the measurements on the mean and standard deviation for each measurement.

#### Extract only the data on mean and standard deviation from features

Use 'grep' to match the patterns for 'mean' and 'standard deviation' features and set the result to 'tFeats.names'
```r
tFeats <- grep(".*mean.*|.*std.*", features[,2])
tFeats.names <- features[tFeats,2]
```

#### Set appropriately labels for variable names

replaces all matches in 'tFeats.names' to clean variable names using 'gsub()' 

```r
tFeats.names <- gsub('-mean', 'Mean', tFeats.names)
tFeats.names <- gsub('-std', 'Std', tFeats.names)
tFeats.names <- gsub('[-()]', '', tFeats.names)
```

### 3. Appropriately labels the data set with descriptive variable names.
```r
colnames(tData) <- c("subject", "activity", tFeats.names)
```

### 4. Uses descriptive activity names to name the activities in the data set
```r
tData$activity <- factor(tData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
tData$subject <- as.factor(tData$subject)
```

### 5. Creates a second, independent tidy data set with the average of each variable for:

 - each subject
 - each activity
```r
tDataMean <- dcast(melt(tData, id = c("subject", "activity")), subject + activity ~ variable, mean)
```
Export the tidy Data set to file 'tidy.txt'
```r
write.table(tDataMean, "tidy.txt", row.names = FALSE, quote = FALSE)
```



