-- determine which service had most trip in 2019 july
-- to get the trip count for 
-- yellow = 3248237
-- green  = 415408
SELECT 
  count(*),
  service_type
FROM `vaulted-bit-411213.dbt_eho.fact_trips` 
where 
  pickup_datetime >= '2019-07-01' and
  pickup_datetime < '2019-08-01'
GROUP BY 
  service_type ;

-- for fhv = 275432
SELECT count(*)
FROM `vaulted-bit-411213.dbt_eho.fact_fhv_trips`
where 
  pickup_datetime >= '2019-07-01' and
  pickup_datetime < '2019-08-01'