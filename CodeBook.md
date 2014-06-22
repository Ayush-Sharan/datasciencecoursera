Course Project: Getting and Cleaning Data

Note: The required .txt files were placed in a specified folder that was set as the working directory.
Files required: "X_train.txt", "X_test.txt", "features.txt" 
Explanation of variables:

X_train: The variable includes the training set from the X_train.txt file
X_test: The variable includes the test set from the X_test.txt file

features_list: It includes the variable names i.e, the features.txt file contents

position_train: Contains the activity ID numbers (1-6) for the training set data
position_test: Contains the activity ID numbers (1-6) for the test set data

positions: binded data frame (using rbind on position_train and position_test)

The column in positions was named to Activity just for the ease

ans1: The variable contains the merged data set and gives 10299 rows and 561 columns

The names in the data set "ans1" were replaced using the features_list variable described above. 

logvec: logical vector that contains TRUE/FALSE based on whether column names in ans1 contain the word "mean"
ans2.1: extracted data where column names with mean is present
logvec2:logical vector that contains TRUE/FALSE based on whether column names in ans1 contain the word "std"
ans2.2: extracted data where column names with std is present

ans2: combined data set with required extracted values that is "means" and "stds"

subject_train: variable with subject information for training set
subject_test: variable with subject information for test set
subjects: rbinded data frame, combination of subject_test and subject_train data frames

The column name in subjects was assigned "Subject"

imd: A data set with subjects and positions combined using cbind

-------------------------------------------------------------------------------------------------------
Notes---> crucial variables: ans2 contains the extracted columns (with mean and std)(10299 rows, 79 columns), imd contains the position and subject information (10299 rows, 2 columns)
-------------------------------------------------------------------------------------------------------

activity_labels: reads the data in activity_labels.txt file

desc_activity: contains the descriptions of the activities, note: Sort set to FALSE to avoid jumbling of data

ans4: The final merged data set formed by cbinding the ans2 (extracted columns) and desc_activity file to get a final data set with 10299 rows and 82 columns (std + mean + activity id+ activity description + subject id)

miris: data set after melting and assigning id.vars = Activity ID and Subject ID

x: obtained after ddply function

tidydata: the final tidy data set

 