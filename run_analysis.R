#Download and unzip data
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile = "traintest.zip")
unzip("traintest.zip")

#Read the files
test<-read.table("UCI HAR Dataset/test/X_test.txt") #The test measurements data set
train<-read.table("UCI HAR Dataset/train/X_train.txt") #The train measurements data set
labels<-read.table("UCI HAR Dataset/activity_labels.txt") #The labels of the six activities
feat<-read.table("UCI HAR Dataset/features.txt") #The labels of the measurements data sets
stest<-read.table("UCI HAR Dataset/test/subject_test.txt") #The identifiers of the experiment subjects of each measurement in the test data set
strain<-read.table("UCI HAR Dataset/train/subject_train.txt") #The identifiers of the experiment subjects of each measurement in the train data set
testlab<-read.table("UCI HAR Dataset/test/y_test.txt") #The Activity labels of each measurement in the test data set
trainlab<-read.table("UCI HAR Dataset/train/y_train.txt") #The Activity labels of each measurement in the train data set

#Add variable names to the data sets
featureslabels<-feat$V2
colnames(test)<-featureslabels
colnames(train)<-featureslabels

#Add the activity variable to both data sets
colnames(testlab)<-"Activity"
colnames(trainlab)<-"Activity"
finaltest<-cbind(testlab,test)
finaltrain<-cbind(trainlab,train)

#Add the subject number id to the train and test data sets
colnames(stest)<-"Subject"
colnames(strain)<-"Subject"
finaltest<-cbind(stest,finaltest)
finaltrain<-cbind(strain,finaltrain)

#Merging the test and train data sets
merged<-rbind(finaltest,finaltrain)

#Eliminate non std and mean variables
stdcolumns<-grep("std",names(merged))
meancolumns<-grep("mean",names(merged))
meanstdcolumns<-c(stdcolumns,meancolumns)
meanstdcolumns<-c(1:2,meanstdcolumns)
datamerged<-merged[,meanstdcolumns]

#Replace activity numbers by labels
datamerged$Activity<-gsub(1,"Walking",datamerged$Activity)
datamerged$Activity<-gsub(2,"Walking upstairs",datamerged$Activity)
datamerged$Activity<-gsub(3,"Walking downstairs",datamerged$Activity)
datamerged$Activity<-gsub(4,"Sitting",datamerged$Activity)
datamerged$Activity<-gsub(5,"Standing",datamerged$Activity)
datamerged$Activity<-gsub(6,"Laying",datamerged$Activity)
#datamerged becomes the Step 4 dataset with all the measurements with Activity labels and Subject IDs

#Create a new data set with the average of each variable for each activity and subject
tidyset<-(datamerged %>% group_by(Activity,Subject) %>% summarise_all(funs(mean))) #Step 5 tidy data set

#Remove all objects except the tidy merged dataset and write the text file with it
rm(list=setdiff(ls(), "tidyset"))
write.table(tidyset,file="tidyset.txt",row.names = FALSE)