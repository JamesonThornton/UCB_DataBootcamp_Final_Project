-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/UUPnT3
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "drivers" (
    "driverId" int   NOT NULL,
    "driverRef" varchar   NOT NULL,
    "number" varchar   NOT NULL,
    "code" varchar   NOT NULL,
    -- combine forename and surname into "name"
    "forename" varchar   NOT NULL,
    "surname" varchar   NOT NULL,
    "dob" varchar   NOT NULL,
    "nationality" varchar   NOT NULL,
    "url" varchar   NOT NULL,
    CONSTRAINT "pk_drivers" PRIMARY KEY (
        "driverId"
     )
);

CREATE TABLE "status" (
    "statusId" int   NOT NULL,
    "status" varchar   NOT NULL,
    CONSTRAINT "pk_status" PRIMARY KEY (
        "statusId"
     )
);

CREATE TABLE "circuits" (
    "circuitID" int   NOT NULL,
    "circuitRef" varchar   NOT NULL,
    -- rename to circuitname
    "name" varchar   NOT NULL,
    "location" varchar   NOT NULL,
    "country" varchar   NOT NULL,
    "lat" float(64)   NOT NULL,
    "lng" float(64)   NOT NULL,
    "alt" varchar   NOT NULL,
    "url" varchar   NOT NULL,
    CONSTRAINT "pk_circuits" PRIMARY KEY (
        "circuitID"
     )
);

CREATE TABLE "const" (
    "constructorId" int   NOT NULL,
    "contructorRef" varchar   NOT NULL,
    "name" varchar   NOT NULL,
    "nationality" varchar   NOT NULL,
    "url" varchar   NOT NULL,
    CONSTRAINT "pk_const" PRIMARY KEY (
        "constructorId"
     )
);

CREATE TABLE "const_rslts" (
    "constructorResultsID" int   NOT NULL,
    "raceId" int   NOT NULL,
    "constructorID" int   NOT NULL,
    "points" float(64)   NOT NULL,
    "status" varchar   NOT NULL
);

CREATE TABLE "const_stnd" (
    "constructorStandingsId" int   NOT NULL,
    "raceId" int   NOT NULL,
    "contructorId" int   NOT NULL,
    "points" float(64)   NOT NULL,
    "position" int   NOT NULL,
    "positionText" varchar   NOT NULL,
    "wins" int   NOT NULL
);

CREATE TABLE "driver_stnd" (
    "driverStandingsId" int   NOT NULL,
    "raceId" int   NOT NULL,
    "driverId" int   NOT NULL,
    "points" float(64)   NOT NULL,
    "position" int   NOT NULL,
    "positionText" varchar   NOT NULL,
    "wins" int   NOT NULL
);

CREATE TABLE "lap_times" (
    "raceId" int   NOT NULL,
    "driverId" int   NOT NULL,
    "lap" int   NOT NULL,
    "position" int   NOT NULL,
    "time" varchar   NOT NULL,
    "milliseconds" int   NOT NULL
);

CREATE TABLE "pit_stops" (
    "raceId" int   NOT NULL,
    "driverId" int   NOT NULL,
    "stop" int   NOT NULL,
    "lap" int   NOT NULL,
    "time" varchar   NOT NULL,
    "duration" varchar   NOT NULL,
    "milliseconds" int   NOT NULL
);

CREATE TABLE "quali" (
    "qualifyId" int   NOT NULL,
    "raceId" int   NOT NULL,
    "driverId" int   NOT NULL,
    "constructorId" int   NOT NULL,
    "number" int   NOT NULL,
    "position" int   NOT NULL,
    "q1" varchar   NOT NULL,
    "q2" varchar   NOT NULL,
    "q3" varchar   NOT NULL
);

-- Free plan table limit reached. SUBSCRIBE for more.



ALTER TABLE "const" ADD CONSTRAINT "fk_const_nationality" FOREIGN KEY("nationality")
REFERENCES "drivers" ("nationality");

ALTER TABLE "const_rslts" ADD CONSTRAINT "fk_const_rslts_constructorID" FOREIGN KEY("constructorID")
REFERENCES "const" ("constructorId");

ALTER TABLE "const_rslts" ADD CONSTRAINT "fk_const_rslts_status" FOREIGN KEY("status")
REFERENCES "status" ("status");

ALTER TABLE "const_stnd" ADD CONSTRAINT "fk_const_stnd_raceId_points" FOREIGN KEY("raceId", "points")
REFERENCES "const_rslts" ("raceId", "points");

ALTER TABLE "const_stnd" ADD CONSTRAINT "fk_const_stnd_contructorId" FOREIGN KEY("contructorId")
REFERENCES "const" ("constructorId");

ALTER TABLE "driver_stnd" ADD CONSTRAINT "fk_driver_stnd_raceId_points" FOREIGN KEY("raceId", "points")
REFERENCES "const_rslts" ("raceId", "points");

ALTER TABLE "driver_stnd" ADD CONSTRAINT "fk_driver_stnd_driverId" FOREIGN KEY("driverId")
REFERENCES "drivers" ("driverId");

ALTER TABLE "driver_stnd" ADD CONSTRAINT "fk_driver_stnd_position_positionText" FOREIGN KEY("position", "positionText")
REFERENCES "const_stnd" ("position", "positionText");

ALTER TABLE "lap_times" ADD CONSTRAINT "fk_lap_times_raceId" FOREIGN KEY("raceId")
REFERENCES "const_rslts" ("raceId");

ALTER TABLE "lap_times" ADD CONSTRAINT "fk_lap_times_driverId" FOREIGN KEY("driverId")
REFERENCES "drivers" ("driverId");

ALTER TABLE "lap_times" ADD CONSTRAINT "fk_lap_times_position" FOREIGN KEY("position")
REFERENCES "const_stnd" ("position");

ALTER TABLE "pit_stops" ADD CONSTRAINT "fk_pit_stops_raceId" FOREIGN KEY("raceId")
REFERENCES "const_rslts" ("raceId");

ALTER TABLE "pit_stops" ADD CONSTRAINT "fk_pit_stops_driverId" FOREIGN KEY("driverId")
REFERENCES "drivers" ("driverId");

ALTER TABLE "quali" ADD CONSTRAINT "fk_quali_raceId" FOREIGN KEY("raceId")
REFERENCES "const_rslts" ("raceId");

ALTER TABLE "quali" ADD CONSTRAINT "fk_quali_driverId_number" FOREIGN KEY("driverId", "number")
REFERENCES "drivers" ("driverId", "number");

ALTER TABLE "quali" ADD CONSTRAINT "fk_quali_constructorId" FOREIGN KEY("constructorId")
REFERENCES "const" ("constructorId");

ALTER TABLE "quali" ADD CONSTRAINT "fk_quali_position" FOREIGN KEY("position")
REFERENCES "const_stnd" ("position");

-- Free plan table limit reached. SUBSCRIBE for more.



-- Free plan table limit reached. SUBSCRIBE for more.



