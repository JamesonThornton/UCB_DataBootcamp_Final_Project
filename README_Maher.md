# Maher's ReadME

## Week 1 Notes
01/20/2023

As a group, we:
- Agreed upon a project topic: F1 Racing Data
- Selected and finalized a dataset consisting of flat csv files
- Received approval from instructor and multiple TA's on project topic/goal
- Assigned roles and action items for upcoming deadline(s)



### Action Items
- Work with Varun to use unsupervised machine learning on F1 dataset to ultimately cluster drivers
    - Awaiting to receive clean data from Jameson and Jacob
    - Awaiting access to PostgreSQL database from John

<br>

## Week 2 Notes
01/30/2023
- Decided to further our analysis by aggregating data into
    - Lap times
    - Race
    - Season/year
    - Career

- Need to determine the lost variance in our PCA model
- Discussed presentation flow, reviewed Prezi visualization, and determined goals
    
<br>

## Machine Learning
 As a group, we decided to use an unsupervised machine learning model, using PCA to scale our data and K-Means for clusters. Our main goal with our F1 dataset was to determine whether the drivers in F1 racing would cluster and how they cluster. Upon receiving a merged, cleaned, and data integral file, we imported the table after connecting to our PostgreSQL database.

 In Google Colab, we:
 - Loaded our table into a dataframe
 - Identified our data types
    - Many columns consisted of objects and needed to be converted to numeric values prior to continuing down the data pipeline
 - Counted the number of null values
 - Dropped all null values
 - Reviewed the amount of rows/columns left (218501, 30)
 - Using the lambda function, converted all datatypes to numeric values
 - Dropped 6 columns that could not convert properly since they consisted of varchars
 - Imported StandardScaler to scale our data
 - Imported PCA to transform ouir scaled data
 - Created a dataframe from our transformed PCA data
 - Determined our important features in the PC1, PC2, and PC3 components
 - Created a 'for loop' and elbow curve to determine our number of clusters
 - Initialized a K-Means cluster model, fit the model with our PCA dataframe and predicted our clusters
 - Created a new 'Class' column to dictate which class each data clustered to
 - Printed how many entries belonged to a specific class (class 0, 1, or 2)
 - Created a 3d-scatter plot to visualize our data clusters using an x-axis of 'results_position', a y-axis of 'year', and a z-axis of 'fastestLapSpeed'