# Set the working directory and include data.table library for setnames function execution
getwd()
if (!file.exists("./GettingAndCleaningDataCourseProject")) {dir.create("./GettingAndCleaningDataCourseProject")}
setwd("./GettingAndCleaningDataCourseProject")
getwd()

## include data.table library for calling setnames function
library(data.table)

# Download and Unzip the zip file specified in course project instructions
download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="UCI HAR Dataset.zip",method="curl", mode="wb")
unzip("UCI HAR Dataset.zip")

## Composite Data Frame creation starts for Test Data after reading Test files
# Activity List data frame creation from activity_labels.txt and column header name setting
activityListDF        <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activityListDF) <- c("ActivityID","Activity")

# Features List data frame creation from features.txt and column header name setting
featuresDF        <- read.table("UCI HAR Dataset/features.txt")
names(featuresDF) <- c("featureID","featureName")

# Subject Test data frame creation from subject_test.txt and column header name setting
subjectTestDF         <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(subjectTestDF)  <- c("SubjectID")

# Y Test data frame creation from y_test.txt and column header name setting
yTestDF          <- read.table("UCI HAR Dataset/test/y_test.txt")
names(yTestDF)   <- c("ActivityID")

# X Test data frame creation from X_test.txt
XTestDF          <- read.table("UCI HAR Dataset/test/X_test.txt")

# Column name setting of columns on X Test Data Frame from Features List Data Frame Listing
setnames(XTestDF,old=names(XTestDF),new=as.character(featuresDF[,"featureName"]))

# Extract only mean and std related columns in X Test Data Frame
XTestDF          <- XTestDF[,grepl('mean\\(\\)|std\\(\\)',featuresDF[,"featureName"])]

# Modify the column name mean(), mean()-, std(), std()- with appropriate string (Mean, Std) in column names
names(XTestDF)   <- gsub("-std\\(\\)-|-std\\(\\)","Std",names(XTestDF))
names(XTestDF)   <- gsub("-mean\\(\\)-|-mean\\(\\)","Mean",names(XTestDF))

# Concatenate the Test Data Frames into a single Test Data Frame
testDF           <- data.frame(subjectTestDF,yTestDF,XTestDF)

# Merge Activity List Data Frame with Test Data Frame on the basis of AcitivityID column to form Test DataFrame with Activity Name in each row
testDF2          <- merge(testDF,activityListDF,all=TRUE,by="ActivityID")


## Composite Data Frame creation starts for Train Data after reading Train files

# Subject Train data frame creation from subject_train.txt and column header name setting
subjectTrainDF        <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(subjectTrainDF) <- c("SubjectID")

# Y Train data frame creation from y_train.txt and column header name setting
yTrainDF        <- read.table("UCI HAR Dataset/train/y_train.txt")
names(yTrainDF) <- c("ActivityID")

# X Train data frame creation from X_train.txt
XTrainDF        <- read.table("UCI HAR Dataset/train/X_train.txt")

# Column name setting of columns on X Train Data Frame from Features List Data Frame Listing
setnames(XTrainDF,old=names(XTrainDF),new=as.character(featuresDF[,"featureName"]))

# Extract only mean and std related columns in X Train Data Frame
XTrainDF         <- XTrainDF[,grepl('mean\\(\\)|std\\(\\)',featuresDF[,"featureName"])]

# Modify the column name mean(), mean()-, std(), std()- with appropriate string (Mean, Std) in column names
names(XTrainDF)  <- gsub("-std\\(\\)-|-std\\(\\)","Std",names(XTrainDF))
names(XTrainDF)  <- gsub("-mean\\(\\)-|-mean\\(\\)","Mean",names(XTrainDF))

# Concatenate the Train Data Frames into a single Test Data Frame
trainDF          <- data.frame(subjectTrainDF, yTrainDF, XTrainDF)

# Merge Activity List Data Frame with Train Data Frame on the basis of AcitivityID column to form Train DataFrame with Activity Name in each row
trainDF2         <- merge(trainDF,activityListDF,all=TRUE,by="ActivityID")

# Combine Test and Train Data Frames into a single Composite data frame with all the required data and columns for Test and Train Data 
finalDF          <- rbind(testDF2,trainDF2)

# Re-arrange the Activity column placement in Final Data Frame to appear next to ActivityID Column
finalDF          <- finalDF[,c(2:1,ncol(finalDF),3:(ncol(finalDF) -1))]

# Run aggregate function to aggregate data based on SubjectID + ActivityID + Activity and display on R Consol
aggregate(. ~ SubjectID+ActivityID+Activity,data = finalDF,FUN=mean)

# Write Aggregate function result to a output text file
write.table(aggregate(. ~ SubjectID+ActivityID+Activity,data = finalDF,FUN=mean),file = "./AggrFinalDF-TinyData.txt", append = FALSE, quote = TRUE, sep = " ",
eol = "\n", na = "NA", dec = ".", row.names = FALSE,
col.names = TRUE, qmethod = c("escape", "double"), fileEncoding = "")

