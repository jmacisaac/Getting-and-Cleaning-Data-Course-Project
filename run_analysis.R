###########################################################################################
# run_analysis.R
# Getting and Cleaning Data Course Project
# Dec 2017
###########################################################################################

###########################################################################################
#set working directory (zipped folders copied to the directory)
setwd('/Users/UCI HAR Dataset/');
###########################################################################################

###########################################################################################
# 1) Merges the training and the test sets to create one data set.
###########################################################################################
### Read train, test, activity and feature tables

features <- read.table('features.txt') # List of all features, used for header for x datasets. 561 rows, 2 columns

x_train <- read.table("train/X_train.txt") #T raining set 7352 rows 561 columns
x_test <- read.table("test/X_test.txt") # Test set 2947 rows 561 columns

y_train <- read.table("train/y_train.txt") # Training labels 1 to 6
y_test <- read.table("test/y_test.txt") # Test labels 1 to 6

subject_train <- read.table("train/subject_train.txt") # identifies the subject 1 to 30. 7352 rows 
subject_test <- read.table("test/subject_test.txt") # identifies the subject 1 to 30. 2947 row


activity_labels <- read.table('./activity_labels.txt') # activity labels 6 rows, 2 columns

### Add Column names/headings
### 2nd column of features used

colnames(x_train) <- features[,2] 
colnames(x_test) <- features[,2] 

### text activity ID

colnames(y_train)  <- "activity_id"
colnames(y_test)  <- "activity_id"

### text subject ID

colnames(subject_train)  <- "subject_id"
colnames(subject_test)  <- "subject_id"

### text activity ID & activity type

colnames(activity_labels) <- c('activity_id','activity_type')

### Test Merge
test_merge <- cbind(subject_test, y_test, x_test)

### Train Merge
train_merge <- cbind(subject_train, y_train, x_train)

###Final unioned dataset
merged_dataset <-rbind(test_merge,train_merge)

###########################################################################################
# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
###########################################################################################

### Should be subject_id,activity_id & 86 Mean/Std columns
meanstd_dataset <- merged_dataset[, grep("subject_id|activity_id|Mean|Std", names(merged_dataset), ignore.case=TRUE)]

###########################################################################################
# 3) Uses descriptive activity names to name the activities in the data set 
###########################################################################################

meanstd_dataset<- merge(activity_labels,meanstd_dataset,by.x="activity_id",by.y ="activity_id",all=TRUE)

###########################################################################################
# 4) Appropriately labels the data set with descriptive variable names. 
###########################################################################################

names(meanstd_dataset)<-gsub("^t", "Time", names(meanstd_dataset))
names(meanstd_dataset)<-gsub("^f", "Frequency", names(meanstd_dataset))
names(meanstd_dataset)<-gsub("tBody", "TimeBody", names(meanstd_dataset))
names(meanstd_dataset)<-gsub("Acc", "Accelerometer", names(meanstd_dataset))
names(meanstd_dataset)<-gsub("Gyro", "Gyroscope", names(meanstd_dataset))
names(meanstd_dataset)<-gsub("BodyBody", "Body", names(meanstd_dataset))
names(meanstd_dataset)<-gsub("Mag", "Magnitude", names(meanstd_dataset))

###########################################################################################
# 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
###########################################################################################

library(plyr)

tidy_dataset <- ddply(.data = meanstd_dataset, .variables = c("subject_id", "activity_id", "activity_type"), .fun = numcolwise(mean))

write.table(tidy_dataset, file = "tidy_dataset.txt", row.names = FALSE)