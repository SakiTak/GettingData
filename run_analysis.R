# This program is the script run_analysis.R for the Coursera 'Getting and Cleaning Data' Course 
# Project. This script performs the following 5 steps:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the 
#    average of each variable for each activity and each subject.

#Load the library dplyr
library(dplyr)

# Load the three datasets related to the training subset of measurements
dftr1 <- read.table("X_train.txt")
dftr2 <- read.table("y_train.txt")
dftr3 <- read.table("subject_train.txt")

# Load the dataset with the variable names and prepare to label the variables
dftr4 <- read.table("features.txt")
dftr4 <- dftr4[,2]

# Label the training dataset with the variable names
names(dftr1) <- dftr4

# Prepare to extracts only the measurements on the mean and standard deviation for each measurement
my_match = c("mean()", "std()")

# Only extract the measurements on the mean and standard deviation
new = dftr1[, grepl(paste(my_match,collapse="|"), colnames(dftr1))]

# Bind the subject id and activity label to the training dataset
train_col <- c(dftr3, dftr2)
training_set <- cbind(train_col, new)

# Load the three datasets related to the test subset of measurements
dfte1 <- read.table("X_test.txt")
dfte2 <- read.table("y_test.txt")
dfte3 <- read.table("subject_test.txt")

# Load the dataset with the variable names and prepare to label the variables
names(dfte1) <- dftr4
new_test = dfte1[, grepl(paste(my_match,collapse="|"), colnames(dfte1))]

# Bind the subject id and activity label to the test dataset
test_col <- c(dfte3, dfte2)
test_set <- cbind(test_col, new_test)

# Merge the training and the test sets to create one data set
final <- rbind(training_set, test_set)

# Label Subject id and Activity
names(final)[1:2] <- c("Subject", "Activity")

# This is the final tidy dataframe that contains the average of each variable for each activity and each subject
disp <- final %>% group_by(Subject, Activity) %>% summarise_each(funs(mean), matches("mean()|std()"))

# Modification of variable names to eliminate duplication 
names(disp) <- gsub(pattern = "BodyBody", replacement = "Body", x = names(disp))

# Add descriptive activity names to name the activities in the data set based on activity_labels.txt
disp$Activity <- gsub(pattern = "1", replacement = "WALKING", x = disp$Activity)
disp$Activity <- gsub(pattern = "2", replacement = "WALKING_UPSTAIRS", x = disp$Activity)
disp$Activity <- gsub(pattern = "3", replacement = "WALKING_DOWNSTAIRS", x = disp$Activity)
disp$Activity <- gsub(pattern = "4", replacement = "SITTING", x = disp$Activity)
disp$Activity <- gsub(pattern = "5", replacement = "STANDING", x = disp$Activity)
disp$Activity <- gsub(pattern = "6", replacement = "LAYING", x = disp$Activity)

# Write out the final tidy dataset
write.table(disp, "tidydataset.txt", row.name = FALSE)
