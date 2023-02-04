-- Created by John Allen for F1 Data Analysis Final Project

CREATE TABLE outer_join_1 AS select
		results.*,
		status."status"

from results
	full outer join status
	on status."statusId" = results."statusId";


create table outer_join_2 as select
		outer_join_1.*,
		races."year", 
		races."round",
		races."circuitId",
		races."races_name",
		races."date"

from outer_join_1
	full outer join races
	on races."raceId" = outer_join_1."raceId";


create table outer_join_3 as select 
		outer_join_2.*,
		ds."dstnd_points",
		ds."dstnd_position",
		ds."wins"
		
from outer_join_2
	full outer join driver_stnd ds
	on ds."driverId" = outer_join_2."driverId"
	where ds."raceId" = outer_join_2."raceId";




create table outer_join_4 as select
		outer_join_3.*,
		lt."lapt_lap",
		lt."lapt_position",
		lt."lap_ms"
		
from outer_join_3		
full outer join lap_times lt
	on lt."driverId" = outer_join_3."driverId" 
	where lt."raceId" = outer_join_3."raceId";



create table outer_join_temp as select
outer_join_4.*,
		q."quali_position"
		
from outer_join_4		
	full outer join quali q
	on q."driverId" = outer_join_4."driverId" 
	where q."raceId" = outer_join_4."raceId";
	


drop table outer_join__1;
drop table outer_join_2;
drop table outer_join_3;
drop table outer_join_4;

select * from outer_join_temp

create table outer_join_final as select
drivers.*,
of."raceId",
of."grid",
of."results_position",
of."positionText",
of."positionOrder",
of."results_points",
of."results_laps",
of."fastestLap",
of."rank",
of."race_ms",
of."results_fastestlaptime",
of."fastestLapSpeed",
of."statusId",
of."status",
of."year",
of."round",
of."circuitId",
of."races_name",
of."date",
of."dstnd_points",
of."dstnd_position",
of."wins",
of."lapt_lap",
of."lapt_position",
of."lap_ms",
of."quali_position"

from drivers	
full outer join outer_join_temp of
	on of."driverId" = drivers."driverId"