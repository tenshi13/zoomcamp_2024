-- uploaded the fhv 2019 data via the web_to_gcs.py
-- then create the bq table via

CREATE OR REPLACE EXTERNAL TABLE `vaulted-bit-411213.ny_taxi.fhv_tripdata`  (
    dispatching_base_num STRING,
    pickup_datetime STRING,
    dropoff_datetime STRING,
    PUlocationID STRING,
    DOlocationID STRING,
    SR_Flag STRING,
    Affiliated_base_number STRING
)
OPTIONS (
    format ="PARQUET",
    uris = ['gs://ethanhobl_zoomcamp_taxi_data/fhv/fhv_tripdata_2019-*.parquet']
);