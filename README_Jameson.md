# UCB_DataBootcamp_Final_Project
Final group project for UC Berkeley Data Bootcamp. Develop a machine learning model with a database and a interactive visual dashboard. 

## Data Sources
static data set: (https://www.kaggle.com/datasets/rohanrao/formula-1-world-championship-1950-2020)  
API for additional data pulls:
(https://theoehrly.github.io/Fast-F1/index.html)

## Jacob's Comments from week 1
>Looks like our F1 data folder from Kaggle is a strong and substantial source.  Additionally, we have some interesting data on tires, weather, etc. from an API that will be a little harder to wrangle.  For now, we discussed looking into a clustering classification approach to see if there are "types" of drivers to be identified. This could, in turn, become a useful label in interactive dashboarding of other aspects- we'll see how it works out first.  We also discussed getting the main Kaggle folder of csv's all organized into a relational diagram and a set of tables in a postgres database for access and queries.  We spent some time working out our use of branches and repository protocols.


## Jameson Notes
### Week 1
have decided to work with an F1 data set found on Kaggle. intitially we also considered the FastF1 API, but on further consideration we decided to shelve that idea/data set for now and focus on the flat files provided by Kaggle to achieve a minimum viable product in the time frame we have. 
I did some initial data exploration to gather all the columns from each data set, determine the existing data types, and the number of unique values. 
We have decided to tackel an unsupervised machine learnind model to classify drivers. likely either K-means clustering or a dendrogram.
next steps will be to narrow down the data to the fields that will be relevant. by the beginning of week two I expect to have drafted up some data tables as CSVs to feed into the database portion. we may end up iterating a bit later on the input data, but it should provide a pretty good starting point. 