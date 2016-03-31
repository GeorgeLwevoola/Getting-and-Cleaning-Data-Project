
## Download file and Open up connections to the files in the downloaded zip file
## These connections are closed by R after use

if(!file.exists("Dataset.zip")){
  fileUrl <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl,destfile="Dataset.zip")
}

con1 <- unz(description="Dataset.zip", filename="UCI HAR Dataset/activity_labels.txt")
activity_df<- read.table(con1,col.names=c("ID","ACTIVITY"),fill=FALSE,strip.white=TRUE)

con2 <- unz(description="Dataset.zip", filename="UCI HAR Dataset/features.txt")
features_df <-read.table(con2)

con3 <- unz(description="Dataset.zip", filename="UCI HAR Dataset/test/subject_test.txt")
subject_test_df <-read.table(con3,col.names=c("SUBJECT"),fill=FALSE,strip.white=TRUE)

con4 <- unz(description="Dataset.zip", filename="UCI HAR Dataset/train/subject_train.txt")
subject_train_df <-read.table(con4,col.names=c("SUBJECT"),fill=FALSE,strip.white=TRUE)

## merge the test and training subject datasets
subject_final_df <-rbind(subject_test_df,subject_train_df)

## open and read the main test datasets attaching the features labels
con1 <- unz(description="Dataset.zip", filename="UCI HAR Dataset/test/X_test.txt")
x_test_df<- read.table(con1,col.names=c(as.character(features_df[1:561,2])),fill=FALSE,strip.white=TRUE)

con2 <- unz(description="Dataset.zip", filename="UCI HAR Dataset/test/y_test.txt")
y_test_df <-read.table(con2,col.names=c("ID"),fill=FALSE,strip.white=TRUE)

## match the activity labels to the test observations
xy_test_df <-cbind(y_test_df,x_test_df)

## open and read the main training datasets attaching the features labels
con1 <- unz(description="Dataset.zip", filename="UCI HAR Dataset/train/X_train.txt")
x_train_df <-read.table(con1,col.names=c(as.character(features_df[1:561,2])),fill=FALSE,strip.white=TRUE)

con2 <- unz(description="Dataset.zip", filename="UCI HAR Dataset/train/y_train.txt")
y_train_df <-read.table(con2,col.names=c("ID"),fill=FALSE,strip.white=TRUE)

## match the activity labels to the training observations
xy_train_df <-cbind(y_train_df,x_train_df)

## merge the test and training datasets
xy_merge_df <-rbind(xy_test_df,xy_train_df)

## match the subject dataset to the merged (test and training) datasets
xy_subject_final_df <-cbind(subject_final_df,xy_merge_df)

## match the final dataset with the activity labels
xy_df <-merge(x=activity_df,y=xy_subject_final_df, by="ID", All=FALSE)
## create the final clean data set arranged by subject and activity
  final_df <- xy_df[ order(xy_df[,3], xy_df[,1]), ]
  rfinal_df <- final_df[ ,c(2:9,44:49)]

## From the data set above, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
  colformean <- names(rfinal_df)[3:14]
  library(dplyr)
  mydt <- group_by(rfinal_df,SUBJECT,ACTIVITY)
  mydt2 <-summarize_each(mydt,funs(mean))

