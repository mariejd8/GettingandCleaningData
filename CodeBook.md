CODE BOOK

The run_analysis.R script, and the data set it produces are pulled from the UCI Machine
Learning Repository which can be found and downloaded here: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

From this, the associated R code then combines the data found in the X_test and X_train 
files. These files are two groups of subjects, one group that performed the activities 
as a training group and the other group which performed the activites for the 
actual experimentation. This code combines the training and test data into one full set.

Subject- There are 30 subjects that performed the activities- 70% of them generated 
the training data, the other 30% generated the test data. They are ID'ed with 
numbers 1-30. The code reattaches each Subject ID found in the subject_train 
and subject_test files to the data they produced. 
---------SubjectIDs: 
1:30

Activities- Each subject performed 6 activities (WALKING, WALKING_UPSTAIRS, 
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone 
(Samsung Galaxy S II) on the waist. These activities are coded with numbers 1 through 6.
The code reattaches the activities to the data produced and then decodes them, so 
that the data includes the stated activity. This can also be found in 
the activity_labels.txt file.
----------Activity Codes:
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

Measurement Variables/Features- When the subjects performed the activities, the 
measurements recorded by the phone were used to produce 561 measurement variables. 
These are found in the features.txt file, and are explained further in the 
features_info.text file. The code pulls them from the features.txt file to use as 
appropriate column names for the data in the X_train and X_text files. The code then 
removes all variables except for those which take the mean and standard deviations of the
various measurements, and takes the average of these for each subject and each activity.
The resultant data is the mean for the following variables:
--------------Measurement Variables/Features (averaged):
"tBodyAcc_mean_X"              
"tBodyAcc_mean_Y"               
"tBodyAcc_mean_Z"               
"tBodyAcc_std_X"               
"tBodyAcc_std_Y"                
"tBodyAcc_std_Z"                
"tGravityAcc_mean_X"           
"tGravityAcc_mean_Y"            
"tGravityAcc_mean_Z"            
"tGravityAcc_std_X"            
"tGravityAcc_std_Y"             
"tGravityAcc_std_Z"             
"tBodyAccJerk_mean_X"          
"tBodyAccJerk_mean_Y"           
"tBodyAccJerk_mean_Z"           
"tBodyAccJerk_std_X"           
"tBodyAccJerk_std_Y"            
"tBodyAccJerk_std_Z"            
"tBodyGyro_mean_X"             
"tBodyGyro_mean_Y"              
"tBodyGyro_mean_Z"              
"tBodyGyro_std_X"              
"tBodyGyro_std_Y"               
"tBodyGyro_std_Z"               
"tBodyGyroJerk_mean_X"         
"tBodyGyroJerk_mean_Y"          
"tBodyGyroJerk_mean_Z"          
"tBodyGyroJerk_std_X"          
"tBodyGyroJerk_std_Y"           
"tBodyGyroJerk_std_Z"           
"tBodyAccMag_mean"             
"tBodyAccMag_std"               
"tGravityAccMag_mean"           
"tGravityAccMag_std"           
"tBodyAccJerkMag_mean"          
"tBodyAccJerkMag_std"           
"tBodyGyroMag_mean"            
"tBodyGyroMag_std"              
"tBodyGyroJerkMag_mean"         
"tBodyGyroJerkMag_std"         
"fBodyAcc_mean_X"               
"fBodyAcc_mean_Y"               
"fBodyAcc_mean_Z"              
"fBodyAcc_std_X"                
"fBodyAcc_std_Y"                
"fBodyAcc_std_Z"               
"fBodyAcc_meanFreq_X"           
"fBodyAcc_meanFreq_Y"           
"fBodyAcc_meanFreq_Z"          
"fBodyAccJerk_mean_X"           
"fBodyAccJerk_mean_Y"           
"fBodyAccJerk_mean_Z"          
"fBodyAccJerk_std_X"            
"fBodyAccJerk_std_Y"            
"fBodyAccJerk_std_Z"           
"fBodyAccJerk_meanFreq_X"       
"fBodyAccJerk_meanFreq_Y"       
"fBodyAccJerk_meanFreq_Z"      
"fBodyGyro_mean_X"              
"fBodyGyro_mean_Y"              
"fBodyGyro_mean_Z"             
"fBodyGyro_std_X"               
"fBodyGyro_std_Y"               
"fBodyGyro_std_Z"              
"fBodyGyro_meanFreq_X"          
"fBodyGyro_meanFreq_Y"          
"fBodyGyro_meanFreq_Z"         
"fBodyAccMag_mean"              
"fBodyAccMag_std"               
"fBodyAccMag_meanFreq"         
"fBodyBodyAccJerkMag_mean"      
"fBodyBodyAccJerkMag_std"       
"fBodyBodyAccJerkMag_meanFreq" 
"fBodyBodyGyroMag_mean"         
"fBodyBodyGyroMag_std"          
"fBodyBodyGyroMag_meanFreq"    
"fBodyBodyGyroJerkMag_mean"     
"fBodyBodyGyroJerkMag_std"      
"fBodyBodyGyroJerkMag_meanFreq"

