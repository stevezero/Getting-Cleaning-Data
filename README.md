#Getting and Cleaning Data
##Course Project

###The goal of this assignment is to create one R script called run_analysis.R that does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###Dependencies
This script requires the ```reshape2``` package to be installed. The script will install this package automatically if it is not installed.

###Steps to reproduce the results:
1. Download and unzip the dataset to your working directory.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 + You should have a folder in the working directory called **UCI HAR Dataset**. 
2. Place the ```run_analysis.R``` file in your working directory.
3. Run ```source("run_analysis.R")```. It will generate a new file ```tidy_data.txt``` in your working directory.
4. The resulting dataset (tidy_data.txt) is a wide form dataframe that fits the principles of tidy data, because each variable measured is in one column, and each different observation of that variable is in a different row.
