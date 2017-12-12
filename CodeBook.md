# Getting and Cleaning Data Project

# Background information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


The following are loaded from the downloaded UCI HAR data
features - List of all feature names, used for header for x datasets. 561 rows, 2 columns
x_train - Training set 7352 rows 561 columns
x_test - Test dataset - 2947 rows 561 columns
y_train - Training labels 1 to 6
y_test - Test labels 1 to 6
subject_train - identifies the subject 1 to 30. 7352 rows 
subject_test - identifies the subject 1 to 30. 2947 row
activity_labels - activity labels 6 rows, 2 columns (used to decode y_train and x_train)
test_merge - combines the Activity ID for test, Subject ID for test and X_test dataset
train_merge - combines the Activity ID for training, Subject ID for training and X_train dataset
merged_dataset - unions the test_merge and train_merge together
meanstd_dataset - queries on merged_dataset activity_id, subject_id and any column containing 'mean' or 'std' (activity type also added in following step)
tidy_dataset - cleaned up columns names, only contains activity_id, subject_id, activity_id and average of each variable

# Steps

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
