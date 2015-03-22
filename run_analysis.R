# Naren Dunna.
# Getting and Cleanin DAta Course


#Step 0.
# Download the file into a staging directory ./data directory.
# Set the working directory prior to the execution of the script.
# Download the file to Dataset.zip file.

setwd("C:/Users/nadunna/Documents/Learning/Data Scientist/03-Getting and Cleaning Data/Project")
if (!file.exists ("./data")) { dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file (fileUrl, destfile="./Data/Dataset.zip")

# unzip files into ./data directory. 

unzip(zipfile="./data/Dataset.zip", exdir="./data")

#Create a path and use that path to get list of files for later processing.

path_rf <- file.path("./data", "UCI HAR Dataset")
files<- list.files(path_rf, recursive=TRUE)
files


# Step 1 : Mergess Trng and Test datasets in to one dstaset.

# Read Activity Files (Test as well as Training) and create datasets

dataActivityTest <- read.table(file.path(path_rf, "test", "Y_test.txt"), header=FALSE)
dataActivityTrain <- read.table(file.path(path_rf, "train", "Y_train.txt"), header=FALSE)

# Read Subject Files (Test as well as Training) and create datasets

dataSubjectTest <- read.table(file.path(path_rf, "test", "subject_test.txt"), header=FALSE)
dataSubjectTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"), header=FALSE)

# Read Features data Files (Test as well as Training) and create datasets

dataFeaturesTest <- read.table(file.path(path_rf, "test", "X_test.txt"), header=FALSE)
dataFeaturesTrain <- read.table(file.path(path_rf, "train", "X_train.txt"), header=FALSE)

# Concatenate data sets by rows (test and training) into one for Activity, Subject and Features.

dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity <- rbind(dataActivityTrain, dataActivityTest)
dataFeatures <- rbind(dataFeaturesTrain, dataFeaturesTest)

# Step 2 Create a list of columns that need to extracted from Data set and use the list to
# subset combined data into a separate dataset. 

# Set appropriate names to the data set objects.

names(dataSubject) <- c("subject")
names(dataActivity) <- c("activity")

dataFeaturesNames <- read.table(file.path(path_rf, "features.txt"), head=FALSE)
names(dataFeatures) <- dataFeaturesNames$V2

# Combine Subject, Activity and Features data sets/frames into a object Data.

dataCombine <- cbind(dataSubject, dataActivity)
Data <- cbind(dataFeatures, dataCombine)

# Extract only measurements on the mean() and std deviation() for each measurement.
# use escape sequence to code for "(" and ")"

subsetdtFeatureNames <- dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]

# Create a lsit of names that can be used to extract the data

NamesList <- c(as.character(subsetdtFeatureNames), "subject","activity")

# Extract the data from data fram eby NamesList created above. 

Data <- subset(Data, select=NamesList)

# Read Activity Labels from given file : activity_labels.txt.


activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"), header = FALSE)

Step 3. : # labels the data set with descriptive variable names

names(Data)<-gsub("^t", "Time", names(Data))
names(Data)<-gsub("^f", "Frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

# Step 4 : # Create another independent tidy data and create an output file with data.

library(plyr);
Data2<-aggregate(. ~subject + activity, Data, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "tidydata.txt",row.name=FALSE)
