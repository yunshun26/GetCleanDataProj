#  This script (run_analysis.R) does the following:
#  1. Merges the training and the test sets to create one data set.
#  2. Extracts only the measurements on the mean and standard deviation 
#     for each measurement.
#  3. Uses descriptive activity names to name the activities in the data set
#  4. Appropriately labels the data set with descriptive variable names.
#  5. From the data set in step 4, creates a second, independent tidy data
#     set with the average of each variable for each activity and each subject. 
#
#  Set the file directory and libraries
setwd("C:/Users/catherine/Documents/UCI_HAR_Dataset/scripts")
library(data.table)
library(dplyr)
# Loads Activity Labels and Features files 
activitylabels <- read.table("C:/Users/catherine/Documents/UCI_HAR_Dataset/activity_labels.txt", header=FALSE)
features <- read.table("C:/Users/catherine/Documents/UCI_HAR_Dataset/features.txt")
# Loads Test Set data
subjectTest <- read.table("C:/Users/catherine/Documents/UCI_HAR_Dataset/test/subject_test.txt", header=FALSE)
featuresTest <- read.table("C:/Users/catherine/Documents/UCI_HAR_Dataset/test/X_test.txt", header=FALSE)
activityTest <- read.table("C:/Users/catherine/Documents/UCI_HAR_Dataset/test/y_test.txt", header=FALSE)
# Loads Train set data
subjectTrain <- read.table("C:/Users/catherine/Documents/UCI_HAR_Dataset/train/subject_train.txt", header=FALSE)
featuresTrain <- read.table("C:/Users/catherine/Documents/UCI_HAR_Dataset/train/X_train.txt")
activityTrain <- read.table("C:/Users/catherine/Documents/UCI_HAR_Dataset/train/y_train.txt")
# Merge the Test and Train set data
mergeSubject <- rbind(subjectTrain, subjectTest)
mergeFeatures <- rbind(featuresTrain, featuresTest)
mergeActivity <- rbind(activityTrain, activityTest)
# Assign column names to features table
colnames(mergeFeatures)<-t(features[2])
# Assign column names to subject
colnames(mergeSubject) <- "Subject"
# Assign column name to Activity table
colnames(mergeActivity)<-"Activity"
#------------------------------------------------------------------
# 1. Merges the training and the test sets to create one data set.
#------------------------------------------------------------------
CompleteData <- cbind(mergeFeatures, mergeSubject, mergeActivity)
#--------------------------------------------------------------------------
# 2. Extracts only the measurements on the mean and standard deviation 
#    for each measurement.
#--------------------------------------------------------------------------
ColumnsMeanStd <- grep('mean|std', colnames(CompleteData),ignore.case=TRUE)
extractedColumns <- c(ColumnsMeanStd, 562, 563)
extractedData <- CompleteData[,extractedColumns]
#head(extractedData)
#--------------------------------------------------------------------------
# 3. Uses descriptive activity names to name the activities in the data set
#--------------------------------------------------------------------------
extractedData$Activity <- as.character(extractedData$Activity)
for (k in 1:nrow(extractedData)) {
        for (i in 1:6){
          if (extractedData$Activity[k]==i){
                extractedData$Activity[k]<- as.character(activitylabels[i,2])
          }
        }
}
extractedData$Activity <- as.factor(extractedData$Activity)
#----------------------------------------------------------------------
# 4. Appropriately labels the data set with descriptive variable names.
#----------------------------------------------------------------------
names(extractedData)
names(extractedData) <- gsub("Acc","Accelerometer", names(extractedData))
names(extractedData) <- gsub("Gyro","Gyroscope", names(extractedData))
names(extractedData) <- gsub("Mag","Magnitude", names(extractedData))
names(extractedData) <- gsub("^f","Frequency", names(extractedData))
names(extractedData) <- gsub("^t","Time", names(extractedData))
names(extractedData) <- gsub("BodyBody","Body", names(extractedData))
names(extractedData) <- gsub("angle","Angle", names(extractedData))
names(extractedData) <- gsub("tBody","TimeBody", names(extractedData))
names(extractedData) <- gsub("gravity","Gravity", names(extractedData))
names(extractedData) <- gsub("-mean","Mean", names(extractedData))
names(extractedData) <- gsub("-std","STD", names(extractedData))
#head(extractedData)
#------------------------------------------------------------------------------
# 5. From the data set in step 4, creates a second, independent tidy data
#    set with the average of each variable for each activity and each subject. 
#------------------------------------------------------------------------------
#class(extractedData$Activity)
#class(extractedData$Subject)
#tidydata <- group_by(extractedData, extractedData$Activity, extractedData$Subject)
TidyData <- aggregate(.~Activity + Subject, extractedData, mean)
write.table(TidyData, file="Tidy.txt", row.names=FALSE)

