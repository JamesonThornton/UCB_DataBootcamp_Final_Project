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
    * circuts
    * driver_stnd
    * drivers
    * lap_times
    * pit_stops
    * quali
    * results
    * sprint_rslt
    * status
    * results_merged






## Data Sources
static data set: (https://www.kaggle.com/datasets/rohanrao/formula-1-world-championship-1950-2020)  
API for additional data pulls:
(https://theoehrly.github.io/Fast-F1/index.html)


<br/>
## References:
<br/>



