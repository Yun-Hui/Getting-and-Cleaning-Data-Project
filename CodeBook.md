# Code Book

The codebook describes the variables, the data, and any data transformations.

## Data Set 
- the tidy dataset contains 180 observation and 68 variables.The variables inclue subject id, act_name and measurement variable indicating mean and standard diviation that come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
- To better understand those variables, you cann see "feature_info.txt" in the Data file(zip) listed below.

## Background
 The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

 The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
 
More description about the files
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Data files:
Files to download
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## The dataset includes the following files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

## Output of run_analysis.R 
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps of run_analysis.R
0. Install reshape2 package
1. Get the activity lables used for Y files
2. Get colum names used for X files
3. Combine all data (subject,test and train) and assign the column names to the files
4. Appropriately labels the data set with descriptive variable names
5. Extract only the mean and standard deviation for each measurement
6. Create tidy dataset

