============================================
This is a README file 
============================================
Project Title: Getting and Cleaning Data 
Purpose:  To collect, work with, clean a dataset.
Outcomes of this project: 
   - tidy data set as per specified criteria.
   - a link to a Github repository with scripts for performing the analysis. (run_analysis.R)
   - a code book (CodeBook.md).
   - this README.md file.
Background of data set :
Companies like FitBike, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.
The data linked to are collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for the project is available at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity 
at a constant rate of 50Hz were captured. The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected
for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters 
and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth 
low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency 
components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained 
by calculating variables from the time and frequency domain.


Project creates one R script called run_analysis.R that does the following:
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set.
  4. Appropriately labels the data set with descriptive variable names.
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Project also creates one R script called GenerateCodeBook.R that generates a CodeBook.md. CodeBook.md describes the variables, the data, and 
transformations work done to clean up the data.
=================================================================================================================================================