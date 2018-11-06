Human Activity Recognition Using Smartphones Dataset
****************************************************

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

The folder includes the following files
***************************************

"tidyset.txt" 
*************
A data set saved with write.table(). For each combination of Activity (labeled) and Subject (identified) the followin is provided:
- Average of the means of the axial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Average of the standard deviations of the axial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Average of the means of the Triaxial Angular velocity from the gyroscope. 
- Average of the standard deviations of the Triaxial Angular velocity from the gyroscope. 

"Codebook.md"
*************
A detail of all the variables included in the tidy data set. 

-"run_analysis.R"
*****************
The script that transforms the raw data data set that follows the rules of tidy data:
Each variable forms a column.
Each observation forms a row.
Each type of observational unit forms a table.

The script then builds another data set which summarises the average of each variable related with mean() or std() measures for each pair of Activity and Subject. This data set is "tidyset.txt".
