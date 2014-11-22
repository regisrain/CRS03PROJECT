##Coursera Getting and Cleaning Data Course Project script 

##Set working directories and calls libraries
setwd("C:/Users/Régis/Documents/Regis/coursera/workdir/CRS03PROJECT")
library(dplyr)
library(plyr)
#library(DataCombine)

##Merge Training and Test sets in x_global
x_test<-read.table("X_test.txt")
x_train<-read.table("X_train.txt")
x_global<-rbind_list(x_test,x_train)

##Read Features list and acquire indexes of mean and sd columns
features<-read.table("features.txt")
mean_cols<-grep("*mean*",features$V2,ignore.case=TRUE)
mean_cols_name<-grep("*mean*",features$V2,ignore.case=TRUE,value=TRUE)
std_cols<-grep("*std*",features$V2,ignore.case=TRUE)
std_cols_name<-grep("*std*",features$V2,ignore.case=TRUE,value=TRUE)

##SUBSET x_global by mean and std - create x_global 
x_filter1<-select(x_global,mean_cols)
x_filter2<-select(x_global,std_cols)
x_filter<-cbind(x_filter1,x_filter2)

##Read Activity names and creates a character-transformed version of y_test and y_train =>y_global 
activity_labels<-read.table("activity_labels.txt")
y_test<-read.table("y_test.txt",col.names="activity")
y_train<-read.table("y_train.txt",col.names="activity")
y_global<-rbind_list(y_test,y_train)

y_global$activity<-activity_labels[y_global$activity,2]

##Merge x_filter and y_global to create a compact dataframe where activities is the first column
x_filter_merge<-cbind(y_global,x_filter)


##Apply Explicit variable names to dataframe and rename it "tidy set"
cols<-ncol(x_filter_merge)
colnames(x_filter_merge)[2:cols]<-c(mean_cols_name,std_cols_name)
tidy_set<-x_filter_merge


## Inject subjects identifiers to the tidy set 
subject_test<-read.table("subject_test.txt",col.names="subject")
subject_train<-read.table("subject_train.txt",col.names="subject")
subject_global<-rbind(subject_test,subject_train)
tidy_set_subject<-cbind(subject_global,tidy_set)

## Split table by subject and activity and summarize
grouped<-group_by(tidy_set_subject,subject,activity)
tidy<-summarise_each(grouped,funs(mean))

## Create the final tidied txt file
write.table(tidy,"tidy.txt",row.names=FALSE)




