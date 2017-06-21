## Code Book for "Average of Measures.txt" ##

The file "Averages of Measures.txt" contains the averages by subject and activity of the means and standard deviations of 33 different measures from the University of California Irvine's "Human Activity Recognition Using Smartphones Data Set".

There are were 30 subjects (individuals) in the original study. UCI split data from these subjects into a training data set (21 subjects) and a testing data set (9 subjects). The data set "Averages of Measures.txt" contains information on all 30 subjects (data was pulled from both the training and testing data sets). Measurement were taken on each of these subjects while performing 6 different activities and our data set contains the averages of the means and standard deviations of the measurements for each subject for each activity. Thus our data set contains 30 * 6 = 180 observations, with one row for each observation.

The first two columns of the data set ("subject.id" and "activity") correspond to the subject ID number (integer) and the type of activity (character string). The following 66 columns contain double precision floats with the average of the mean or standard deviation of the indicated measurement:

1. "subject.id": Integer indicating subject               
2. "activity": String describing type of activity                 
3. "tBodyAcc.mean.X": Average of mean body acceleration signal in X plane        
4. "tBodyAcc.mean.Y": Average of mean body acceleration signal in Y plane           
5. "tBodyAcc.mean.Z": Average of mean body acceleration signal in Z plane           
6. "tBodyAcc.std.X": Average of standard deviation body acceleration signal in X plane            
7. "tBodyAcc.std.Y": Average of standard deviation body acceleration signal in Y plane            
8. "tBodyAcc.std.Z": Average of standard deviation body acceleration signal in Z plane            
9. "tGravityAcc.mean.X": Average of mean gravity acceleration signal in X plane       
10. "tGravityAcc.mean.Y": Average of mean gravity acceleration signal in Y plane       
11. "tGravityAcc.mean.Z": Average of mean gravity acceleration signal in Z plane       
12. "tGravityAcc.std.X": Average of standard deviation gravity acceleration signal in X plane        
13. "tGravityAcc.std.Y": Average of standard deviation gravity acceleration signal in Y plane        
14. "tGravityAcc.std.Z": Average of standard deviation gravity acceleration signal in Z plane        
15. "tBodyAccJerk.mean.X": Average of mean body linear acceleration Jerk signal in X plane     
16. "tBodyAccJerk.mean.Y": Average of mean body linear acceleration Jerk signal in Y plane      
17. "tBodyAccJerk.mean.Z": Average of mean body linear acceleration Jerk signal in Z plane      
18. "tBodyAccJerk.std.X": Average of standard deviation of body linear acceleration Jerk signal in X plane       
19. "tBodyAccJerk.std.Y": Average of standard deviation of body linear acceleration Jerk signal in Y plane        
20. "tBodyAccJerk.std.Z": Average of standard deviation of body linear acceleration Jerk signal in Z plane        
21. "tBodyGyro.mean.X": Average of mean body angular velocity signal in X plane         
22. "tBodyGyro.mean.Y": Average of mean body angular velocity signal in Y plane         
23. "tBodyGyro.mean.Z": Average of mean body angular velocity signal in Z plane         
24. "tBodyGyro.std.X": Average of standard deviation body angular velocity signal in X plane          
25. "tBodyGyro.std.Y": Average of standard deviation body angular velocity signal in Y plane          
26. "tBodyGyro.std.Z": Average of standard deviation body angular velocity signal in Z plane          
27. "tBodyGyroJerk.mean.X": Average of mean body angular velocity Jerk signal in X plane      
28. "tBodyGyroJerk.mean.Y": Average of mean body angular velocity Jerk signal in Y plane     
29. "tBodyGyroJerk.mean.Z": Average of mean body angular velocity Jerk signal in Z plane     
30. "tBodyGyroJerk.std.X": Average of standard deviation body angular velocity Jerk signal in X plane      
31. "tBodyGyroJerk.std.Y": Average of standard deviation body angular velocity Jerk signal in Y plane      
32. "tBodyGyroJerk.std.Z": Average of standard deviation body angular velocity Jerk signal in Z plane      
33. "tBodyAccMag.mean": Average of mean magnitude of three dimensional body linear acceleration signal         
34. "tBodyAccMag.std": Average of standard deviation of magnitude of three dimensional body linear acceleration signal           
35. "tGravityAccMag.mean": Average of mean magnitude of three dimensional gravity linear acceleration signal       
36. "tGravityAccMag.std": Average of standard deviation of magnitude of three dimensional gravity linear acceleration signal       
37. "tBodyAccJerkMag.mean": Average of mean magnitude of three dimensional body linear acceleration Jerk signal     
38. "tBodyAccJerkMag.std": Average of standard deviation of magnitude of three dimensional body linear acceleration Jerk signal        
39. "tBodyGyroMag.mean": Average of mean magnitude of three dimensional body angular velocity signal        
40. "tBodyGyroMag.std": Average of standard deviation of magnitude of three dimensional body angular velocity signal          
41. "tBodyGyroJerkMag.mean": Average of mean magnitude of three dimensional body angular velocity Jerk signal     
42. "tBodyGyroJerkMag.std": Average of standard deviation of magnitude of three dimensional body angular velocity Jerk signal     
43. "fBodyAcc.mean.X": Average of Fast Fourier Transform (FFT) of mean body acceleration signal in X plane         
44. "fBodyAcc.mean.Y": Average of FFT of mean body acceleration signal in Y plane         
45. "fBodyAcc.mean.Z": Average of FFT of mean body acceleration signal in Z plane         
46. "fBodyAcc.std.X": Average of FFT of standard deviation body angular velocity signal in X plane          
47. "fBodyAcc.std.Y": Average of FFT of standard deviation body angular velocity signal in Y plane          
48. "fBodyAcc.std.Z": Average of FFT of standard deviation body angular velocity signal in Z plane          
49. "fBodyAccJerk.mean.X": Average of FFT of mean body linear acceleration Jerk signal in X plane     
50. "fBodyAccJerk.mean.Y": Average of FFT of mean body linear acceleration Jerk signal in Y plane     
51. "fBodyAccJerk.mean.Z": Average of FFT of mean body linear acceleration Jerk signal in Z plane     
52. "fBodyAccJerk.std.X": Average of FFT of standard deviation body angular velocity Jerk signal in X plane      
53. "fBodyAccJerk.std.Y": Average of FFT of standard deviation body angular velocity Jerk signal in Y plane      
54. "fBodyAccJerk.std.Z": Average of FFT of standard deviation body angular velocity Jerk signal in Z plane      
55. "fBodyGyro.mean.X": Average of FFT of mean body angular velocity signal in X plane        
56. "fBodyGyro.mean.Y": Average of FFT of mean body angular velocity signal in Y plan        
57. "fBodyGyro.mean.Z": Average of FFT of mean body angular velocity signal in Z plan        
58. "fBodyGyro.std.X": Average of FFT of standard deviation of body angular velocity signal in X plan        
59. "fBodyGyro.std.Y": Average of FFT of standard deviation of body angular velocity signal in Y plan          
60. "fBodyGyro.std.Z": Average of FFT of standard deviation of body angular velocity signal in Z plan          
61. "fBodyAccMag.mean": Average of FFT of mean magnitude of three dimensional body linear acceleration signal        
62. "fBodyAccMag.std": Average of FFT of standard deviation of magnitude of three dimensional body linear acceleration signal         
63. "fBodyAccJerkMag.mean": Average of FFT of mean magnitude of three dimensional body linear acceleration Jerk signal
64. "fBodyAccJerkMag.std": Average of FFT of standard deviation of magnitude of three dimensional body linear acceleration Jerk signal  
65. "fBodyGyroMag.mean": Average of FFT of mean magnitude of three dimensional body angular velocity signal   
66. "fBodyGyroMag.std": Average of FFT of standard deviation of magnitude of three dimensional body angular velocity signal    
67. "fBodyGyroJerkMag.mean": Average of FFT of mean magnitude of three dimensional body angular velocity Jerk signal 
68. "fBodyGyroJerkMag.std": Average of FFT of standard deviation of magnitude of three dimensional body angular velocity Jerk signal

More information on the measurements, original data sets, and original study can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).