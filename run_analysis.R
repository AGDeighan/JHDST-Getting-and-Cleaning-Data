## Download and extract data folder
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data/Datasets.zip")
zipF<- "data/Datasets.zip"
outDir<-"data"
unzip(zipF,exdir=outDir)

## Read testing and training data sets and rowbind them to form one data frame
library(readr)
train <- read_table("data/UCI HAR Dataset/train/X_train.txt", col_names = FALSE)
test <- read_table("data/UCI HAR Dataset/test/X_test.txt", col_names = FALSE)
both <- rbind(train, test)
rm(train, test)

## Get names of variables in data sets
varnames <- read_lines("data/UCI HAR Dataset/features.txt")

## Label columns
names(both) <- varnames
rm(varnames)

## Find column names for mean and standard deviations of measurements
coi <- names(both)[grep("mean\\(|std\\(", names(both))]
coi
coi <- grep("mean\\(|std\\(", names(both))

## Select only columns of interest
library(dplyr)
df <- select(both, coi)
rm(both, coi)

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

## Rename columns
names(df) <- sub("[0-9]+ ", "", names(df))
names(df) <- gsub("-", "\\.", names(df))
names(df) <- gsub("\\(\\)", "", names(df))

## Insert column with subject ID numbers
train_ID <- read_lines("data/UCI HAR Dataset/train/subject_train.txt")
test_ID <- read_lines("data/UCI HAR Dataset/test/subject_test.txt")
subject.id <- c(as.numeric(train_ID), as.numeric(test_ID))
rm(train_ID, test_ID)

df <- cbind(subject.id, df)
df <- tbl_df(df)
rm(subject.id)


## Create new data set with the averages of each variable for each activity and each subject
library(reshape2)

df.tidy <- df %>%
  melt(id = c("subject.id", "activity"), measure.vars = names(df)[-c(1:2)]) %>%
  dcast(subject.id + activity ~ variable, mean)

write.table(df.tidy, "data/Averages of Measures.txt", row.names = FALSE)


