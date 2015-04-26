# Version 1; 26/04/2015

# This is the run_analysis script for the course project which is part of the 
# getting and cleaning data class

# For further details about this script, please see the repository's README.md

# For further details about the data, please see the repository's CodeBook.md

# Install the dplyr library used in this script
library(dplyr)

# Read in the feature and activity text files
feat <- read.table("features.txt", col.names = c("feature_id", "feature_name"))
activ <- read.table("activity_labels.txt", col.names = c("activity_id","activity_name"))

# Read in the test subject ids
test_sub <- read.table("subject_test.txt", col.names = "subject_id")

# Read in the test activity ids, and merge with the activity names
test_act <- read.table("y_test.txt", col.names = "activity_id")
test_act <- merge(test_act, activ)

# Read in the test data and set the column headings to be the data read in from features.txt
test <- read.table("X_test.txt")
names(test) <- feat$feature_name

# As per the project requirements, select only the test data variables containing mean or standard deviation measurements
test <- test[,grepl("mean\\(\\)", colnames(test)) | grepl("std", colnames(test))]

# Join the test subject, test activity and test measurements into a single data frame
test <- cbind(test_sub, test_act, test)


# Read in the training subject ids
train_sub <- read.table("subject_train.txt", col.names = "subject_id")

# Read in the training activity ids, and merge with the activity names
train_act <- read.table("y_train.txt", col.names = "activity_id")
train_act <- merge(train_act, activ)

# Read in the training data and set the column headings to be the data read in from features.txt
train <- read.table("X_train.txt")
names(train) <- feat$feature_name

# As per the project requirements, select only the training data variables containing mean or standard deviation measurements
train <- train[,grepl("mean\\(\\)", colnames(train)) | grepl("std", colnames(train))]

# Join the training subject, training activity and training measurements into a single data frame
train <- cbind(train_sub, train_act, train)

# Combine the test and training data
combined <- rbind(test,train)

#Group the combined data by subject and activity, then calculate the mean of the remaining columns
tidy <- combined %>% group_by(subject_id, activity_id, activity_name) %>% summarise_each(funs(mean))

# Output the 'tidy' data as a text file
write.table(tidy, "tidy_data.txt", row.name=FALSE)
