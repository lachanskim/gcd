#run_analysis.R takes in the raw data collected from subjects' Samsung Galaxy S
#smartphone accelerometers and ouputs a second, independent "tidy" dataset with
#the average of each variable for each activity and each subject
#get package dplyr

library("dplyr")

#set working directory and read in training files; we ignore the inertial folder
setwd("./UCI Har Dataset/train")
subject_train = read.table("subject_train.txt")
X_train = read.table("X_train.txt")
y_train = read.table("y_train.txt")
#set working directory and read in test files; we ignore the inertial folder
setwd("..")
setwd("./test")
subject_test = read.table("subject_test.txt")
X_test = read.table("X_test.txt")
y_test = read.table("y_test.txt")

#1. merge the training and test sets to create one data set: we first combine
#the subject, activity and X_train sets: our 1st column is subject, 2nd column
#is activity and 3rd is the normalized feature vector

subject.y.train = cbind(subject_train,y_train)
head(subject.y.train)
train = cbind(subject.y.train, X_train)

#do the same for the train data

subject.y.test = cbind(subject_test,y_test)
head(subject.y.test)
test = cbind(subject.y.test, X_test)

train.test = rbind(train, test)

#2. extract only the measurements on the mean and stdev for each measurement
#measurement; I have decided that only the columns with the regular expressions
#mean() and std() are mean and standard deviation measurements; this follows the
#forum advice: https://class.coursera.org/getdata-006/forum/thread?thread_id=43
#This is a reasonable choice because it follows the features_info.txt provided
#with the data and guarantees an equal number of means and standard devs

names(train.test)[1:2] = c("id","activity")

#we hand-selected all columns matching the regular expression mean() or std()
dataset = train.test[,c("id","activity","V1","V2","V3","V4","V5","V6","V41",
        "V42","V43","V44","V45","V46","V81","V82","V83","V84","V85","V86",
        "V121","V122","V123","V124","V125","V126","V161","V162","V163","V164",
        "V165","V166","V201","V202","V214","V215","V227","V228","V240","V241",
        "V253","V254","V266","V267","V268","V269","V270","V271","V345","V346",
        "V347","V348","V349","V350","V424","V425","V426","V427","V428","V429",
        "V503","V504","V516", "V517", "V529","V530","V542","V543")]

#3. Uses descriptive activity names to name the activities in the data set; we 
#use the mutate function as described in "dplyr"to relabel each activity. see
#stackoverflow.com/questions/22337394/ for an analogous use-case

dataset.desc = dataset %.% mutate(activity = ifelse(activity == 1, "WALKING", 
        ifelse(activity == 2, "WALKING_UPSTAIRS", ifelse(activity == 3, 
        "WALKING_DOWNSTAIRS", ifelse(activity == 4, "SITTING", 
        ifelse(activity == 5, "STANDING","LAYING"))))))

#4. Appropriately labels the data set with descriptive variable names; here we
#follow the convention set in Week 4 Lecture editing text variables. Therefore,
#all variable names are lower case when possible, descriptive and have no under
#scores, dots, or white spaces. Due to the length of variable names I have used
#camel case to make them more readable as per Community TA David Hood's advice.
#I have also retained the abreviation std instead of standard deviation, again
#because of the length of the variable names.

dvn = c("id","activity", "tBodyAccelerometerMeanX","tBodyAccelerometerMeanY",
       "tBodyAccelerometerMeanZ","tBodyAccelerometerStdX","tBodyAccelerometerStdY",
        "tBodyAccelerometerStdZ","tGravityAccelerometerMeanX",
       "tGravityAccelerometerMeanY","tGravityAccelerometerMeanZ",
       "tGravityAccelerometerStdX","tGravityAccelerometerStdY",
       "tGravityAccelerometerStdZ","tBodyAccelerometerJerkMeanX",
       "tBodyAccelerometerJerkMeanY","tBodyAccelerometerJerkMeanZ",
       "tBodyAccelerometerJerkStdX","tBodyAccelerometerJerkStdY",
       "tBodyAccelerometerJerkStdZ","tBodyGyroMeanX","tBodyGyroMeanY",
       "tBodyGyroMeanZ","tBodyGyroStdX","tBodyGyroStdY","tBodyGyroStdZ",
       "tBodyGyroJerkMeanX","tBodyGyroJerkMeanY","tBodyGyroJerkMeanZ",
       "tBodyGyroJerkStdX", "tBodyGyroJerkStdY", "tBodyGyroJerkStdZ",
       "tBodyAccelerometerMagMean","tBodyAccelerometerMagStd",
       "tGravityAccelerometerMagMean","tGravityAccelerometerMagStd",
       "tBodyAccelerometerJerkMagMean","tBodyAccelerometerJerkMagStd",
       "tBodyGyroMagMean", "tBodyGyroMagStd", "tBodyGyroJerkMagMean",
       "tBodyGyroJerkMagStd","fBodyAccelerometerMeanX", "fBodyAccelerometerMeanY",
       "fBodyAccelerometerMeanZ","fBodyAccelerometerStdX","fBodyAccelerometerStdY",
       "fBodyAccelerometerStdZ", "fBodyAccelerometerJerkMeanX",
       "fBodyAccelerometerJerkMeanY","fBodyAccelerometerJerkMeanZ",
       "fBodyAccelerometerJerkStdX","fBodyAccelerometerJerkStdY",
       "fBodyAccelerometerJerkStdZ","fBodyGyroMeanX","fBodyGyroMeanY",
       "fBodyGyroMeanZ","fBodyGyroStdX","fBodyGyroStdY","fBodyGyroStdZ",
       "fBodyAccelerometerMagMean","fBodyAccelerometerMagStd",
       "fBodyBodyAccelerometerJerkMagMean","fBodyBodyAccelerometerJerkMagStd",
       "fBodyBodyGyroMagMean","fBodyBodyGyroMagStd","fBodyBodyGyroJerkMagMean",
       "fBodyBodyGyroJerkMagStd"
       )

#assign descriptive variable names
names(dataset.desc) = dvn
setwd(".."); setwd("..")
write.table(dataset.desc, "tidied1.txt",row.names=FALSE)
#5. Create a second, independent tidy dataset with the average of each variable
#for each activity and each subject; I interpret this using the advice of
#CommunityTA Wendel Hope that we should end with 180 rows:30 ids x 6 activities
#For more details, see the following thread: 
#https://class.coursera.org/getdata-006/forum/thread?thread_id=196
options(digits = 4)
tidied = dataset.desc %>% group_by(id,activity) %>% summarise_each(funs(mean))
write.table(tidied, "tidied2.txt",row.names=FALSE)