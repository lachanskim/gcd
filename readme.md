#run_analysis.R Readme
#Version 0.1

##Michael Lachanski
##Princeton University
##mlachans@princeton.edu

Wherever possible, this README.md follows the structure and wording of the README.txt file
contained in the "UCI Har Dataset" folder.
run_analysis.R (hereafter referred to as "the script") takes in the experimental data 
collected from 30 subjects' Samsung Galaxy S smartphone accelerometers.
The experiments have been carried out with a group of 30 volunteers within an age 
bracket of 19-48 years. Each person performed six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded 
accelerometer and gyroscope, the data captures 3-axial linear acceleration and 3-axial angular 
velocity at a constant rate of 50Hz. The experiments were video-recorded to 
label the data manually. The obtained dataset was randomly partitioned into two 
sets, where 70% of the volunteers was selected for generating the training data and 30% for 
the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise 
filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap 
(128 readings/window). The sensor acceleration signal, which has gravitational and body 
motion components, was separated using a Butterworth low-pass filter into body acceleration 
and gravity. The gravitational force is assumed to have only low frequency components, therefore 
a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was 
obtained by calculating variables from the time and frequency domain. The script takes in 
the aforementioned 561 variable dataset and ouputs a second, independent "tidy" dataset tidied2.txt
with the average of each variable (where variables are all means and standard deviations for various directions 
and instruments in the smartphone) for each activity and each subject. 
This is a total of 180 subject id, activity pairs and 66 means of means and means of standard deviations. For further
details about each variable, please see the CodeBook.md file included in this repo.

The script makes use of the "dplyr" package and dplyr must be installed prior to running the script.
I recommend using install.packages("dplyr") to obtain dplyr if you have not already obtained it.
It is assumed that the UCI Har Dataset folder containing the training and test data is in the
same directory as the script and that the file structure has not been altered from original form. 
This script follows the order specifiedin the Getting and Cleaning Data Peer Reviewed Assessment and this Readme
is organized along the same principles. That is, after discussing the directory contents of
this GitHub repo, it is divided into five sections. This gives us the following table of contents:

### Repo Contents
### 1. Merging the Training and Test Sets to Create One Data Set
### 2. Extract Only the Measurements on the Mean and Standard Deviation for Each Measurement
### 3. Uses Descriptive Activity Names to Name the Activities of the Data Set
### 4. Appropriately Labels the Data Set with Descriptive Activity Names
### 5. Creates a Second, Independent Tidy Data Set with the Average of Each Variable for Each Activity and Each Subject

###Repo Contents

This GitHub repo includes the following files:

*'README.md'
*'CodeBook.md': Contains the CodeBook for describing the variables in 'tidied2.txt'
*'run_analysis.R': the aforementioned script

All of the relevant data is read into R prior to the initiation of any of the
proceding steps which are described in detail below.

### 1. Merging the Training and Test Sets to Create One Data Set.

For this step, we first combined the training subject (subject_train.txt), activity
(y_train.txt) and Samsung accelerometer (X_train.txt) datasetse with cbind to make 
a 7352 x 563 size dataframe. We do the same with the test data (subject_test.txt, y_test.txt
and X_test.txt respectively) to make a 2947 x 563 size dataframe and then clip the two
datasets together with rbind.


### 2. Extract Only the Measurements on the Mean and Standard Deviation for Each Measurement.

I have decided that only the columns with the regular expressions
mean() and std() are mean and standard deviation measurements; this follows the
forum advice: https://class.coursera.org/getdata-006/forum/thread?thread_id=43 .
This is a reasonable choice because it follows the features_info.txt provided
with the data and guarantees an equal number of means and standard deviations.
The relevant columns were input into the run_analysis.R file by hand. Our reduced dataframe
has the following column names: "id","activity","V1","V2","V3","V4","V5","V6","V41",
"V42","V43","V44","V45","V46","V81","V82","V83","V84","V85","V86","V121","V122","V123",
"V124","V125","V126","V161","V162","V163","V164","V165","V166","V201","V202","V214",
"V215","V227","V228","V240","V241","V253","V254","V266","V267","V268","V269","V270",
"V271","V345","V346","V347","V348","V349","V350","V424","V425","V426","V427","V428","V429",
"V503","V504","V516", "V517","V529","V530","V542", and "V543".

We use "id" as an abreviation for "subject id". 

### 3. Uses Descriptive Activity Names to Name the Activities of the Data Set.

For this task we used dplyr's mutate function to relabel each activity according 
to the rubric set out in the activity_labels.txt file included in the UCI Har Dataset
folder. The conditional mutating syntax follows the approach outlined here:
http://stackoverflow.com/questions/22337394/dplyr-how-to-combine-mutate-with-conditional-values

### 4. Appropriately Labels the Data Set with Descriptive Activity Names.

For this task we follow the convention set in Week 4 Lecture Editing Text Variables. 
Therefore, all variable names are lower case when possible, descriptive and have no under
scores, dots, or white spaces. Due to the length of variable names I have used
camel case to make them more readable as per Community TA David Hood's advice in the discussion forum.
I have also retained the appreviation Std and Gyro instead of StandardDeviation and GyroScope, again
because of the length of the variable names. The relabeling was done by hand using the nomenclature
set out in the features.txt file included in the UCI Har Dataset folder.

We also follow the advice given in https://class.coursera.org/getdata-006/forum/thread?thread_id=106
and output the "tidy" dataset from this process to the file tidied1.txt using the write.table
method with row.names set to FALSE; the working directory is changed with the setwd method
so that output is into the working directory containing the UCI Har Dataset folder.

### 5. Create a Second, Independent Tidy Dataset with the Average of Each Variable for each Activity and each Subject.

I interpret this using the advice of CommunityTA Wendel Hope that we should end with 180 rows = 30 ids x 6 activities
For more details, see the following thread: https://class.coursera.org/getdata-006/forum/thread?thread_id=196
I use the method and syntax of the dplyr package as described in the following URL: 
http://stackoverflow.com/questions/21295936/can-dplyr-summarise-over-several-variables-without-listing-each-one
I use the group_by option to group the data frame by id and activity and take the sum over all columns.

I output the second "tidied" dataset to the file tidied2.txt using the write.table method with row.names set to FALSE.
