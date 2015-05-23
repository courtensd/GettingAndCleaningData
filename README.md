Getting And Cleaning Data - Course Project
==========================================

Introduction
------------
This repo contains my Course Project files of the 'Getting And Cleaning Data' module of the data science specialization program from Coursera.
The `run_analysis.R` script contains the code for this course project.

Script explanation
------------------
The script can be used to create and write 1 tidy dataset based on data spread over several files of the UCI HAR Dataset.
In the tidy dataset the data is summarized in order to give an overview of the average values of each individual mean and std variable on the level of Subject - Activity.

The script executes the following steps:
1. Load relevant packages into R
2. Load data into R
3. Merge the test and training data set
4. Subset the data sets to filter out only mean and std variables
5. Enrich the merged data with labels (activities) and subject data
6. Add the activity descriptions to the data set (via left join)
7. Calculate the average of each variable on level Subject - Activity
8. Write the tidy data set result back to the working directory (file name = `output_tidy_dataset.txt`) 


Running the script
------------------

1. Move data to working directory

Before running the script move the following content of the UCI HAR Dataset to your working directory:
	Folders:
	* train
	* test
	Files:
	* activity_labels
	* features

2. Run the script

To run the script, you only have to source the script run_analysis.R contained in this repo into R studio.

