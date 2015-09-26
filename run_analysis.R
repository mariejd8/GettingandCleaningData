##call libraries
library(data.table)
library("dplyr")
#set workign directory to the unzipped (& renamed) downloaded file
setwd("C:/Users/mda/Desktop/DataSci")
##read all data
xtrain <- read.table("UCI_HAR_Dataset/train/X_train.txt")
ytrain <- read.table("UCI_HAR_Dataset/train/Y_train.txt")
subtrain <- read.table("UCI_HAR_Dataset/train/subject_train.txt")
xtest <- read.table("UCI_HAR_Dataset/test/X_test.txt")
ytest <- read.table("UCI_HAR_Dataset/test/Y_test.txt")
subtest <- read.table("UCI_HAR_Dataset/test/subject_test.txt")
features <- read.table("UCI_HAR_Dataset/features.txt", check.names=FALSE)
##Clean up feature names, first replacing '-'s with underscores,
## and then by stripping '()'s.
features2 <- gsub("-", "_", features[,2])
features3 <- gsub("\\()", "", features2)
##Give Xtest and Xtrain column names pulled from features.txt, now features3.
##MIGHT NOT BE NECESSARY
colnames(xtest) <-features3
colnames(xtrain) <-features3
##Attach activity labels and Subject IDs to both test and train sets 
##noting that labels are the first column and subjects are the second column
trainWLabSub <- cbind(ytrain, subtrain, xtrain)
testWLabSub <- cbind(ytest, subtest, xtest)
##Merge test and train sets into long skinny data with rbind
fulldata <-rbind(trainWLabSub, testWLabSub)
##Give everybody a name
colnames(fulldata)<- c("Activity_labels", "Subject_ID", c(features3))
##subset to only Mean and Standard variation variables plus the first two columns (activity labels and subjects).
meanstddata <- fulldata[, grep("mean|std", names(fulldata))]
##Put activities into a vector and use this to 
##decode the first column of activity labels which we will 
##vectorize along with Subject IDs and then cbind back into the full 
##dataset with appropriate column names and stated activities
decodelabels <- c("walking", "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying")
Activities <-decodelabels[fulldata$Activity_labels]
Subject_ID <- fulldata[,2]
meanstdfull <- cbind(Activities, Subject_ID, meanstddata)
##can check sample of data and column names with: meanstdfull[1:5, 1:5]
##check for nas (result none): sum(is.na(meanstdfull))
##use dplyr summarise_each function with piping %>% to convert 
##dataframe to  averages of mean and std grouped by subject and activity. Boom.
meanstdfull %>% group_by(Subject_ID, Activities) %>% summarise_each(funs(mean))
##create txt file of table
write.table(meanstdfull, "tidydata_AvgVars.txt", row.name=FALSE)
##check dims just for funsies
dim(meanstdfull)
##Woo! We're done here.
