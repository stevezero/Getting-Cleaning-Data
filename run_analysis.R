# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable for each activity and each subject.


require(reshape2)


features <- read.table("./UCI HAR Dataset/features.txt")[,2]
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

##Test dataset
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
names(subject_test) <- "Subject"
names(x_test) <- features


##Test Activities
names(y_test) <- "Activity_ID"
y_test$Activity_Label = activity_labels[y_test[,1],][,2]


##Train dataset
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
names(subject_train) <- "Subject"
names(x_train) <- features

##Train Activities
names(y_train) <- "Activity_ID"
y_train$Activity_Label = activity_labels[y_train[,1],][,2]


##Logical vector of mean and std dev features extract
mean.std <- grepl("mean|std", features)


##Extract required features from each data set
x_test <- x_test[,mean.std]
x_train <- x_train[,mean.std]

##Bind test data
test_data <- cbind(subject_test, y_test, x_test)
##Bind train data
train_data <- cbind(subject_train, y_train, x_train)

##Bind test and train data together
data <- rbind(test_data, train_data)


##Measure variables for melt
measures <- features[mean.std]
datamelt <- melt(data, id = c("Subject","Activity_Label"), measure.vars = measures)
tidy_data <- dcast(datamelt, Subject + Activity_Label ~ variable, mean)

write.table(tidy_data, file = "tidy_data.txt", row.name=FALSE)
