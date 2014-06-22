#Read the training and test sets into and assign them into similar variables

X_train <- read.table("X_train.txt")
X_test <- read.table("X_test.txt")

# Read the features.txt file and assign the column names to both the sets after merging

features_list <- read.table("features.txt")
position_train <- read.table("y_train.txt")
position_test <- read.table("y_test.txt")
positions <- rbind(position_train,position_test)
names(positions) <- c("Activity")

#Merge the 2 sets
ans1 <- rbind(X_train,X_test)
names(ans1) <- features_list$V2

#Extracting columns with mean and std() in them 

logvec <- grepl('keep|mean', names(ans1))
ans2.1 <- ans1[,logvec]
logvec2 <- grepl('keep|std', names(ans1))
ans2.2 <- ans1[,logvec2]
ans2 <- cbind(ans2.1,ans2.2)

#Read the subject train files
subject_train <- read.table("subject_train.txt")
subject_test <- read.table("subject_test.txt")
subjects <- rbind(subject_train,subject_test)
names(subjects) <- c("Subject")

#Make an intermediate data frame with activity positions and subjects and bind them 
imd <- cbind(positions,subjects)
#ans3 <- cbind(ans2,imd)

#Read activity file
activity_labels <- read.table("activity_labels.txt")

#Make clear descriptive activity labels, keeping sort = FALSE in the merge() command so 
#that the merged data frame is not sorted.
desc_activity <- merge(imd,activity_labels,by.x = "Activity",by.y = "V1",sort = FALSE all= TRUE)
names(desc_activity) <- c("ActivityID", "SubjectID", "Activity")
ans4 <- cbind(ans2, desc_activity)

#Creating a tidy data set
library(plyr)
library(reshape2)

miris <- melt(ans4, id.vars=c("ActivityID","SubjectID"))
x <- ddply(miris, .(ActivityID,SubjectID, variable), summarize, mean=mean(value))

tidydata <- dcast(x, ActivityID+SubjectID~variable, value.var="mean")

#Print out the data to a text file

write.table(ans4, "tidydata1.txt", sep="\t")
