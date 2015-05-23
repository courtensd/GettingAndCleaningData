#load libraries into R

        library(plyr)
        library(dplyr)

#load all data for analysis into R (Preq: all data files are in the working directory)

        features <- read.table("features.txt")
        var_names <- features[,2]
        
        test_x <- read.table("test/X_test.txt", col.names = var_names)
        train_x <- read.table("train/X_train.txt", col.names = var_names)
        
        test_labels <- read.table("test/y_test.txt", col.names = c("ActivityID"))
        train_labels <- read.table("train/y_train.txt", col.names = c("ActivityID"))
        
        test_subjects <- read.table("test/subject_test.txt", col.names = c("Subject"))
        train_subjects <- read.table("train/subject_train.txt", col.names = c("Subject"))
        
        actv_labels <- read.table("activity_labels.txt", col.names = c("ActivityID", "Activity"))
        

#Create tidy dataset
#  Merge data
        
        merged_data_x <- rbind(test_x, train_x)
        
#  Subset mean and std variables
        
        merged_mean <- select(merged_data_x, contains("mean"))
        merged_std <- select(merged_data_x, contains("std"))
        
        merged_subset <- cbind(merged_mean, merged_std)
        
#  Merge dataset, labels, subject for test and train
        test_labels_subject <- cbind(test_labels, test_subjects)
        train_labels_subject <- cbind(train_labels, train_subjects)
        
        merged_labels_subject <- rbind(test_labels_subject, train_labels_subject)
        
        merged_set <- cbind(merged_subset, merged_labels_subject)
        
#  Add activity names to dataset             
        joined_set <- join(merged_set, actv_labels,by = "ActivityID")
        
#  Calculate mean of each variable on the level of subject - activity
        
        tidy_dataset <- ddply(joined_set, .(Subject, ActivityID, Activity), numcolwise(mean))
        
#Write result tidy date set to a csv file in the working directory
        
        write.table(tidy_dataset, file = "output_tidy_dataset.txt", row.names = FALSE)
        
        
        
        
        
        