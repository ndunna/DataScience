## Introduction

 The script  run_analysis.R performs the 5 steps as described in the project requirement.


#Step 0.
 Download the file into a staging directory, Unzip files and store in appropriate working directories.

# Step 1 : Merges Trng and Test datasets in to one dataset.

  Read Activity Files (Test as well as Training) and create datasets

  Read Subject Files (Test as well as Training) and create datasets

  Read Features data Files (Test as well as Training) and create datasets

  Concatenate data sets by rows (test and training) into one for Activity, Subject and Features.

# Step 2 Create a list of columns that need to extracted from Data set and use the list to  subset combined data into a separate dataset. 

  Set appropriate names to the data set objects.

  Combine Subject, Activity and Features data sets/frames into an object Data.

  Extract only measurements on the mean() and std deviation() for each measurement.

  use escape sequence to code for "(" and ")"

  Create a list of names (features, activity and subject) that will be used to extract the data

# Step 3 Labels the data set with descriptive variable names

# Step 4 Create another independent tidy data and create an output file with data.


# Variables Used in the script.

fileUrl : for storing the URL to be downloaded.
path_rf : Path for Data files on local machine
files   : For storing list of files on the local machine. 

dataActivityTest : For storing Activity Data 
dataActivityTrain : For storing Activity Data 


For storing Subject Data 

dataSubjectTest 
dataSubjectTrain 

For storing Features Data

dataFeaturesTest 
dataFeaturesTrain

For storing Combined training and Test data for activity, Features and Subject separately.

dataSubject 
dataActivity 
dataFeatures

Data : A Data frame for combined data from Activity, Subject and Features.

Data2 : A final Data Frame with average of each variables for each activity and each subject.
