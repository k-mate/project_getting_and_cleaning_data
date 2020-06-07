# Week 4 Peer Grade Assignment

#------------------------------------------------------------------------------------------------------
# Getting data
#------------------------------------------------------------------------------------------------------

# Download the dataset in /data directory (Check if directory already exists)

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

# Unzip dataSet to /data directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")

#------------------------------------------------------------------------------------------------------
# Reading all dataframes
#------------------------------------------------------------------------------------------------------

# Train data:
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Test data:
X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# Features data:
features <- read.table('./data/UCI HAR Dataset/features.txt')

# Activity labels data:
activity_labels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

# label colnames
colnames(X_train) <- colnames(X_test) <- paste(colnames(X_train), features$V2, sep = "_")
colnames(Y_train) <- colnames(Y_test) <- "activityCode"
colnames(subject_test) <- colnames(subject_train) <- "subject"
colnames(activity_labels) <- c('activityCode','activityType')

#------------------------------------------------------------------------------------------------------
# Step 1: Merges the training and the test sets to create one data set.
#------------------------------------------------------------------------------------------------------
train <- cbind(subject_train, Y_train, X_train)
test <- cbind(subject_test, Y_test, X_test)
Merged_Data <- rbind(train, test)

#------------------------------------------------------------------------------------------------------
# Step 2.-Extracts only the measurements on the mean and standard deviation for each measurement.
#------------------------------------------------------------------------------------------------------
library(dplyr)
MeanStd_Data <- Merged_Data %>% 
  select(subject, activityCode, contains("mean()"), contains("std()"))

#------------------------------------------------------------------------------------------------------
# Step 3. Uses descriptive activity names to name the activities in the data set
#------------------------------------------------------------------------------------------------------
ActnamesMeanStd_Data <- right_join(activity_labels, MeanStd_Data, by = "activityCode")

#------------------------------------------------------------------------------------------------------
# Step 4: Appropriately labels the data set with descriptive variable names.
#------------------------------------------------------------------------------------------------------
VarNames <- sapply(strsplit(colnames(ActnamesMeanStd_Data), "_"), tail, 1) 

descriptiveVarNames <- function(oldname, newname, ignore.cases = TRUE){
  gsub(oldname, newname, VarNames, ignore.case = FALSE)
}

VarNames <- descriptiveVarNames("-mean\\()", " Mean") 
VarNames <- descriptiveVarNames("-std\\()", " Std") 
VarNames <- descriptiveVarNames("Acc", "Accelerometer")
VarNames <- descriptiveVarNames("Gyro", "Gyroscope")
VarNames <- descriptiveVarNames("Mag", "Magnitude") 
VarNames <- descriptiveVarNames("^t", "Time") 
VarNames <- descriptiveVarNames("^f", "Frequency") 

tidyData <- ActnamesMeanStd_Data %>%
  `colnames<-`(VarNames)

#------------------------------------------------------------------------------------------------------
# Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject.
#------------------------------------------------------------------------------------------------------

FinalData <- tidyData %>%
  group_by(subject, activityCode, activityType) %>%
  summarise_all(funs(mean))

write.table(FinalData, "FinalData.txt", row.name=FALSE)