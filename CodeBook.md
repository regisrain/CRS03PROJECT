---
title: "CodeBook"
author: "Regis Rain"
date: "Saturday, November 22, 2014"
output: html_document
---

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

------------

#This is the Codebook describing variables used in the run_analysis script. 

##Variables
*x_test, x_train, y_test, y_train, subject_test, subject_train, activity_labels, features >> are variables created from reading the homonymous raw txt files  
*x_global >> is the addition of x_test and x_train  
*y_global >> is the addition of y_test and y_train  
*mean_cols >> contains the indexes of all features related to mean features  
*std_cols >> contains the indexes of all features related to std features  
*mean_cols_name >> contains the names of all features related to mean features  
*std_cols >> contains the names of all features related to std features  
*x_filter1 >> is a subset of x_global displaying mean-related features only  
*x_filter2>> is a subset of x_global displaying std-related features only  
*x_filter >> is the combination of x_filter1 and x_filter2  
*x_filter_merge >> is a dataframe combining x_filter with y_global (displays all mean and std-related measurements with the corresponding activity label)  
*cols >> is the nb of columns of x_filter_merge  
*tidy_set >> is the equivalent of x_filter_merge after descriptive features labels have been added  
*tidy_set_subject >> is a dframe combining tidu_set with indications of the subject corresponding to each observation  
*grouped >> is the grouping of tidy_set_subject by activity and subject  
*tidy >> is a summarised dataframe showing mean value for each combination of subject and activity. 
