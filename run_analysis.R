run_analysis <- function() {
  ## assumes UCI HAR Dataset is in current directory
  ## generate
 
  ## 1 Merge the training and test sets to create one data set
  
    ## Get and merge Activity data
    ActivityTest  <- read.table("UCI HAR Dataset/test/Y_test.txt",header = FALSE)
    ActivityTrain <- read.table("UCI HAR Dataset/train/Y_train.txt",header = FALSE)
    Activity <- rbind(ActivityTrain,ActivityTest)
  
    ## Get and merge Subject data
    SubjectTest  <- read.table("UCI HAR Dataset/test/subject_test.txt",header = FALSE)
    SubjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt",header = FALSE)
    Subject <- rbind(SubjectTrain,SubjectTest)
  
    ## Get and merge Features data
    FeaturesTest  <- read.table("UCI HAR Dataset/test/X_test.txt",header = FALSE)
    FeaturesTrain <- read.table("UCI HAR Dataset/train/X_train.txt",header = FALSE)
    Features <- rbind(FeaturesTrain,FeaturesTest)
   
    ## Get the descriptors
    FeaturesNames <- read.table("UCI HAR Dataset/features.txt",header = FALSE)
  
    ## Make column names contextual / meaningful
    names(Activity)<- c("activity")
    names(Subject)<-c("subject")
    names(Features) <-FeaturesNames[,2]
  
    ## Make a dataframe containing all data
    Alldata <-cbind(Features,cbind(Subject,Activity))
  
  ## 2 Extract only the measurements on the mean and standard deviation for each measurement.				
  
    ## get only the variable names relating to mean or std(dev)
    requiredvars <- FeaturesNames[grep("mean\\(\\)|std\\(\\)",FeaturesNames[,2]),2]
    ## and add the subject and activity columns
    requiredvars <- c(as.character(requiredvars),"subject","activity")
    ## extract only these columns and assign to original data
    Alldata <- subset(Alldata,select=requiredvars)
  
  ## 3 Use descriptive activity names to name the activities in the data set				
  
    ## read in activities names and print them
    activitynames <- read.table("UCI HAR Dataset/activity_labels.txt",header=FALSE)
    print (activitynames)
  
  ## 4 Appropriately labels the data set with descriptive variable names.				
    names(Alldata)<-gsub("^t", "Time", names(Alldata))
    names(Alldata)<-gsub("^f", "Frequency", names(Alldata))
    names(Alldata)<-gsub("freq", "Frequency", names(Alldata))
    names(Alldata)<-gsub("Acc", "Accelerometer", names(Alldata))
    names(Alldata)<-gsub("Gyro", "Gyroscope", names(Alldata))
    names(Alldata)<-gsub("Mag", "Magnitude", names(Alldata))
    names(Alldata)<-gsub("BodyBody", "Body", names(Alldata))
    names(Alldata)<-gsub("()", "", names(Alldata))
    
  ## 5 From (4) create a second, independent tidy data set with the average of each variable for each activity and each subject.

    library(dplyr)
    ## aggregate means for each unique subject+activity combination
    aggregate(. ~subject + activity, Alldata, mean) -> Alldata
    ## sort that data and write it to a text file
    Alldata[order(Alldata$subject,Alldata$activity),] -> Alldata
    write.table(Alldata, file = "Tidydata.txt", row.names = FALSE)
}
