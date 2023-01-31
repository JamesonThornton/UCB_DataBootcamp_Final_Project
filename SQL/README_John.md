# John Allen notes for Database process

## Step 1

- Created F1_stats Quick DBD layout.
-  Assigned driverId as primary key
-  Attempted to assign raceId as a secondary primary key however, the data in the raceId column in the quali table is not unique so cannot be used as a PK
- Created PostgreSQL database in AWS
- Linked AWS with PGAdmin
- Created all tables and assigned column values with the following script:

CREATE TABLE "drivers" (
    "driverId" int   NOT NULL,
    "driver_number" varchar   NOT NULL,
    "dob" varchar   NOT NULL,
    "nationality" varchar   NOT NULL,
    CONSTRAINT "pk_drivers" PRIMARY KEY (
        "driverId"
     )
);

CREATE TABLE "quali" (
    "driverId" int   NOT NULL,
    "raceId" int   NOT NULL,
    "position" int   NOT NULL,
    "q1" varchar   NOT NULL,
    "q2" varchar   NOT NULL,
    "q3" varchar   NOT NULL
);

CREATE TABLE "circuits" (
    "circuitId" int   NOT NULL,
    "circuitRef" varchar   NOT NULL,
    "circ_name" varchar   NOT NULL,
    CONSTRAINT "pk_circuits" PRIMARY KEY (
        "circuitId"
     )
);

CREATE TABLE "driver_stnd" (
    "driverId" int   NOT NULL,
    "raceId" int   NOT NULL,
    "points" varchar   NOT NULL,
    "position" int   NOT NULL,
    "wins" int   NOT NULL
);

CREATE TABLE "lap_times" (
    "driverId" int   NOT NULL,
    "raceId" int   NOT NULL,
    "lap" int   NOT NULL,
    "position" int   NOT NULL,
    "lap_ms" int   NOT NULL
);

CREATE TABLE "pit_stops" (
    "driverId" int   NOT NULL,
    "raceId" int   NOT NULL,
    "lap" int   NOT NULL,
    "pit_ms" int   NOT NULL
);

CREATE TABLE "results" (
    "driverId" int   NOT NULL,
    "raceId" int   NOT NULL,
    "grid" int   NOT NULL,
    "position" int   NOT NULL,
    "positionText" varchar   NOT NULL,
    "positionOrder" int   NOT NULL,
    "points" varchar   NOT NULL,
    "laps" int   NOT NULL,
    "fastestLap" varchar   NOT NULL,
    "rank" int   NOT NULL,
    "race_ms" int   NOT NULL,
    "fastestLapTime" varchar   NOT NULL,
    "fastestLapSpeed" varchar   NOT NULL,
    "statusId" int   NOT NULL
);

CREATE TABLE "sprint_rslt" (
    "driverId" int   NOT NULL,
    "raceId" int   NOT NULL,
    "grid" int   NOT NULL,
    "position" int   NOT NULL,
    "points" varchar   NOT NULL,
    "quali_ms" int   NOT NULL,
    "fastestLap" varchar   NOT NULL,
    "fastestLapTime" varchar   NOT NULL,
    "statusId" int   NOT NULL
);

CREATE TABLE "status" (
    "statusId" int   NOT NULL,
    "status" varchar   NOT NULL
);

ALTER TABLE "quali" ADD CONSTRAINT "fk_quali_driverId" FOREIGN KEY("driverId")
REFERENCES "drivers" ("driverId");

ALTER TABLE "driver_stnd" ADD CONSTRAINT "fk_driver_stnd_driverId" FOREIGN KEY("driverId")
REFERENCES "drivers" ("driverId");

ALTER TABLE "lap_times" ADD CONSTRAINT "fk_lap_times_driverId" FOREIGN KEY("driverId")
REFERENCES "drivers" ("driverId");

ALTER TABLE "pit_stops" ADD CONSTRAINT "fk_pit_stops_driverId" FOREIGN KEY("driverId")
REFERENCES "drivers" ("driverId");

ALTER TABLE "results" ADD CONSTRAINT "fk_results_driverId" FOREIGN KEY("driverId")
REFERENCES "drivers" ("driverId");

ALTER TABLE "sprint_rslt" ADD CONSTRAINT "fk_sprint_rslt_driverId" FOREIGN KEY("driverId")
REFERENCES "drivers" ("driverId");


After the database, tables and columns were created I began to import the data. The first issue I ran into was an index column in the csv files. This was quickly removed and then the import process began. Below are the issues that I ran into with the import of data.

- quali table had NUL values in the q2 column. This was remedied by changing the NOT NULL value of the q1,q2,and q3 columns to NULL to allow for null values. The logic is that a driver might not have qualified in one of the 3 qualifying rounds thus all 3 should allow for NULLS for consistency to allow for future data input.

- The column race_ms in the results table contains non int values of \N. The column type was changed from INT to varchar to support this.
- The column position in the results table contains non int values of \N. The column type was changed from INT to varchar to support this.
- The column position in the sprint_rslt table contains non int values of \N. The column type was changed from INT to varchar to support this.
- The column quali_ms in the sprint_rslt table contains non int values of \N. The column type was changed from INT to varchar to support this.

After running into the position column in the two tables above containing non int values I also proceeded to update the other tables with position columns in them to be varchar using the ALTER TABLE and then ALTER COLUMN commands.

## Step 2

- Added new column dob_formatted to the drivers table to allow for a year only dob field. This required me to create the column, update the new column with the existing data from the dob column and then strip all but the last 4 digits from the data using the below command:

        update drivers set dob_formatted = SUBSTR(dob_formatted, LENGTH(dob_formatted) -3, 4);


## Step 3
After discovering an issue with using pandas to merge all available tables due to the data size maxing out memory, I decided to attempt a major table join in PostgreSQL. After some inital research I realized that PostgreSQL will not allow for multiple left joins of tables (or at least the version we are working with will not). I set out to create a process to do so with the below script:

create table large_dataset_1 as select 
		results_merged.*,
		ds."dstnd_points",
		ds."dstnd_position",
		ds."wins"
		
from results_merged
	left join driver_stnd ds
	on ds."driverId" = results_merged."driverId"
	where ds."raceId" = results_merged."raceId"




create table large_dataset_2 as select
		large_dataset_1.*,
		lt."lapt_lap",
		lt."lapt_position",
		lt."lap_ms"
		
from large_dataset_1		
left join lap_times lt
	on lt."driverId" = large_dataset_1."driverId" 
	where lt."raceId" = large_dataset_1."raceId";



create table large_dataset_3 as select
large_dataset_2.*,
		ps."pit_lap",
		ps."pit_ms"
		
from large_dataset_2	
left join pit_stops ps
	on ps."driverId" = large_dataset_2."driverId" 
	where ps."raceId" = large_dataset_2."raceId";



create table large_dataset_4 as select
large_dataset_3.*,
		q."quali_position"
		
from large_dataset_3		
	left join quali q
	on q."driverId" = large_dataset_3."driverId" 
	where q."raceId" = large_dataset_3."raceId";
	
create table temp_merged_dataset as select
large_dataset_4.*,
		sr."sprslt_grid",
		sr."sprslt_position",
		sr."sprslt_points",
		sr."sprslt_quali_ms",
		sr."sprslt_fastestLap",
		sr."sprslt_fastestlaptime"

from large_dataset_4	
	left join sprint_rslt sr
	on sr."driverId" = large_dataset_4."driverId" 
	where sr."raceId" = large_dataset_4."raceId";

drop table large_dataset_1;
drop table large_dataset_2;
drop table large_dataset_3;
drop table large_dataset_4;

select * from temp_merged_dataset

create table final_merged_table as select
drivers.*,
fmd."raceId",
fmd."grid",
fmd."results_position",
fmd."positionText",
fmd."positionOrder",
fmd."results_points",
fmd."results_laps",
fmd."fastestLap",
fmd."rank",
fmd."race_ms",
fmd."results_fastestlaptime",
fmd."fastestLapSpeed",
fmd."statusId",
fmd."status",
fmd."year",
fmd."round",
fmd."circuitId",
fmd."races_name",
fmd."date",
fmd."dstnd_points",
fmd."dstnd_position",
fmd."wins",
fmd."lapt_lap",
fmd."lapt_position",
fmd."lap_ms",
fmd."pit_lap",
fmd."pit_ms",
fmd."quali_position",
fmd."sprslt_grid",
fmd."sprslt_position",
fmd."sprslt_points",
fmd."sprslt_quali_ms",
fmd."sprslt_fastestLap",
fmd."sprslt_fastestlaptime"

from drivers	
left join final_merged_dataset fmd
	on fmd."driverId" = drivers."driverId"
    
drop temp_merged_dataset;


This allowed us to join all 12 tables into one massive data set on the driverId and raceId thus weeding out unnecessary data and creating a mostly not null set of data to work with in the machine model.

## Step 4

We determined there were too many lines being affected adversly by the pitstops and sprint tables so a decision was made to drop those two and make a new combined dataset of everything but those. This allowed us to keep 449,489 lines of data instead of dropping down to the 16,888 that combining those tables into the datset output.

## Step 5

Added a new table from the original drivers.csv that had the driverId, forename, surname and then a combined_name column concatinating the two. This will allow us to reference the drivers names in the data based of the driverId PK. This was then outerjoined into the large dataset for future use.