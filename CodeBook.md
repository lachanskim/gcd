#CodeBook

For optimal viewing, please read this file in its raw form. The markdown interpreter by GitHub seems to render it the data dictionary structure below incoherent.

This file CodeBook.md or 'CodeBook' hereafter describes the variables of
the file tidied2.txt output by run_analysis.R which uses the files
in UCI Har Dataset. We follow the advice given in the Coursera Getting and
Cleaning Data Discussion forum thread:
https://class.coursera.org/getdata_006/forum/thread?thread_id=26 and try
to follow as closely as possible the style of the CodeBook given in Quiz 1 
at the following URL: 
https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf


Each row of the tidied2.txt dataset is a subject id-activity pair 
(for a total of 180 rows) and columns 3 through 68 are means of measurements taken 
from the accelerometer of a Samsung Galaxy S II. For details on the creation
of the tidied2.txt dataset please see ReadMe.MD and/or run_analysis.R in the
accompanying repo. tidied2.txt is space delimited and as such, the field widths
are not fixed; therefore, maximum field widths have been used. For example,
if an item takes integer values 1 to 999, its field width is listed as 3. 
If an item takes integer values -999 to 999 its field width is listed as 4 
(because the minus operator occupies a space).

Each Data Dictionary entry has the following format where ItemNo. is an integer 
valued from 1 to 68 for each column of data.frame produced when tidied2.txt is read into R. 

ItemNo. Variable name
*Variable field width
*Variable definition
*Range of values

We closely follow the variable definitions set out in forum thread
"Which  dataset should our code book correspond to?" at the following
URL: https://class.coursera.org/getdata-006/forum/thread?thread_id=120

Because all values in tidied2.txt columns 3 through 68 are means we purposefully omit "Mean of" from the start of 
each of the variable names and variable definitions. This implies, for example, that the variable description of
"Mean of the time domain signal of the body acceleration's standard deviation along the x-axis as measured by the 
accelerometer (in xyz space)" is rendered in THIS DOCUMENT's variable description as simply: "the time domain 
signal of the body acceleration's standard deviation along the x-axis (in xyz space)." Ranges are reported to four non-zero digits unless otherwise specified.

Example:
6. tBodyAccelerometerStdX
* 14
* The time domain signal of the body acceleration's standard deviation along the x-axis as measured by the accelerometer (in xyz space)
* -1 to 1

##Data Dictionary

1.id
* 2
* Each subject's unique identifier
* Integers 1 to 30

2. activity
* 18
* The activity each subject was performing when measurements were taken.
* "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"

3. tBodyAccelerometerMeanX
* 14
* The time domain signal of the body acceleration's mean along the x-axis as measured by the accelerometer (in xyz space)
* 0.2216 to 0.3015

4. tBodyAccelerometerMeanY
* 14
* The time domain signal of the body acceleration's mean along the y-axis as measured by the accelerometer (in xyz space)
* -0.04051 to -0.001308

5. tBodyAccelerometerMeanZ
* 14
* The time domain signal of the body acceleration's mean along the z-axis as measured by the accelerometer (in xyz space)
* -0.1525 to -0.07538

6. tBodyAccelerometerStdX
* 14
* The time domain signal of the body acceleration's standard deviation along the x-axis as measured by the accelerometer (in xyz space)
* -0.9961 to 0.6269

7. tBodyAccelerometerStdY
* 14
* The time domain signal of the body acceleration's standard deviation along the y-axis as measured by the accelerometer (in xyz space)
* -0.9902 to 0.6169
8. tBodyAccelerometerStdZ
* 14
* The time domain signal of the body acceleration's standard deviation along the z-axis as measured by the accelerometer (in xyz space)
* -0.9877 to 0.6090
9. tGravityAccelerometerMeanX
* 14
* The time domain signal of gravity acceleration's mean along the x-axis as measured by the accelerometer (in xyz space)
* -0.6800 to 0.9745
10. tGravityAccelerometerMeanY
* 14
* The time domain signal of gravity acceleration's mean along the y-axis as measured by the accelerometer (in xyz space)
* -0.4799  0.9566
11. tGravityAccelerometerMeanZ
* 14
* The time domain signal of gravity acceleration's mean along the z-axis as measured by the accelerometer (in xyz space)
*  -0.4951 to 0.9579
12. tGravityAccelerometerStdX
* 14
* The time domain signal of the gravity acceleration's standard deviation along the x-axis as measured by the accelerometer (in xyz space)
* -0.9968 to -0.8296
13. tGravityAccelerometerStdY
* 14
* The time domain signal of the gravity acceleration's standard deviation along the y-axis as measured by the accelerometer (in xyz space)
* -0.9942 to -0.6436
14. tGravityAccelerometerStdZ
* 14
* The time domain signal of the gravity acceleration's standard deviation along the y-axis as measured by the accelerometer (in xyz space)
* -0.9910 to -0.6102
15. tBodyAccelerometerJerkMeanX
* 14
* The time domain signal of the body jerk's mean along the x-axis as measured by the accelerometer (in xyz space)
* -0.04269 0.13019
16. tBodyAccelerometerJerkMeanY
* 14
* The time domain signal of the body jerk's mean along the y-axis as measured by the accelerometer (in xyz space)
* -0.03869 to 0.05682
17. tBodyAccelerometerJerkMeanZ
* 14
* The time domain signal of the body jerk's mean along the z-axis as measured by the accelerometer (in xyz space)
* -0.06746 to 0.03805
18. tBodyAccelerometerJerkStdX
* 14
* The time domain signal of the body jerk's standard deviation along the x-axis as measured by the accelerometer (in xyz space)
*  -0.9946 to 0.5443
19. tBodyAccelerometerJerkStdY
* 14
* The time domain signal of the body jerk's standard deviation along the y-axis as measured by the accelerometer (in xyz space)
* -0.9895 to 0.3553
20. tBodyAccelerometerJerkStdZ
* 14
* The time domain signal of the body jerk's standard deviation along the z-axis as measured by the accelerometer (in xyz space)
* -0.9933 to 0.03102
21. tBodyGyroMeanX
* 14
* The time domain signal of the body acceleration's mean along the x-axis as measured by the gyroscope (in xyz space)
* -0.2058 to 0.1927
22. tBodyGyroMeanY
* 14
* The time domain signal of the body acceleration's mean along the y-axis as measured by the gyroscope (in xyz space)
* -0.2042 to 0.02747
23. tBodyGyroMeanZ
* 14
* The time domain signal of the body acceleration's mean along the z-axis as measured by the gyroscope (in xyz space)
* -0.07245 to 0.17910
24. tBodyGyroStdX
* 14
* The time domain signal of the body acceleration's standard deviation along the x-axis as measured by the gyroscope (in xyz space)
* -0.9943 to 0.2677
25. tBodyGyroStdY
* 14
* The time domain signal of the body acceleration's standard deviation along the y-axis as measured by the gyroscope (in xyz space)
* -0.9942 to 0.4765
26. tBodyGyroStdZ
* 14
* The time domain signal of the body acceleration's standard deviation along the z-axis as measured by the gyroscope (in xyz space)
* -0.9855 to 0.5649
27. tBodyGyroJerkMeanX
* 14
* The time domain signal of the body jerk's standard deviation along the x-axis as measured by the gyroscope (in xyz space)
* -0.15721 to -0.02209
28. tBodyGyroJerkMeanY
* 14
* The time domain signal of the body jerk's standard deviation along the y-axis as measured by the gyroscope (in xyz space)
*  -0.07681 to -0.01320
29. tBodyGyroJerkMeanZ
* 14
* The time domain signal of the body jerk's standard deviation along the z-axis as measured by the gyroscope (in xyz space)
* -0.09250 to -0.006941
30. tBodyGyroJerkStdX
* 14
* The time domain signal of the body jerk's standard deviation along the x-axis as measured by the gyroscope (in xyz space)
* -0.9965 to 0.1791
31. tBodyGyroJerkStdY
* 14
* The time domain signal of the body jerk's standard deviation along the y-axis as measured by the gyroscope (in xyz space)
* -0.9971 to 0.2959
32. tBodyGyroJerkStdZ
* 14
* The time domain signal of the body jerk's standard deviation along the z-axis as measured by the gyroscope (in xyz space)
*  -0.9954 to 0.1932
33. tBodyAccelerometerMagMean
* 14
* The  time domain signal of the magnitude of the body acceleration's mean as measured by the accelerometer
* -0.9865 to 0.6446
34. tBodyAccelerometerMagStd
* 14
* The  time domain signal of the magnitude of the body acceleration's standard deviation as measured by the accelerometer
* -0.9865 to 0.4284
35. tGravityAccelerometerMagMean
* 14
* The  time domain signal of the magnitude of gravity's mean as measured by the accelerometer
* -0.9865 to 0.6446
36. tGravityAccelerometerMagStd
* 14
* The time domain signal of the magnitude of gravity's standard deviation as measured by the accelerometer
* -0.9865 to 0.4284
37. tBodyAccelerometerJerkMagMean
* 14
* The time domain signal of the magnitude of the body jerk's mean as measured by the accelerometer
* -0.9928 to 0.4345
38. tBodyAccelerometerJerkMagStd
* 14
* The time domain signal of the magnitude of the body jerk's standard deviation as measured by the accelerometer
* -0.9946 to 0.4506
39. tBodyGyroMagMean
* 14
* The time domain signal of the magnitude of the body acceleration's mean as measured by the gyroscope
* -0.9807 to 0.4180
40. tBodyGyroMagStd
* 14
* The time domain signal of magnitude of the body acceleration's standard deviation as measured by the gyroscope
*  -0.9814 to  0.3000
41. tBodyGyroJerkMagMean
* 14
* The time domain signal of the magnitude of the body jerk's standard deviation as measured by the gyroscrope
* -0.9973 to 0.08758
42. tBodyGyroJerkMagStd
* 14
* The time domain signal of the magnitude of the body jerk's standard deviation along the x-axis as measured by the gyroscope
* -0.9977 to 0.2502
43. fBodyAccelerometerMeanX
* 14
* The fast fourier transform of the body acceleration's mean along the x-axis as measured by the accelerometer (in xyz space)
* -0.9952 to 0.5370
44. fBodyAccelerometerMeanY
* 14
* The fast fourier transform of the body acceleration's mean along the y-axis as measured by the accelerometer (in xyz space)
* -0.9890 to 0.5242
45. fBodyAccelerometerMeanZ
* 14
* The fast fourier transform of the body acceleration's mean along the z-axis as measured by the accelerometer (in xyz space)
* -0.9895 to 0.2807
46. fBodyAccelerometerStdX
* 14
* The fast fourier transform of the body acceleration's standard deviation along the x-axis as measured by the accelerometer (in xyz space)
* -0.9966  0.6585
47. fBodyAccelerometerStdY
* 14
* The fast fourier transform of the body acceleration's standard deviation along the y-axis as measured by the accelerometer (in xyz space)
* -0.9907 to 0.5602
48. fBodyAccelerometerStdZ
* 14
* The fast fourier transform of the body acceleration's standard deviation along the z-axis as measured by the accelerometer (in xyz space)
* -0.9872 to 0.6871
49. fBodyAccelerometerJerkMeanX
* 14
* The fast fourier transform of the body jerk's mean along the x-axis as measured by the accelerometer (in xyz space)
* -0.9946 to 0.4743
50. fBodyAccelerometerJerkMeanY
* 14
* The fast fourier transform of the body jerk's mean along the y-axis as measured by the accelerometer (in xyz space)
* -0.9894 to 0.2767
51. fBodyAccelerometerJerkMeanZ
* 14
* The fast fourier transform of the body jerk's mean along the z-axis as measured by the accelerometer (in xyz space)
* -0.9920 to 0.1578
52. fBodyAccelerometerJerkStdX
* 14
* The fast fourier transform of the body jerk's standard deviation along the x-axis as measured by the accelerometer (in xyz space)
* -0.9951 to 0.4768
53. fBodyAccelerometerJerkStdY
* 14
* The fast fourier transform of the body jerk's standard deviation along the y-axis as measured by the accelerometer (in xyz space)
* -0.9905 to 0.3498
54. fBodyAccelerometerJerkStdZ
* 14
* The fast fourier transform of the body jerk's standard deviation along the z-axis as measured by the accelerometer (in xyz space)
* -0.993108 to -0.006236
55. fBodyGyroMeanX
* 14
* The fast fourier transform of the body acceleration's mean along the x-axis as measured by the gyroscope (in xyz space)
* -0.9931 to 0.4750
56. fBodyGyroMeanY
* 14
* The fast fourier transform of the body acceleration's mean along the y-axis as measured by the gyroscope (in xyz space)
* -0.9940 to 0.3288
57. fBodyGyroMeanZ
* 14
* The fast fourier transform of the body acceleration's mean along the z-axis as measured by the gyroscope (in xyz space)
* -0.9860 to 0.4924
58. fBodyGyroStdX
* 14
* The fast fourier transform of the body acceleration's standard deviation along the x-axis as measured by the gyroscope (in xyz space)
* -0.9947 to 0.1966
59. fBodyGyroStdY
* 14
* The fast fourier transform of the body acceleration's standard deviation along the y-axis as measured by the gyroscope (in xyz space)
* -0.9944 to 0.6462
60. fBodyGyroStdZ
* 14
* The fast fourier transform of the body acceleration's standard deviation along the z-axis as measured by the gyroscope (in xyz space)
* -0.9867 to 0.5225
61. fBodyAccelerometerMagMean
* 14
* The fast fourier transform of the magnitude of the body acceleration's standard deviation as measured by the accelerometer
* -0.9868 to 0.5866
62. fBodyAccelerometerMagStd
* 14
* The fast fourier transform of the magnitude of the body acceleration's standard deviation as measured by the accelerometer
* -0.9876 to 0.1787
63. fBodyBodyAccelerometerJerkMagMean
* 14
* The fast fourier transform of the magnitude of the body jerk's means as measured by the accelerometer
* -0.9940 to 0.5384
64. fBodyBodyAccelerometerJerkMagStd
* 14
* The fast fourier transform of the magnitude of the body jerk's standard deviation as measured by the accelerometer
* -0.9944 to 0.3163
65. fBodyBodyGyroMagMean
* 14
* The fast fourier transform of the magnitude of the body acceleration's standard deviation as measured by the gyroscope
* -0.9865 to 0.2040
66. fBodyBodyGyroMagStd
* 14
* The fast fourier transform of the magnitude of the body acceleration's standard deviation as measured by the gyroscope
* -0.9815 to 0.2367
67. fBodyBodyGyroJerkMagMean
* 14
* The fast fourier transform of the magnitude of the body acceleration's mean  as measured by the gyroscope
* -0.9976 to 0.1466
68. fBodyBodyGyroJerkMagStd
* 14
* The fast fourier transform of the magnitude of the body acceleration's standard deviation as measured by the gyroscope
* -0.9976 to  0.2878
