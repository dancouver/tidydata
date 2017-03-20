# Codebook
## Data source
The dataset is from the "Human Activity Recognition Using Smartphones Data Set", available here: 
 * https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 
The context is provided here:
 * http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data
The dataset includes the following files:
 * 'README.txt'
 * 'features_info.txt': Shows information about the variables used on the feature vector.
 * 'features.txt': List of all features.
 * 'activity_labels.txt': Links the class labels with their activity name.
 * 'train/X_train.txt': Training set.
 * 'train/y_train.txt': Training labels.
 * 'test/X_test.txt': Test set.
 * 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.
 * 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
 * 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
 * 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
 * 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

## Feature Selection
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
 * TimeBodyAccelerometor-XYZ
 * TimeGravityAccelerometor-XYZ
 * TimeBodyAccelerometorJerk-XYZ
 * TimeBodyGyroscope-XYZ
 * TimeBodyGyroscopeJerk-XYZ
 * TimeBodyAccelerometorMagnitude
 * TimeGravityAcelerometorcMagnitude
 * TimeBodyAccelerometorJerkMagnitude
 * TimeBodyGyroscopeMagnitude
 * TimeBodyGyroscopeJerkMagnitude
 * FrequencyBodyAccelerometor-XYZ
 * FrequencyBodyAccelerometorJerk-XYZ
 * FrequencyBodyGyroscope-XYZ
 * FrequencyBodyAccelerometorMagnitude
 * FrequencyBodyAccelerometorJerkMagnitude
 * FrequencyBodyGyroscopeMagnitude
 * FrequencyBodyGyroscopeJerkMagnitude
 
The set of variables that were estimated from these signals are: 

 * mean(): Mean value
 * std(): Standard deviation
## How it works
The transformation follows a 5 step process of merge and selective reduction, mean calculation, followed by a sort. The R script and READ me has 
detailed information

