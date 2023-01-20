# Machine Learning with Formula 1 Driver Info Analysis
Using ETL, Unsupervised Machine Learning, and creating a visualization dashboard of data derived from Formula 1 Driver information to explore phenomenas within Formula 1.  

<br/>
<p align="center">Jameson Thornton, Varun Yalaka, John Allen, Maher Abdallah, Jacob Voyce, and Tyrone Fraley<br/>
UC Berkley Extension<br/>
Jan 20, 2023<br/>
<p/>

<br/>
<p align="center">
  <img width="460" height="200" src="Images/formulaonedatapoints.jpeg">
</p>
<br/>

## Project Overview

<br/>
Stretching back as far as 1946, (ESPN, N.D.); Formula One has been a single-seater racing phenomenon, with an average of 1.21 million viewers per race amongst ESPN, ESPN 2, and ABC platforms in 2021, (The Athletic Staff, 2022).Formula One leaves many fans at the edge of their seats. A whole world of viewers from all different countries, ethnical origins, and cultures united in a front to support the racing league and it's competitors. With such high stakes on the line for each driver/team including, but not limited to: technological racing enhancements rooted in prototypes, team sales growth, winning tournaments, and the safety of the drivers and the crew all on the line in an energy packed race to the finish. The average cost of a Formula One vehicle is "20.62 million", according to de Artola (N.D.).
Knowing this, one may ask themselves if data science could possibly answer questions that not only fans have, but the Formula One teams as well. Such questions  as how race outcomes could be predicted when observing the type of tire compounds vs. pit stops to change the tires, positioning on the starting line and how it could affect a driver's potential to win. Other questions regarding technological enhancements and how they contribute to a driver's capability to increase their performance and what it would look like if all drivers were compared against one another even if they have not faced each other? Questions surrounding the phenomenas might be able to be answered within the realms of Unsupervised Machine Learning. Six individuals from different professional backgrounds teamed up to possibly give the first step to answering quetions based by using historical data derived from Kaggle (https://www.kaggle.com/datasets/rohanrao/formula-1-world-championship-1950-2020) by figuring out if drivers could first be clustered using unsupervised learning. The team consists of Jameson Thornton, Varun Yalaka, John Allen, Maher Abdallah, Jacob Voyce, and Tyrone Fraley. The team will be using ETL practices through pandas and SQL to first extract and transform the table, store the tables in a SQL DB and AWS, then using pandas ML libraries through sklearn to develop unsuprvised machine learning models. Finally, the data would be visualized with matplot lib, Tableau, and HTML practices to deploy an interactive dashboard of driver data. 
 
 <br/>
 
## Collaboration and Assignment of Roles

<br/>
Initially, the team met to observe the raw data and draw possible project outlines to better explore, assess, and visualize the phenomenas presented by Formula One data. Understanding that the initial meeting was crucial to develop a project outline/scope of practice, the team created a vision for the project, team expectations, and overall best practices were established to ensure project deadlines and integrity could be viable. During the data exploration phase, fourteen csv files were compiled into a data frame amassing a total of 1554 rows to meet saturation for the machine learning model. According to Faulkner, 2017, "Saturation means that a researcher can be reasonably assured that further data collection would yield similar results and serve to confirm emerging themes and conclusions." Amongst the realms of unsupervised machine learning reaching saturation is important. At times when working with machine learning models, one may start out with 1,000 data points and it may go the right direction; however, at times 1,000,000 data points may not be sufficient for the model (Dr. Steeger, N.D.). To call functions and pull data for the analysis the team agreed on a Formula One API (https://theoehrly.github.io/Fast-F1/index.html). The next step in the collaboration process was to design an outline of the project, time lines, roles, and deliverables. The outline of the project would include ETL, assign databases using PostgreSQL and AWS, develope an unsupervised machine learning model (K-means clustring), and finally create visualizations using Tableau. The team assignments are listed below; however, at times each team member would volunteer to assist in all roles they were not assigned in an effort to meet project deadlines.

* Project Roles:
    * ETL: Jacob Voyce and Jameson Thornton
    * Database: John Allen
    * Unsupervised Machine Learning: Varun Yalaka and Maher Abdhallah
    * Visualization: Tyrone Fraley, Jacob Voyce, and John Allen
    * Project Manager: John Allen
    * Technical Written Report: Tyrone Fraley 

## ETL






## Data Sources
static data set: (https://www.kaggle.com/datasets/rohanrao/formula-1-world-championship-1950-2020)  
API for additional data pulls:
(https://theoehrly.github.io/Fast-F1/index.html)


<br/>
## References:
<br/>
ESPN. (N.D.). A timeline of Formula One. http://en.espn.co.uk/f1/motorsport/story/3836.html
The Athletic Staff. (N.D.). Formula One viewership: 2022 season sets U.S. record, viewership up 34% among women. theathletic.com. https://theathletic.com/3924843/2022/11/23/formula-1-viewership-2022/
de Artola, A. (N.D.). How Much Does an F1 Car Cost?. fansided.com. https://fansided.com/2022/04/04/f1-car-cost-how-much/
Faulkner, S. (2017). Data Saturation. https://doi.org/10.1002/9781118901731.iecrm0060
Steeger, D. (N.D.). Machine learning: How much data do learning methods require?. nordantech.com. https://www.nordantech.com/en/blog/data-science/machine-learning#:~:text=But%20the%20rule%20is%3A%20You,feeling%20for%20the%20data%20structure.
