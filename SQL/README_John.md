# John Allen notes for Database process

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
