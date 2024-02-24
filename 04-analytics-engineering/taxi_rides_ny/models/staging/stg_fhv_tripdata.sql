{{
    config(
        materialized='view'
    )
}}

with tripdata as 
(
  select *,
    row_number() over(partition by PUlocationID, pickup_datetime) as rn
  from {{ source('staging','fhv_tripdata') }}
  where 
    PUlocationID is not null and
    DOlocationID is not null and
    pickup_datetime like '2019-%'
)
select
    -- identifiers
    {{ dbt_utils.generate_surrogate_key(['PUlocationID', 'pickup_datetime']) }} as tripid,
    {{ dbt.safe_cast("dispatching_base_num", api.Column.translate_type("integer")) }} as Dispatching_base_number,
    {{ dbt.safe_cast("Affiliated_base_number", api.Column.translate_type("integer")) }} as Affiliated_base_number,

    -- timestamps
    cast(pickup_datetime as timestamp) as pickup_datetime,
    cast(dropoff_datetime as timestamp) as dropoff_datetime,
    
    {{ dbt.safe_cast("PUlocationID", api.Column.translate_type("integer")) }} as Pickup_locationid,
    {{ dbt.safe_cast("DOlocationID", api.Column.translate_type("integer")) }} as Dropoff_locationid,
    
    SR_Flag

from tripdata
where rn = 1

-- dbt build --select <model.sql> --vars '{'is_test_run: false}'
{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}