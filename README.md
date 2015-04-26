## tidy_data
repo containing submission for the getting and cleaning data course

this repository contains three files:

- README.md - this file!
- run_analysis.R - an R script to read in text files and output tidy data, as per the Getting & Cleaning Data assignment
- CodeBook.md - a file which describes the data output by run_analysis.R

# run_analysis.R

this script uses the dplyr library and requires the following files to exist within the working R directory:

- activity_labels.txt
- features.txt
- subject_test.txt
- y_test.txt
- X_test.txt
- subject_train.txt
- y_train.txt
- X_train.txt

the script performs the following functions:

- reads in all of the above text files
- matches the activity names from activity_labels.txt to the data from the y_test.txt and y_train.txt files, which only contain the activity codes
- sets the column names for the data imported from X_test.txt and X_train.txt as the values held in features.txt
- for both the test and training data, selects only the variables holding data relating to mean and standard deviation measurements, then merges each of the two datasets with the relevant subject and activity data
- combines the test and the training data into a single dataset
- groups the data by subject and activity, then caculates the mean of all measurements
- outputs the grouped, summarised data to a text file, tidy_data.txt




