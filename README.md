Readme – Getting and Cleaning Data Course Project – February 2015

Introduction

This Readme is for the Course Project for the Getting and Cleaning Data
Coursera course as part of the Data Science series of courses. The
purpose of this project was to collect, work with, and clean the input
data set. The input dataset provided as part of the Course Project
consisted of experiments been carried out with a group of 30 volunteers
within an age bracket of 19-48 years. Each person performed six
activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING,
STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the
waist. Using an embedded accelerometer and gyroscope, 3-axial linear
acceleration and 3-axial angular velocity were captured at a constant
rate of 50Hz. The obtained dataset was randomly partitioned into two
sets, where 70% of the volunteers was selected for generating the
training data and 30% the test data (Anguita, et.al, 2012).

The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows
of 2.56 sec and 50% overlap (128 readings/window). The sensor
acceleration signal, which has gravitational and body motion components,
was separated using a Butterworth low-pass filter into body acceleration
and gravity. The gravitational force is assumed to have only low
frequency components, therefore a filter with 0.3 Hz cutoff frequency
was used. From each window, a vector of features was obtained by
calculating variables from the time and frequency domain (Anguita,
et.al, 2012).

Components of the Project

There are 4 components to this project:

1.	The script run_analysis.R on Github with the script for performing
the analysis and a link to a Github repository. This script starts with
the assumption that the Samsung data is available in the working
directory in an unzipped UCI HAR Dataset folder (Coursera - Hood, 2015).
2.	A codebook on Github (codebook.md) that describes the variables,
the data, and any transformations or work that were performed to clean
up the data 
3.	A README.md (this one) file on Github that describes
the project, the steps and how everything is connected 
4.	A tidy dataset uploaded to Coursera


Code for reading tidy dataset into R

df <- read.table(“tidydataset.txt”, header = TRUE) view(df)

Points to consider

1. Why my output (I decided to go with wide) dataset is tidy 
    a.	Each variable that is measured is in one column. 
    b.	Each different observation of that variable is in a different row

2. Which columns represent measurements on mean and standard deviation
(Coursera - Hood, 2015) Based on my analysis, the 79 variables selected
for my final tidy dataset from the 561 variables represent the correct
subset of measurements of mean and standard deviation. In my opinion,
meanFrequency() also represents a measurement on the mean.

3. Variable Names The first two column names were changed to ‘Subject’
and ‘Activity’. The other 79 variable names were appended the column
names from the features.txt dataset. These names are descriptive and
describe the action being recorded – for eg: tBodyAcc-mean()-X –
describes the ‘Average by subject and activity of mean of body linear
acceleration time domain signal on the X-axis’. The ‘t’ at the beginning
of the variable names indicates this is a time domain signal. The
variable names beginning with an ‘f’ are frequency domain signals.


References

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L.
Reyes-Ortiz. Human Activity Recognition on Smartphones using a
Multiclass Hardware-Friendly Support Vector Machine. International
Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz,
Spain. Dec 2012

Coursera - Hood, David.
https://class.coursera.org/getdata-011/forum/thread?thread_id=69. (2015,
February). Retrieved from
https://class.coursera.org/getdata-011/forum/thread?thread_id=69


