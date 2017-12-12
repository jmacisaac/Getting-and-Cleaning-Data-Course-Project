# Getting and Cleaning Data Project

## Steps

set working directory (zipped folders copied to the directory)

 1) Merges the training and the test sets to create one data set.
	- Read train, test, activity and feature tables
	- Add Column names/headings
	- combine test data and traing data for complete dataset

 2) Extracts only the measurements on the mean and standard deviation for each measurement. 

 3) Uses descriptive activity names to name the activities in the data set 

 4) Appropriately labels the data set with descriptive variable names. 

 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	- use library(plyr)
	- create a text file tidy_dataset.txt for upload

For more info please see CodeBook.md