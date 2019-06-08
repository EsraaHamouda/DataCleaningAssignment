Data cleaning task

Step1: Merges the training and the test sets to create one data set.
the following is the data related to the test population which is loaded from the downloaded dataset from the zip file
subject_test --> subject IDs for the test data
x_test		 --> the actual values for the test data 
y_test       --> IDs  for the test data
------
the following is the data related to the training population which is loaded from the downloaded dataset from the zip file
subject_train  --> subject IDs for the train data
x_train        --> the actual values for the train data 
y_train        --> IDs  for the train data

 I tried to write every result to csv file to verify the data content
=====================================================
Step2: Extracts only the measurements on the mean and standard deviation for each measurement.

meanCols --> data frame that contains only data related to mean
stdCols--> data frame that contains only data related to standard deviation
CombinedDataSet --> the data set for only mean and standard deviation
==========================================================================
Step3: Uses descriptive activity names to name the activities in the data set
activities      --> activity labels
replace the numeric values that represent the lables with string lables
=========================================================================

Step4: Appropriately labels the data set with descriptive variable names.

features_names  --> columns names for the data
after assigning the feature names to the columns names. I renamed the columns names to start with capital letters
and replacing mean to average 
std -> to stabdard deviation
===================================================================

Step7: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Finally I applied some statistics to the data and write it to file called statistics
