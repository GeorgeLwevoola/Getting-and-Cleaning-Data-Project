==================================================================
Readme for the Getting and Cleaning Data Course Project
==================================================================
George Lwevoola
Global Information Systems Limited
E-mail: glwevoola@gmail.com/admin@gisuganda.com
www.gisuganda.com
==================================================================

We start off with the main data sets in a downloaded zipped file named getdata_projectfiles_UCI HAR Dataset.zip.
The downloaded file is renamed Dataset.zip and its files are accessed without unzipping using the R function unz.

The first requirement is to transform the respective data files from the txt format into data tables. These are then subjected to various operations to progressively create clean data sets.

==========================================
activity_labels.txt	activity_df
features.txt		features_df
subject_test.txt	subject_test_df
Subject_train.txt	Subject_train_df

X_test.txt		x_test_df
y_test.txt		y_test_df
subject_test.txt	subject_test_df

X_train.txt		X_train_df
y_train.txt		y_train_df
subject_train.txt	subject_train_df
============================================
The subject_final_df is created through combining the subject_test_df and subject_train_df using the "rbind” function. This essentially brings together the 30% test and 70% training subjects observed that are originally separate.

The activity labels (WALKING
,WALKING_UPSTAIRS
, WALKING_DOWNSTAIRS
, SITTING
, STANDING
,LAYING
) are matched to the test and the training observations respectively using the R function merge. 

The complete xy_test_df  and xy_train_df are created using “cbind”  on the tables (y_test_df and x_test_df), (y_train_df and x_train_df) respectively to create data tables with descriptive variable names for each column found in the y_test_df and y_train_df. 


Merging the test and training datasets (xy_test_df,xy_train_df)  creates the xy_merge_df. Macthed with the  subjects dataset created earlier yields the xy_subject_final_df. The addition of the activity labels using the merge function creates the xy_df data table which contains all the observed subjects listed alongside the activity performed.

Re-arranging the dataset xy_df creates  the final clean data set arranged by subject and activity rfinal_df with the required observations means and standard deviation variables.

Finally using the dplyr package, we create a new clean data set with the computed averages for each activity and subject.

========================================================================================================================
Note that it has been assumed that the files in the inertial signals folders within the test and training folder have been summarized to create the main training data files (x_train.txt and y_train.txt).  These therefore are the files for which appropriate transformation and analysis have been performed. 


March 2016