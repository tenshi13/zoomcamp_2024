-- Q3 count records
select count(*) from tripdata
where 
lpep_pickup_datetime like '2019-09-18%' and 
lpep_dropoff_datetime like '2019-09-18%';

-- Q4 Largest trip for each day
select lpep_pickup_datetime, trip_distance  from tripdata
where
trip_distance = (
	select max(trip_distance) from tripdata
)
limit 5

-- Q5 Three biggest pick up Boroughs
with day_09_08 as(
	select 
	td."lpep_pickup_datetime",
	td."PULocationID",
	td."total_amount",
	z."Borough",
	z."Zone"
	from tripdata as td
		left join zone as z on (td."PULocationID"=z."LocationID")
	where
		td."lpep_pickup_datetime" like '2019-09-18%'
)
select
"Borough",
sum("total_amount") as "tamount"
from day_09_08 dd
group by "Borough"
order by "tamount" desc

-- Question 6. Largest tip
with source_data as(
	select 
	td."PULocationID",
	sz."Zone" as "szone",
	td."DOLocationID",
	dz."Zone" as "dzone",
	td."tip_amount"
	from tripdata as td
		left join zone as sz on (td."PULocationID"=sz."LocationID")
		left join zone as dz on (td."DOLocationID"=dz."LocationID")
	where
		sz."Zone" like 'Astoria'
)
select 
"dzone",
max("tip_amount") as "zone_tip"
from source_data
group by "dzone"
order by "zone_tip" desc