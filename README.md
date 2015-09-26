README

In this repo for the Getting and Cleaning Data Course Project, you will find a 
##  a run_analysis R script
##  this README markdown document that explains all the associated files 
and explains how the R code works
##  a Codebook markdown document that acts as a data dictionary. 
##  and a tidy data text file that gives the averages of each variable 
(the Mean and standard deviation variables from the original data) grouped by 
subject ID and the activities each subject performed

The code in run_analysis.R does the following, and 
is similarly described within the code using #'s:

Set Up------------------------------
call the data.table and dplyr libraries
Set working directory to the unzipped (& renamed) downloaded file

Read data---------------------------- 
Read all data into R using read.table

Clean up-----------------------------
1. Clean up feature names to R compatible variable names 
(replace unacceptable characters with underscores)
2. Then apply the vector of feature names to be the column names for the test and
train data (xtest) & (xtrain)
3. Attach activity labels and Subject IDs using cbind to both test and train sets, noting 
that activity labels are the first column and subjects are the second 
column for both test and train
4. Now that both the test and train sets have their activity labels and subject IDs 
attached, we merge test and train sets into long skinny data with rbind
5. The first two columns still need appropriate names, so we can rename everything 
with colnames

Subset to Mean and Standard Deviation variables ----------------------------
Subset to only Mean and Standard Deviation variables using grep
(which then loses the Activities and Subject Id, but we will bring them back momentarily)

Decode Activity labels-----------------------------------
Put activities into a vector and use this vector to decode the 
first column of activity labels so that the activities that were performed are now stated

Add Subject IDs and Activities back into full data-----------------------------------
Now add the Vector of decoded activities and the vector of Subject IDs back into
the dataset with appropriate column names, again using cbind

DPLYR to get averages for all variables------------------------------------
Here we simply use the dplyr's summarise_each function with piping (%>%) to convert 
the dataframe to averages of mean and std grouped by subject and activity

Write table------------------------------------
Lastly, we write the new table to a txt file using write.table