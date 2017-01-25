# Getting-cleaning-data-project
## run_analysis.R explanation
* the script uses plyr package ddply function
* it begins with by checking if the UCI HAR Dataset is there or not
* reads subject, x and y of the training set and combine them
* reads subject, x and y of the test set and coobine them

* data frame c is the combined train and test sets as asked in step 1
* data frame c2 is the extracted set with only the measurements on the mean and standard deviation for each measurement

* data frame f reads features.txt to extract the column name of the combined data frame
* then fs filters out online the necessary variable name corresponding to mean and sd for each measurement


