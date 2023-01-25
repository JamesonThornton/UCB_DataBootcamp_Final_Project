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
Knowing this, one may ask themselves if data science could possibly answer questions that not only fans have, but the Formula One teams as well. Such questions  as how race outcomes could be predicted when observing the type of tire compounds vs. pit stops to change the tires, positioning on the starting line and how it could affect a driver's potential to win. Other questions regarding technological enhancements and how they contribute to a driver's capability to increase their performance and what it would look like if all drivers were compared against one another even if they have not faced each other? Questions surrounding the phenomenas might be able to be answered within the realms of Unsupervised Machine Learning. Using historical data derived from Kaggle (https://www.kaggle.com/datasets/rohanrao/formula-1-world-championship-1950-2020), six individuals from different professional backgrounds teamed up to provide the first step to answering: how would an unsupervised machine learning model classify Formula One drivers based on several features of driver, constructor and race data? Further, what would the produced classifications show about different aspects, experiences, or performances of Formula One drivers from the empirical data set? The team consists of Jameson Thornton, Varun Yalaka, John Allen, Maher Abdallah, Jacob Voyce, and Tyrone Fraley. The team will be using ETL practices through pandas and SQL to first extract and transform the table, store the tables in a SQL DB and AWS, then using pandas ML libraries through sklearn to develop unsuprvised machine learning models. Finally, the data would be visualized with matplot lib, Tableau, and HTML practices to deploy an interactive dashboard of driver data. 
 
 <br/>
 
## Collaboration and Assignment of Roles

<br/>
Initially, the team met to observe the raw data and draw possible project outlines to better explore, assess, and visualize the phenomenas presented by Formula One data. Understanding that the initial meeting was crucial to develop a project outline/scope of practice, the team created a vision for the project, team expectations, and overall best practices were established to ensure project deadlines and integrity could be viable. During the data exploration phase, fourteen csv files were compiled into a data frame amassing a total of 1554 rows to meet saturation for the machine learning model. According to Faulkner, 2017, "Saturation means that a researcher can be reasonably assured that further data collection would yield similar results and serve to confirm emerging themes and conclusions." Amongst the realms of unsupervised machine learning reaching saturation is important. At times when working with machine learning models, one may start out with 1,000 data points and it may go the right direction; however, at times 1,000,000 data points may not be sufficient for the model (Dr. Steeger, N.D.). The next step in the collaboration process was to design an outline of the project, time lines, roles, and deliverables. The outline of the project would include ETL, assign databases using PostgreSQL and AWS, develope an unsupervised machine learning model (K-means clustring), and finally create visualizations using Tableau. The team assignments are listed below; however, at times each team member would volunteer to assist in all roles they were not assigned in an effort to meet project deadlines.

* Project Roles:
    * ETL: Jacob Voyce and Jameson Thornton
    * Database: John Allen
    * Unsupervised Machine Learning: Varun Yalaka and Maher Abdallah
    * Visualization: Tyrone Fraley, Jacob Voyce, and John Allen
    * Project Manager: John Allen
    * Technical Written Report: Tyrone Fraley 
    
* Tools:
    * Pandas
    * PostgreSQL
    * Amazon RDS
    * Jupyter Notebook
    * Google Colab

## ETL

<br/>
The initial phase of the analysis involved implementing ETL (Extract, Transform, Load) procedures using tools such as pandas, PostgreSQL, and Amazon RDS. The process began by extracting data from the Kaggle dataset, subsequently, it was cleaned and transformed using the capabilities of pandas. The cleaned data was then exported as separate data frames in CSV format. These data frames were then imported into tables within Amazon RDS, utilizing PostgreSQL to ensure data integrity and ease of access. Careful execution of each task was crucial to guarantee that the data sets were accurate, dependable, and readily available through the database.

## Unsupervised Machine Learning Models

<br/>

The mission for this project was to employ unsubervised machine learning models to classify Formula One drivers established amongst several features of driver, constructor, and race data. To effectively execute the team's objective, the team utilized Google Colab as the primary base for developing and implementing the models. With the use of K-means and Hierarchal Clustering Analysis (HCA) the team could cluster the data and reveal patterns based on driver performance and race results. K-means will be usefull in this process due to it's ability to scale expansive data sets, (Google, 2022). Hierarchical clustering (HCA) allows an comprehensible data clusterization that produces a dendragram to help understand the large concepts within the data, (Dotactiv Team, 2020). Utilizing Google Colab, the team could collaborate and share their work effortlessly, while maintaining access to powerful tools and resources for machine learning. The goal of this project was to expand knowledge surrounding different aspects, experiences, or performances of Formula One drivers by recognizing patterns and trends from the data which would then be classified into various clusters with the help of K-means and HCA algorithms.

## Visualization in Tableau

<br/>

For vizualization purposes, the team utilized Tableau in tandem with Python to develop an HCA model to display the results from the Formula One drivers set. Visualizing the results required the team to use several key features within Tableau, such features as: Scatter Plots, Heat Maps, Parallel Coordinates, Choropleth Maps, and Cluster Maps. Using these visualizations gave the team the capability of recognizing patterns and trends in the data, and gain insights into different aspects, experiences of performances of the Formula One drivers. For example, the team developed scatter plots to visualize the interrelationship between different features, such as race results and driver performance, and heat maps to shed light on the density of data points in different sections of the scatter plot. In addition, the team employed parallel coordinates to display the relationship amongst the multitude of features, and choropleth maps to present the geographic distribution of the data. The final step was for the team to develop cluster maps to visualize the results of the HCA model and discover patterns within the data through displaying how drivers gained classification based on various features. Such usage of Tableau and Python paved the way for the team to create a powerful comprehensible story through visualization to reveal exciting awareness of phenomenas in the Formula One driver data.


## Contributions to Research



## Results


## Summary



## Data Sources
static data set: (https://www.kaggle.com/datasets/rohanrao/formula-1-world-championship-1950-2020)  



<br/>
## References:
<br/>

ESPN. (N.D.). A timeline of Formula One. http://en.espn.co.uk/f1/motorsport/story/3836.html
The Athletic Staff. (N.D.). Formula One viewership: 2022 season sets U.S. record, viewership up 34% among women. theathletic.com. https://theathletic.com/3924843/2022/11/23/formula-1-viewership-2022/
de Artola, A. (N.D.). How Much Does an F1 Car Cost?. fansided.com. https://fansided.com/2022/04/04/f1-car-cost-how-much/
Faulkner, S. (2017). Data Saturation. https://doi.org/10.1002/9781118901731.iecrm0060
Steeger, D. (N.D.). Machine learning: How much data do learning methods require?. nordantech.com. https://www.nordantech.com/en/blog/data-science/machine-learning#:~:text=But%20the%20rule%20is%3A%20You,feeling%20for%20the%20data%20structure.
Google. (2022). k-Means Advantages and Disadvantages. https://developers.google.com/machine-learning/clustering/algorithm/advantages-disadvantages.
Dotactiv Team. (2020).  Is Hierarcical Clusturing Worth Pursuing?. https://www.dotactiv.com/blog/is-hierarchical-clustering-worth-pursuing#:~:text=The%20advantage%20of%20hierarchical%20clustering,the%20groups%20in%20your%20data. 
