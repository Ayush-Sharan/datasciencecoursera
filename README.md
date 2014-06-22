Course Project for Getting and Cleaning Data


Data Processing

1) Reading data: The data sets (both training and test) and the features list, subjects list were read using read.table command

2) The data sets (training and test) were bound together using rbind command to get a data set of 10299 rows and 561 columns

3) The activity label data sets were merged with the subjects data set using cbind to form an intermediate data set that was finally merged with the data set formed in step 2

4) The descriptive names were added by using the features_list file and the column names were added. The activity numbers 1-6 were replaced with text by using merge command (making sure the sort is set to FALSE so that the data set is not sorted in any order)

5) Using grepl function the required columns with 'mean' and 'std' in their names was extracted. 

6) Using reshape and plyr library the final data set was made tidy. Using melt, ddply and dcast commands to prepare a tidy data set

