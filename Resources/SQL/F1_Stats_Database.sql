--
-- PostgreSQL database dump
--

-- Dumped from database version 13.7
-- Dumped by pg_dump version 13.8

-- Started on 2023-02-04 11:12:48

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 17477)
-- Name: Final_VisualizationDF; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Final_VisualizationDF" (
    "driverId" integer,
    driver_name character varying,
    dob character varying,
    nationality character varying,
    dob_formatted character varying,
    "raceId" integer,
    grid integer,
    results_position integer,
    "positionText" integer,
    "positionOrder" integer,
    total_results_points character varying,
    results_laps integer,
    "fastestLap" integer,
    rank integer,
    race_time integer,
    "results_fastestLaptime" character varying,
    "fastestLapSpeed" character varying,
    "statusId" integer,
    status character varying,
    year integer,
    round integer,
    "circuitId" integer,
    races_name character varying,
    date date,
    dstnd_points character varying,
    dstnd_position character varying,
    wins integer,
    driver_country character varying,
    race_country character varying,
    avg_lap_time character varying,
    winner_name character varying,
    win_ratio character varying,
    dstnd_points_c character varying,
    results_laps_c integer,
    wins_c integer
);


ALTER TABLE public."Final_VisualizationDF" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17453)
-- Name: VisualizationDF; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."VisualizationDF" (
    "driverId" integer NOT NULL,
    driver_name character varying NOT NULL,
    dob character varying NOT NULL,
    nationality character varying NOT NULL,
    dob_formatted character varying NOT NULL,
    "raceId" integer NOT NULL,
    grid integer NOT NULL,
    results_position integer NOT NULL,
    "positionText" integer NOT NULL,
    "positionOrder" integer NOT NULL,
    total_results_points character varying NOT NULL,
    results_laps integer NOT NULL,
    "fastestLap" integer NOT NULL,
    rank integer NOT NULL,
    race_time integer NOT NULL,
    "results_fastestLaptime" character varying NOT NULL,
    "fastestLapSpeed" character varying NOT NULL,
    "statusId" integer NOT NULL,
    status character varying NOT NULL,
    year integer NOT NULL,
    round integer NOT NULL,
    "circuitId" integer NOT NULL,
    races_name character varying NOT NULL,
    date date NOT NULL,
    dstnd_points character varying NOT NULL,
    dstnd_position character varying NOT NULL,
    wins integer NOT NULL,
    driver_country character varying NOT NULL,
    race_country character varying NOT NULL,
    avg_lap_time character varying NOT NULL,
    winner_name character varying NOT NULL,
    win_ratio character varying NOT NULL
);


ALTER TABLE public."VisualizationDF" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17466)
-- Name: career_level_aggregation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.career_level_aggregation (
    "driverId" integer,
    dstnd_points_c character varying,
    results_laps_c integer,
    wins_c integer
);


ALTER TABLE public.career_level_aggregation OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16972)
-- Name: circuits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.circuits (
    "circuitId" integer NOT NULL,
    "circuitRef" character varying NOT NULL,
    circ_name character varying NOT NULL
);


ALTER TABLE public.circuits OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17091)
-- Name: constructors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.constructors (
    "constructorId" integer NOT NULL,
    "constructorRef" character varying NOT NULL,
    constname character varying NOT NULL,
    constnationality character varying NOT NULL
);


ALTER TABLE public.constructors OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16980)
-- Name: driver_stnd; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.driver_stnd (
    "driverId" integer NOT NULL,
    "raceId" integer NOT NULL,
    dstnd_points character varying NOT NULL,
    dstnd_position character varying NOT NULL,
    wins integer NOT NULL
);


ALTER TABLE public.driver_stnd OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16958)
-- Name: drivers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drivers (
    "driverId" integer NOT NULL,
    dob character varying NOT NULL,
    nationality character varying NOT NULL,
    dob_formatted character varying
);


ALTER TABLE public.drivers OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17392)
-- Name: drivers_names; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drivers_names (
    "driverId" integer NOT NULL,
    forename character varying NOT NULL,
    surname character varying NOT NULL,
    combined_name character varying NOT NULL
);


ALTER TABLE public.drivers_names OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 17074)
-- Name: lap_times; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lap_times (
    "driverId" integer NOT NULL,
    "raceId" integer NOT NULL,
    lapt_lap integer NOT NULL,
    lapt_position character varying NOT NULL,
    lap_ms integer NOT NULL
);


ALTER TABLE public.lap_times OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17386)
-- Name: outer_join_final; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.outer_join_final (
    "driverId" integer,
    dob character varying,
    nationality character varying,
    dob_formatted character varying,
    "raceId" integer,
    grid integer,
    results_position character varying,
    "positionText" character varying,
    "positionOrder" integer,
    results_points character varying,
    results_laps integer,
    "fastestLap" character varying,
    rank character varying,
    race_ms character varying,
    results_fastestlaptime character varying,
    "fastestLapSpeed" character varying,
    "statusId" integer,
    status character varying,
    year integer,
    round integer,
    "circuitId" integer,
    races_name character varying,
    date date,
    dstnd_points character varying,
    dstnd_position character varying,
    wins integer,
    lapt_lap integer,
    lapt_position character varying,
    lap_ms integer,
    quali_position character varying
);


ALTER TABLE public.outer_join_final OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17404)
-- Name: outer_join_final_merged; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.outer_join_final_merged (
    "driverId" integer,
    dob character varying,
    nationality character varying,
    dob_formatted character varying,
    "raceId" integer,
    grid integer,
    results_position character varying,
    "positionText" character varying,
    "positionOrder" integer,
    results_points character varying,
    results_laps integer,
    "fastestLap" character varying,
    rank character varying,
    race_ms character varying,
    results_fastestlaptime character varying,
    "fastestLapSpeed" character varying,
    "statusId" integer,
    status character varying,
    year integer,
    round integer,
    "circuitId" integer,
    races_name character varying,
    date date,
    dstnd_points character varying,
    dstnd_position character varying,
    wins integer,
    lapt_lap integer,
    lapt_position character varying,
    lap_ms integer,
    quali_position character varying,
    forename character varying,
    surname character varying,
    combined_name character varying
);


ALTER TABLE public.outer_join_final_merged OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16992)
-- Name: pit_stops; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pit_stops (
    "driverId" integer NOT NULL,
    "raceId" integer NOT NULL,
    pit_lap integer NOT NULL,
    pit_ms integer NOT NULL
);


ALTER TABLE public.pit_stops OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 17044)
-- Name: quali; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quali (
    "driverId" integer NOT NULL,
    "raceId" integer NOT NULL,
    quali_position character varying NOT NULL,
    q1 character varying,
    q2 character varying,
    q3 character varying
);


ALTER TABLE public.quali OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 17097)
-- Name: races; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.races (
    "raceId" integer NOT NULL,
    year integer NOT NULL,
    round integer NOT NULL,
    "circuitId" integer NOT NULL,
    races_name character varying NOT NULL,
    date date NOT NULL
);


ALTER TABLE public.races OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 17055)
-- Name: results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.results (
    "driverId" integer NOT NULL,
    "raceId" integer NOT NULL,
    grid integer NOT NULL,
    results_position character varying,
    "positionText" character varying NOT NULL,
    "positionOrder" integer NOT NULL,
    results_points character varying NOT NULL,
    results_laps integer NOT NULL,
    "fastestLap" character varying,
    rank character varying,
    race_ms character varying,
    results_fastestlaptime character varying,
    "fastestLapSpeed" character varying,
    "statusId" integer NOT NULL
);


ALTER TABLE public.results OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17137)
-- Name: results_merged; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.results_merged (
    "driverId" integer,
    "raceId" integer,
    grid integer,
    results_position character varying,
    "positionText" character varying,
    "positionOrder" integer,
    results_points character varying,
    results_laps integer,
    "fastestLap" character varying,
    rank character varying,
    race_ms character varying,
    results_fastestlaptime character varying,
    "fastestLapSpeed" character varying,
    "statusId" integer,
    status character varying,
    year integer,
    round integer,
    "circuitId" integer,
    races_name character varying,
    date date
);


ALTER TABLE public.results_merged OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 17001)
-- Name: sprint_rslt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sprint_rslt (
    "driverId" integer NOT NULL,
    "raceId" integer NOT NULL,
    sprslt_grid integer NOT NULL,
    sprslt_position character varying,
    sprslt_points character varying NOT NULL,
    sprslt_quali_ms character varying,
    "sprslt_fastestLap" character varying,
    sprslt_fastestlaptime character varying,
    "statusId" integer NOT NULL
);


ALTER TABLE public.sprint_rslt OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 17007)
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    "statusId" integer NOT NULL,
    status character varying NOT NULL
);


ALTER TABLE public.status OWNER TO postgres;

--
-- TOC entry 3795 (class 2606 OID 16979)
-- Name: circuits pk_circuits; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.circuits
    ADD CONSTRAINT pk_circuits PRIMARY KEY ("circuitId");


--
-- TOC entry 3793 (class 2606 OID 16965)
-- Name: drivers pk_drivers; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drivers
    ADD CONSTRAINT pk_drivers PRIMARY KEY ("driverId");


--
-- TOC entry 3803 (class 2606 OID 17459)
-- Name: VisualizationDF fk_VisualizationDF_driverId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."VisualizationDF"
    ADD CONSTRAINT "fk_VisualizationDF_driverId" FOREIGN KEY ("driverId") REFERENCES public.drivers("driverId");


--
-- TOC entry 3804 (class 2606 OID 17472)
-- Name: career_level_aggregation fk_career_level_aggregation_driverId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.career_level_aggregation
    ADD CONSTRAINT "fk_career_level_aggregation_driverId" FOREIGN KEY ("driverId") REFERENCES public.drivers("driverId");


--
-- TOC entry 3796 (class 2606 OID 17018)
-- Name: driver_stnd fk_driver_stnd_driverId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_stnd
    ADD CONSTRAINT "fk_driver_stnd_driverId" FOREIGN KEY ("driverId") REFERENCES public.drivers("driverId");


--
-- TOC entry 3802 (class 2606 OID 17398)
-- Name: drivers_names fk_drivers_names_driverId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drivers_names
    ADD CONSTRAINT "fk_drivers_names_driverId" FOREIGN KEY ("driverId") REFERENCES public.drivers("driverId");


--
-- TOC entry 3801 (class 2606 OID 17080)
-- Name: lap_times fk_lap_times_driverId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lap_times
    ADD CONSTRAINT "fk_lap_times_driverId" FOREIGN KEY ("driverId") REFERENCES public.drivers("driverId");


--
-- TOC entry 3797 (class 2606 OID 17028)
-- Name: pit_stops fk_pit_stops_driverId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pit_stops
    ADD CONSTRAINT "fk_pit_stops_driverId" FOREIGN KEY ("driverId") REFERENCES public.drivers("driverId");


--
-- TOC entry 3799 (class 2606 OID 17050)
-- Name: quali fk_quali_driverId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quali
    ADD CONSTRAINT "fk_quali_driverId" FOREIGN KEY ("driverId") REFERENCES public.drivers("driverId");


--
-- TOC entry 3800 (class 2606 OID 17061)
-- Name: results fk_results_driverId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT "fk_results_driverId" FOREIGN KEY ("driverId") REFERENCES public.drivers("driverId");


--
-- TOC entry 3798 (class 2606 OID 17038)
-- Name: sprint_rslt fk_sprint_rslt_driverId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprint_rslt
    ADD CONSTRAINT "fk_sprint_rslt_driverId" FOREIGN KEY ("driverId") REFERENCES public.drivers("driverId");


--
-- TOC entry 3940 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM rdsadmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2023-02-04 11:12:53

--
-- PostgreSQL database dump complete
--

