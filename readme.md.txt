# DataScience
Repository for Data Scientist Class

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis

1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  


One of the most exciting areas in all of data science right now is wearable computing - see for example  this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The script completes the task in a 5 steps process.
0.	Download all relevant data from URLs, unzip files and store them in appropriate working directories.
1.	Merges Trng and Test datasets in to one dataset (Activity, Subject and Features data).
2.	Create a list of columns that need to extracted (i.e mean and std deviation for each measurement) from Data set and use the list to subset combined data into a separate dataset.
3.	Use appropriate labels/columns manes to name the activities in the data set
4.	Create another independent tidy data and create an output file with data.
