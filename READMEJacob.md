# My notes for consideration of progress and awareness of group motion.

## Week 1

>Class 1.  
* Decided to go with F1 data. 
* Decided on some functional foci/roles for each.  
* Decided to consider an unsupervised machine learning model to cluster drivers.

>Class 2. 
* Worked out issues with Github branch practices
* Agreed to go foward with simplifying dataset to usable/meaninful columns in tables with driverId in them
* Planned to move to Tabelau visualization

>Looking forward.
* Preparing for deeper ETL process in week 2 to get solid merged df for ml model.

## Week 2

>Class 3.
* Discussed and clarified issues with working tree in repository
* Agreed on presentation tool (prezi)
* Reviewed the database in postgres and its ERD
* Clarified the overarching "question" as more open-ended with clustering (not predictions), but to include investigating the clusters
* Looked at a few more mockups of clustering algorithms (with pca, with dendogram, with/without various modifications to features)
* Decided to meet up midweek to work in google colab on the pipeline that:
    a. pulls directly from database tables (rather than other csv folders)
    b. uses tables with distinct column names where information is different but names the same in different tables
    c. can merge/join tables without significant loss of rows (i.e. left or outer instead of inner)
    d. possibly adds to existing tables by merging in other reference csvs that were not formerly included from the flat files

>Class 4.
* Reviewed completed merged table from database
    a. considered shape and presence of nulls
    b. planned for next steps on features (numerics, encoding, reduction, etc.)
    c. discussed status/outlook of each team member
    d. planned the remaining meetings to keep us on track for completion
* Some collaborative analysis of resulting column info, decided to hold pending logic for ml model to cluster first
* Reviewed readme and need for clarity/coordination in project steps
* Submitted first sketch of project checkpoint

>Looking forward
* Preparing for robust final decisions on clustering algorithm in shared collab notebook and what steps preceed it and proceed from it.

## Week 3


