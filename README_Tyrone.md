# Machine Learning with Formula 1 Driver Info Analysis
Using ETL, Unsupervised Machine Learning, and creating a visualization dashboard of data derived from Formula 1 Driver information to explore phenomenas within Formula 1.  

<br/>
<p align="center">Tyrone Fraley<br/>
UC Berkley Extension<br/>
Jan 20 - Feb 9 2023<br/>
<p/>

<br/>
<p align="center">
  <img width="460" height="200" src="Images/formulaonedatapoints.jpeg">
</p>
<br/>

## Project Overview

<br/>
 On Jan 17th, 2023 our team (Tyrone Fraley, Jacob Voyce, Jameson Thornton, John Allen, Varun Yalaka, and Maher Abdallah) met for two hours to discuss our already agreed upon project centered in Formula One Data. We decided the best approach to this project would be to develop an machine learning model that could cluster drivers based on various factors related to the driver's attributes and race data. From this point we could develop visualizations of drivers based on their classes. 
 
 <br/>
 
## Collaboration and Assignment of Roles 

For the initial meeting team discussed our strengths and weaknesses. We then divided duties amongst each other, but also agreed that we would all need to help each other in an effort to remain efficient. Once, roles were discussed we started brainstorming what questions we wanted to explore with our data set from: https://www.kaggle.com/datasets/rohanrao/formula-1-world-championship-1950-2020. To do this, we discussed several variables from the data set, what the values measured, and how the data could be properly analyzed/modeled. In addition, when visualization first came up we decided on JavaScript, but that changed to Tableau due to the machine learning model. Finally, the question we seek to answer is how would an unsupervised machine learning algorithm classify drivers based on many features of driver, constructor, and race data and what would those classifications show us about different aspects, experiences, or performances of F1 drivers in our data set.

<br/>

* Project Roles:
    * ETL: Jacob Voyce and Jameson Thornton
    * Database: John Allen
    * Unsupervised Machine Learning: Varun Yalaka and Maher Abdallah
    * Visualization: Tyrone Fraley, Jacob Voyce, and John Allen
    * Project Manager: John Allen
    * Technical Written Report: Tyrone Fraley 

## ETL

The extraction phase of our analysis included gathering fourteen Formula One csv files from the Formula-1-world-championship-1950-2020 Kaggle data set and use an API key from https://theoehrly.github.io/Fast-F1/index.html. It was agreed that pandas and PostgreSQL would be our main drivers for this phase and the data would be stored in an Amazon RDS. At first glance, we had a mass amount of data at our finger tips and understanding how the variables work in real time was crucial during the ETL phase. This was due to our need for relevant data for our analysis, unsupervised machine learning model, and our visualization strategy. 


* Tables Within the Database:
    * circuits
    * constructors
    * driver_stnd
    * drivers
    * driver_names
    * outer_join_final
    * outer_join_final_merged
    * lap_times
    * pit_stops
    * quali
    * results
    * sprint_rslt
    * status
    * results_merged
    * sprint_rslt
    * status
    
## Unsupervised Machine Learning 

The team discussed potential machine learning based models. As a directed approach the focus will be on lap times, races, season/year, and career. When the machine learning model was developed. We found that the clusters were too close together and we were unable to classify the drivers from the clusters. We then decided to switch to using Supervised Machine Learning methods to better predict the race outcomes.

## Supervised Machine Learning

For Supervised Machine Learning we used Linear Regression, Neural Network, Random Forest Regressor, and Random Forest Classifier. The data set for the models excluded any 2022 data so that we could later cross examine the models predictions with 2022 data in our Tableau dashboard. From the models we used their precision scores as our source of validating that we could predict Formula One race winners. After retrieving all precision scores were recorded we decided the Neural Network was the best model. 

* Precision scores
    * Neural Network Classifier: 0.76
    * Linear Regression: 0.52
    * Random Forest Classifier: 0.52
    * Random Forest Regressor: 0.48

## Visualization

As a preliminary effort to create a well-defined data set that could be translated through Tableau. The outer_join_final.csv file had to be imported into pandas and adjusted. The first goal was to remove excess rows that were a better fit for machine learning models, but not for Tableau since columns like wins would replicate wins rooted in duplicated rows. Thus, inflating the driver's win count. To complete this the data pulled from outer_join_final.csv was passed into a data frame and then many columns were inspected for value counts, null values, and unique values. Race_country was added to the data frame by creating a dictionary full of races and what countries they corresponded to. The dictionary was then passed into the data frame by using df['race_country'] = df['races_name'].apply(lambda x: race_country_map.get(x, 'Unknown')). Next, the driver_country column was created by creating a dictionary called 'mapping' that could hold all of the estimated countries of origin based on the driver's nationality information in the 'naitonality column. 'Driver_country' was added to the data frame through  df['driver_country'] = df['nationality'].map(mapping). To remove unnecessary columns with duplicated data it was determined that the 'lapt_position' and 'lapt_lap' columns held many values that were dynamic throughout the data set and not necessary for the interactive dashboard. They were then dropped by using df.drop(). To create readable columns several columns were renamed through the following fucntion: df = df.rename(columns={'results_points': 'total_results_points','race_ms': 'race_minutes','lap_ms': 'avg_lap_time',}). Which was the initial step to start converting several columns into minute-based formats. Avg_lap_time was another necessary step to ensure that the columns would not duplicate. This was done by using :

df = df.groupby(['driverId', 'dob', 'nationality', 'dob_formatted', 'raceId', 'grid',
       'results_position', 'positionText', 'positionOrder',
       'total_results_points', 'results_laps', 'fastestLap', 'rank',
       'race_minutes', 'results_fastestlaptime', 'fastestLapSpeed', 'statusId',
       'status', 'year', 'round', 'circuitId', 'races_name', 'date',
       'dstnd_points', 'dstnd_position', 'wins', 'driver_country',
       'race_country']).agg({"avg_lap_time": "mean"}).reset_index() 
       
     At the moment, race_minutes was not able to display minutes in a readable format and to remain on time and efficient with the project. 'Race_minutes' was later converted to 'race_time'. Understanding that the data frame did not include driver names a left merge was created from the drivers_namescopy.csv file passed into a data frame drivers_names which was then merged to the main df through df = df.merge(drivers_names, on='driverId', how='left'). Upon viewing the new data frame we now had 'forename', 'surname', and 'combined_name' columns. 'Forename' and 'surname' were dropped and 'combined_name' was changed to 'driver_name' and moved to the first column of the data frame using cols = [cols[-1]] + cols[:-1]. 
     
   The year column contained decimal points which were not working well in Tableau. Tableau had a lot of null values in the year column and wouldn't list the individual years. To fix this 'year' was changed to an integer data type. Once the data frame would be later uploaded in Tableau the null values could be handled by unchecking them once 'year' became a filter.
        
    Additional columns called 'winner_name' and 'winner_ratio' were later created as an additive to the data frame and the interactive dashboard. 'Winner_name' was created by using df['winner_name'] = df.loc[df.groupby(['year', 'races_name'])['results_position'].idxmin(), 'driver_name'] to properly match the winner name to the corresponding race and year. Additionally, 'win_ratio' was created by dividing the 'wins' and 'dstnd_position' columns df['win_ratio'] = df['wins'] / df['dstnd_position']. Finally, the new data frame was exported into a new CSV file called VizualizationDF.csv to prevent cross over usage between machine learning objectives and visualizations protocols.
    
    An interactive dashboard was generated using Tableau and the VisualizationDF.csv data frame to showcase various aspects of F1 racing data. The dashboard included a Chloropleth map which displayed the races' location as color on the map based on the race country, with additional information such as races name, year, and winner_name available in the pop-up details. The map was filtered using the year and winner_name, showing data for races from 2004-2022. A bar graph was created to show the maximum wins for F1 drivers, using driver name in the columns, CNT(Wins) as the rows, and filters for Driver Ids based on the sum of wins and a filter for the year. Another bar graph was used to show the average wins for drivers, using driver id on the columns and avg wins for the rows. Another bar graph was created to display drivers' qualification position and results position, using driver id as a color mark, winner_name as a detail attribute, filtered by year and winner_names, and using CNTD(Results_Positions) for columns and Races Name for rows. Finally, a bar graph was created to display the driver points earned over a season, with Driver Id as a column, SUM(Total Results Positions) as a row, and Races Name as a color markdown. The interactive dashboard was then published to a Tableau server. Using the link from the Tableau server for the F1 workbook we created an html file to display the interactive dashboard.
    
    

## Summary

By the end of the project we were able to understand that the Unsupervised Model may be able to be fine tuned for future use. This could include adding more variables to the data set or reducing it's dimensionality. In addition, we were able to cross examine the Neural Network Classifier's predictions with the dashboard by filtering the dashboard by year (2022), driver name (Charles Laclerc), and race (Bahrain Grand Prix).




## Data Sources
static data set: (https://www.kaggle.com/datasets/rohanrao/formula-1-world-championship-1950-2020)  
API for additional data pulls:
(https://theoehrly.github.io/Fast-F1/index.html)
