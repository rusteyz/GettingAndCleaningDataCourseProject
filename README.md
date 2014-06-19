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

a. Set/Create the working directory and include data.table library for setnames function execution
b. Download and Unzip the zip file specified in course project instructions


<< Composite Data Frame creation starts for Test Data after reading Test files >>

c. Activity List data frame creation from activity_labels.txt and column header name setting
d.  Features List data frame creation from features.txt and column header name setting
e.  Subject Test data frame creation from subject_test.txt and column header name setting
f.  Y Test data frame creation from y_test.txt and column header name setting
g.  X Test data frame creation from X_test.txt
h.  Column name setting of columns on X Test Data Frame from Features List Data Frame Listing
i.  Extract only mean and std related columns in X Test Data Frame - Total of 68 columns
j.  Modify the column name mean(), mean()-, std(), std()- with appropriate string (Mean, Std) in column names
k.  Concatenate the Test Data Frames into a single Test Data Frame
l.  Merge Activity List Data Frame with Test Data Frame on the basis of AcitivityID column to form Test DataFrame with Activity Name in each row


<< Composite Data Frame creation starts for Train Data after reading Train files >>


m.  Subject Train data frame creation from subject_train.txt and column header name setting
n.  Y Train data frame creation from y_train.txt and column header name setting
15.  X Train data frame creation from X_train.txt
16.  Column name setting of columns on X Train Data Frame from Features List Data Frame Listing 
17.  Extract only mean and std related columns in X Train Data Frame  - Total of 68 columns
18.  Modify the column name mean(), mean()-, std(), std()- with appropriate string (Mean, Std) in column names
19.  Concatenate the Train Data Frames into a single Test Data Frame
20.  Merge Activity List Data Frame with Train Data Frame on the basis of AcitivityID column to form Train DataFrame with Activity Name in each row
21.  Combine Test and Train Data Frames into a single Composite data frame with all the required data and columns for Test and Train Data 
22.  Re-arrange the Activity column placement in Final Data Frame to appear next to ActivityID Column
23.  Run aggregate function to aggregate data based on SubjectID + ActivityID + Activity and display on R Consol
24.  Write Aggregate function result to a output text file
