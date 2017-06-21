## JHDST: Getting and Cleaning Data Final Project ##

This repository contains all work pertaining to the final project for this course. In addition to this readme file, the repository contains a codebook, an R script, and a data folder. Within the data folder are the data sets and associated files from University of California Irvine's (UCI) "Human Activity Recognition Using Smartphones" project (see the [website here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)) as well as text file titled "Averages of Measures.txt". This text file is a data set created by the R script "run_analysis.R" and contains the averages by subject and activity of the means and standard deviations of 66 different measures reported in UCI's data sets.

The "run_analysis.R" script first downloads and unzips the zipped file containing UCI's data sets and associate files. The script then loads the training and testing data sets and rowbinds them together to form one large data set that contains measurements for all 30 subjects.

```r
## Download and extract data folder
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
              "data/Datasets.zip")
zipF<- "data/Datasets.zip"
outDir<-"data"
unzip(zipF,exdir=outDir)
rm(outDir, zipF)

## Read testing and training data sets and rowbind them to form one data frame
library(readr)
train <- read_table("data/UCI HAR Dataset/train/X_train.txt", col_names = FALSE)
test <- read_table("data/UCI HAR Dataset/test/X_test.txt", col_names = FALSE)
both <- rbind(train, test)
rm(train, test)
```

Next the script reads the variable/measurement names from the "features.txt" document and appropriately names the columns of the combined data set. Next all columns corresponding to means and standard deviations of measurements are selected using regular expression syntax. 

```r
## Get names of variables in data sets
varnames <- read_lines("data/UCI HAR Dataset/features.txt")

## Label columns
names(both) <- varnames
rm(varnames)

## Find column names for mean and standard deviations of measurements
coi <- names(both)[grep("mean\\(|std\\(", names(both))]
coi
coi <- grep("mean\\(|std\\(", names(both))
```

Next the numbers indicating activity type for each observation in the data set are read from "y_train.txt" and "y_test.txt" and appended to the combined data set in a column titled "actnumbs". This column is then renamed "activity" and the string describing the activity corresponding to the activity number (as indicated in the file "activity_labels.txt") is used to replace the activity number. 

```r
## Name each observation with description of activity
train_actnumbs <- read_lines("data/UCI HAR Dataset/train/y_train.txt")
test_actnumbs <- read_lines("data/UCI HAR Dataset/test/y_test.txt")
actnumbs <- c(as.numeric(train_actnumbs), as.numeric(test_actnumbs))
rm(train_actnumbs, test_actnumbs)

df <- cbind(actnumbs, df)
df <- tbl_df(df)
rm(actnumbs)

labeler <- function(numb) {
  if(numb == 1){
    x <- "Walking"
  }
  else if(numb == 2){
    x <- "Walking Upstairs"
  }
  else if(numb == 3){
    x <- "Walking Downstairs"
  }
  else if(numb == 4){
    x <- "Sitting"
  }
  else if(numb == 5){
    x <- "Standing"
  }
  else if(numb == 6){
    x <- "Laying"
  }
  x
}

df <- df %>%
  rename(activity = actnumbs) %>%
  mutate(activity = sapply(activity, labeler))
```

Next all the columns are renamed to give a cleaner look to the data set. 

```r
## Rename columns
names(df) <- sub("[0-9]+ ", "", names(df))
names(df) <- gsub("-", "\\.", names(df))
names(df) <- gsub("\\(\\)", "", names(df))
names(df) <- gsub("BodyBody", "Body", names(df))
```

The subject identification numbers were then read from "subject_train.txt" and "subject_test.txt" and appended to the combined data set in a column titled "subject.id". 

```r
## Insert column with subject ID numbers
train_ID <- read_lines("data/UCI HAR Dataset/train/subject_train.txt")
test_ID <- read_lines("data/UCI HAR Dataset/test/subject_test.txt")
subject.id <- c(as.numeric(train_ID), as.numeric(test_ID))
rm(train_ID, test_ID)

df <- cbind(subject.id, df)
df <- tbl_df(df)
rm(subject.id)
```

Finally, the reshape package was used to create a new data set with the averages (mean) of the mean and standard deviations of the measurements (columns) for each subject and activity combination (for more information on the measurements see "CodeBook.md" and "features_info.txt" in the "UCI HAR Dataset" folder within the "data" folder). 

```r
## Create new data set with the averages of each variable for each activity and each subject
library(reshape2)

df.tidy <- df %>%
  melt(id = c("subject.id", "activity"), measure.vars = names(df)[-c(1:2)]) %>%
  dcast(subject.id + activity ~ variable, mean)
```

Thus the new data set contains the average mean and average standard deviation of each measurement taken in UCI's study for each activity performed by each subject. The R script writes this data set in white-space separated form to the file "Averages of Measures.txt"

```r
write.table(df.tidy, "data/Averages of Measures.txt", row.names = FALSE)
```


 