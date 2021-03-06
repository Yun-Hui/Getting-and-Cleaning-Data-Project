

## Objective:for Coursera Course Work (Cleaning Dataset) 

# 0. install reshape for tidy dataset

if (!require("reshape2")) {
  install.packages("reshape2")}

library(reshape2)

# 1. get the activity lable used for Y files

activity_labels <- read.table("activity_labels.txt")
colnames(activity_labels)<-c("Activity_ID","Act_Name")


## 2. get colum names used for X files
##Extract only the mean and standard deviation for each measurement
features <- read.table("features.txt")[,2]
extract_features <- grepl("mean|std", features)
measure_var <- grep("mean\\(\\)|std\\(\\)", features, value=TRUE)


# 3. Combine all data (subject,test and train) and assign the column names

## 3.0 read data into data frames: 

subject_train <- read.table("./train/subject_train.txt")
X_train <- read.table("./train/X_train.txt")
Y_train <- read.table("./train/y_train.txt")


subject_test <- read.table("./test/subject_test.txt")
X_test <- read.table("./test/X_test.txt")
Y_test <- read.table("./test/y_test.txt")

## 3-1. add colunm names to the train and test data Files (X files)
#  Extract only the mean and standard deviation for each measurement.

colnames(X_test)<-features
colnames(X_train)<-features

X_test = X_test[,extract_features]
X_train = X_train[,extract_features]

## 3-2. add colunm names to the train and test lable Files (Y files)

names(Y_test)<-"Activity_ID"
names(Y_train)<-"Activity_ID"

## 3-3. add colname names to subject files

names(subject_train)<-"Subject_ID"
names(subject_test)<-"Subject_ID"


## 3-4. combine files into one

traindata <- cbind(subject_train, Y_train, X_train)
testdata <- cbind(subject_test,Y_test, X_test)
alldata<-rbind(traindata,testdata)
mergeData<-merge(alldata,activity_labels,by.x="Activity_ID",by.y="Activity_ID",all=TRUE)

# 4. generte the value and ccreate tidy dataset

melted <- melt(mergeData, id=c("Subject_ID","Activity_ID","Act_Name"),measure.vars=measure_var)

tidy_data   = dcast(melted , Subject_ID+Act_Name ~ variable, mean)

write.table(tidy_data, "tidy_data.txt", row.names=FALSE)
