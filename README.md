# tidydata
Getting and Cleaning Data Assignment Coursera
## how the script works and the code book describing the variables.
The script takes the 6 source data files through the prescribed 5 step process.
Specifically,
1) 
use read.table on the activity, subject and features set of 2 files
row bind each of those 3 data sets
read in the feature descriptors and apply them to the feature data sets
add contextual column names to the activity and subject data sets
column bind features, subject and activity to form tidy data
2)
Identify and store only mean or standard deviation variables, and make sure subject and activity variables are retained
use subsetting to create the required tidy data set reduction
3)
Read in the activity names and print them
4)
Do some substitutions of shortened nams using gsub
5)
using aggregate function from dplyr, generate means for unique subject/activity pairs
sort it and generate the file
