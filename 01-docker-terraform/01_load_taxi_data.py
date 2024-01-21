# %%
import sqlalchemy
import pandas as pd

# %%
# connect to postgres
pg_conn = sqlalchemy.create_engine(
    "postgresql://root:root@localhost/ny_taxi"
)

# %%
# load trip data
df_tripdata = pd.read_csv('./ny_taxi_data/green_tripdata_2019-09.csv.gz', 
                          compression='gzip',
                          low_memory=False)
df_tripdata.head()

# %%
# into postgres
df_tripdata.to_sql('tripdata', pg_conn)

# %%
# load taxi zone
df_taxi_zone = pd.read_csv('./ny_taxi_data/taxi+_zone_lookup.csv')
df_taxi_zone.head()

# %%
# into postgres
df_taxi_zone.to_sql('zone', pg_conn)

# %%
