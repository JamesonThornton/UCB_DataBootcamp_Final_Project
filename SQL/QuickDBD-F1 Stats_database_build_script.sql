-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/UUPnT3
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


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
    "position" varchar   NOT NULL,
    "q1" varchar   NULL,
    "q2" varchar   NULL,
    "q3" varchar   NULL
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
    "position" varchar   NOT NULL,
    "wins" int   NOT NULL
);

CREATE TABLE "lap_times" (
    "driverId" int   NOT NULL,
    "raceId" int   NOT NULL,
    "lap" int   NOT NULL,
    "position" varchar   NOT NULL,
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
    "position" varchar   NOT NULL,
    "positionText" varchar   NOT NULL,
    "positionOrder" int   NOT NULL,
    "points" varchar   NOT NULL,
    "laps" int   NOT NULL,
    "fastestLap" varchar   NOT NULL,
    "rank" varchar   NOT NULL,
    "race_ms" varchar   NOT NULL,
    "fastestLapTime" varchar   NOT NULL,
    "fastestLapSpeed" varchar   NOT NULL,
    "statusId" int   NOT NULL
);

CREATE TABLE "sprint_rslt" (
    "driverId" int   NOT NULL,
    "raceId" int   NOT NULL,
    "grid" int   NOT NULL,
    "position" varchar   NOT NULL,
    "points" varchar   NOT NULL,
    "quali_ms" varchar   NOT NULL,
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

