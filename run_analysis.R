##########step1###################

#load test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt" )
x_test <- read.table("UCI HAR Dataset/test/X_test.txt" )
y_test <- read.table("UCI HAR Dataset/test/y_test.txt" )
#load train data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt" )
x_train <- read.table("UCI HAR Dataset/train/X_train.txt" )
y_train <- read.table("UCI HAR Dataset/train/y_train.txt" )

X <- rbind(x_train, x_test)
#write.csv(X, "UCI HAR Dataset/X.csv", row.names=TRUE)


# 
features_names <- read.table("UCI HAR Dataset/features.txt" )


#write.csv(X, "UCI HAR Dataset/Xcol.csv", row.names=TRUE)
# names(x_test)<- features_names
#  

MergedX <- rbind(x_test, x_train)
MergedY <- rbind(y_test, y_train)
MergedSubject <- rbind(subject_test, subject_train)
names(MergedX)  <- features_names$V2
# names(MergedY)  <- features_names$V2


WholeData <- cbind(MergedSubject, MergedX, MergedY)
# names(WholeData)  <- features_names$V2
ncol(WholeData)

write.csv(WholeData, "UCI HAR Dataset/WholeData.csv", row.names=TRUE)
############step2#################################

names(WholeData)[1] <- "Label"
lable <- WholeData[ , grepl("V1", names( WholeData ), perl = TRUE ) ]
names(WholeData)


meanCols <- WholeData[ , grepl("mean\\(\\)", names( WholeData ), perl = TRUE ) ]
ncol(meanCols)


stdCols <- WholeData[ , grepl("std\\(\\)", names( WholeData ), perl = TRUE ) ]
ncol(stdCols)

CombinedDataSet<-cbind(lable, meanCols, stdCols)
ncol(CombinedDataSet)


write.csv(CombinedDataSet, "UCI HAR Dataset/CombinedDataSet.csv", row.names=TRUE)


################step3###############################

activities <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activities) 

CombinedDataSet$lable<- activities[CombinedDataSet$lable, 2]


##################step4##############################


names(CombinedDataSet) <- gsub("\\(\\)","",names(CombinedDataSet))
names(CombinedDataSet) <- gsub("^f","F",names(CombinedDataSet))
names(CombinedDataSet) <- gsub("^t","T",names(CombinedDataSet))
names(CombinedDataSet) <- gsub("-mean","Average",names(CombinedDataSet))
names(CombinedDataSet) <- gsub("-std","StandardDeviation",names(CombinedDataSet))



##################step5###########################

write.csv(CombinedDataSet, "UCI HAR Dataset/CombinedDataSet.csv", row.names=TRUE)
# statistics<-summary(CombinedDataSet)
library(plyr)
tidy_data<- ddply(CombinedDataSet, c("lable" ), numcolwise(mean))

 
write.table(tidy_data, file = "UCI HAR Dataset/tidy_data.txt")
 