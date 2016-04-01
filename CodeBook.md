Code book for the Getting and Cleaning Data Course Project

The original data sets are in a downloaded zipped file named getdata_projectfiles_UCI HAR Dataset.zip
Dataset.zip which is a shorter name and more convenient for accessing later.

Part 2
con1 through con4 are used to set up connections to the respective data files that are then transformed in data tables:

con1	activity_labels.txt	activity_df
con2	features.txt		features_df
con3	subject_test.txt	subject_test_df
con4	Subject_train.txt	Subject_train_df

Part 3

Merging the test and training subject datasets
The subject_final_df is created by combining the subject_test_df and subject_train_df  using “rbind” to create a single data table.

Part 4

It has been assumed that the files in the inertial signals folders within the test folder have been summarized to create the main test data files (x_test.txt and y_test.txt). Connections are once again set up to access these files and transform them into data tables
con1	X_test.txt	X_test_df
con2	Y_test.txt	Y_test_df
con3	subject_test.txt	subject_test_df

Part 5

Matching the activity labels to the test observations and then to the training observations
xy_test_df  is created using “cbind”  on the tables y_test_df and x_test_df to create a data table with descriptive variable names on each column.

Part 6

It has also been assumed that the files in the inertial signals folders with in the training folder have been summarized to create the main training data files (x_train.txt and y_train.txt).  These therefore are the files for which appropriate connections are once again set up to access these files and transform them into data tables. 

con1	X_train.txt	X_train_df
con2	Y_train.txt	Y_train_df
con3	subject_train.txt	subject_train_df

Matching the activity labels to the training observations 
xy_train_df  is created using “cbind”  on the tables y_train_df and x_train_df to create a data table with descriptive variable names on each column.

Part 7

Merging the test and training datasets (xy_test_df,xy_train_df)  to create xy_merge_df  which is subsequently is matched with the  subject dataset to create xy_subject_final_df.

Part 8

Match the final dataset above with the activity labels using the merge function creates (xy_df)  which after re-organizing the data is used to create the final clean data set arranged by subject and activity (rfinal_df) 
Using the dplyr package, we finally have a new clean data set with the required averages for each activity and subject ( mydt2).


