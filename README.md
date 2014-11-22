CRS03PROJECT
============

This is the repo for Coursera Getting & Cleaning Data Course Project.
Working on UCI HAR Dataset. 
Goal is to extract average values of different measurements grouped by subject and activity. 

To do so, I took the assumption that Inertial Signals were raw data not useful in the exercice.
I focused on working on X_test, X_train, y_test,  y_train, subject_test and subject_train txt files.
For matters of simplicity I copied-pasted all of them in the working directory before running the script.

Result is a 182*88 columns txt file.

SCRIPT DETAILS
----------------

I used plyr and dplyr libraries.
I first rbinded the train and test measurements to get a global measurements file.
Then I extracted the indexes of all features related to means or standard deviation using grep.
I als recorded the names of those features using grep too (stored them for later)
I passed those indexes to my global file one after the other using select function and then binded by columns to get a filter measurement file (x_filter)

Then I went to the y_test and y_train files, binded them into 1 single file (y_global).
Named the single column "activity". 
I read the content of activity_labels to get indexes related to each descriptive activity name.
I used subsetting to replace integer values in y_global by descriptive activity names.

MErged x_filter with y_global using cbind <- x_filter_merge

Applied to this dframe the columns name I had previously got through grep (see above).
This makes the tidy_set dframe.

Then I created a single subject observation file rbinding subject_test and subject_train.
Cbinded the result with tidy_set to create tidy_set_subject.

Then I finally used group_by and summarise_each (passing the mean function to it) to group overall frames by combinations of subject and activity names, then calculate mean for each combination.

That's all folks!!









