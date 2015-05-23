Code Book: Getting And Cleaning Data - Course Project 
=====================================================

This document explains the variables used in the code of the R script `run_analysis.R`.

Via commenting the script is split up into 4 main sections:

1. Load needed packages (plyr & dplyr) into R
2. Load needed data into R
3. Create a tidy data set
4. Write the result back to a .txt file in the working directory

For step 2 and 3 intermediate results are stored in different variables.
These are explained in more detail below.

Load needed data into R
-----------------------
The raw data of the course project dataset UCI HAR Dataset is read into the following data variables:
* features = raw data of 'features.txt' file
* var_names = features vector subsetted on column 2, to only have the names of the dataset variables    
* test_x & train_x = raw data of 'X_test.txt' and 'X_train.txt' files, variable 'var_names' is used for the column names
* test_labels and train_labels = raw data of 'y_test.txt' and 'y_train.txt', with column name 'ActivityID'
* test_subjects and train_subjects = raw data of 'subject_test.txt' and 'subject_train.txt', with column name 'Subject'
* actv_labels = raw data of 'activity_labels.txt', with column names 'ActivityID' and 'Activity'

Create a tidy data set
----------------------
For the creation of the tidy data set several intermediate variables where needed:

* merged_data_x = row bind of X_test and X_train datasets
* merged_mean = only select mean variables for the merged_data_x 
* merged_std = only select std variables for the merged_data_x
* merged_subset = column bind of merged_mean and merged_std to bind the 2 datasets back to 1
* test_labels_subject and train_labels_subject = combine test and train label data with test and train subject data
* merged_labels_subject = column bind of test_labels_subject and train_labels_subject to 1 dataset
* merged_set = result of merging the 'X' (measurements), 'Y' (activity labels) and 'subject' files of test and train data

* joined_set = merged_set enriched with activity descriptions

* tidy_dataset = summarized final result dataset => all columns averaged on level 'Subject - Activity'


