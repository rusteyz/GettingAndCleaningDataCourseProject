GettingAndCleaningDataCourseProject
===================================

GettingAndCleaningDataCourseProject

Overall Steps -

1. Concatenate columns from subject_test, y_test, X_Test files into a single data set
2. Extract required columns (mean and std cols) from Data Set # 1 and Label column name correctly
3. Used "Merge" function to merge Data Set from #2 with Activity Data Frame on basis of ActivityID column
4. Concatenate columns from subject_train, y_train, X_Train files into a single data set
5. Extract required columns (mean and std cols) from Data Set # 4 and Label column name correctly
6. Used "Merge" function to merge Data Set from #5 with Activity Data Frame on basis of ActivityID column
7. Combine the two data sets (from #3 and #6) into one
8. Perform the summarization on data set from #7

More Detailed Steps -

# Set/Create the working directory and include data.table library for setnames function execution
# Download and Unzip the zip file specified in course project instructions

## Composite Data Frame creation starts for Test Data after reading Test files
# Activity List data frame creation from activity_labels.txt and column header name setting
# Features List data frame creation from features.txt and column header name setting
# Subject Test data frame creation from subject_test.txt and column header name setting
# Y Test data frame creation from y_test.txt and column header name setting
# X Test data frame creation from X_test.txt
# Column name setting of columns on X Test Data Frame from Features List Data Frame Listing
# Extract only mean and std related columns in X Test Data Frame - Total of 68 columns
# Modify the column name mean(), mean()-, std(), std()- with appropriate string (Mean, Std) in column names
# Concatenate the Test Data Frames into a single Test Data Frame
# Merge Activity List Data Frame with Test Data Frame on the basis of AcitivityID column to form Test DataFrame with Activity Name in each row

## Composite Data Frame creation starts for Train Data after reading Train files

# Subject Train data frame creation from subject_train.txt and column header name setting
# Y Train data frame creation from y_train.txt and column header name setting
# X Train data frame creation from X_train.txt
# Column name setting of columns on X Train Data Frame from Features List Data Frame Listing 
# Extract only mean and std related columns in X Train Data Frame  - Total of 68 columns
# Modify the column name mean(), mean()-, std(), std()- with appropriate string (Mean, Std) in column names
# Concatenate the Train Data Frames into a single Test Data Frame
# Merge Activity List Data Frame with Train Data Frame on the basis of AcitivityID column to form Train DataFrame with Activity Name in each row
# Combine Test and Train Data Frames into a single Composite data frame with all the required data and columns for Test and Train Data 
# Re-arrange the Activity column placement in Final Data Frame to appear next to ActivityID Column
# Run aggregate function to aggregate data based on SubjectID + ActivityID + Activity and display on R Consol
# Write Aggregate function result to a output text file
