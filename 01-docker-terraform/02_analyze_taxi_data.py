# %%
import pandas as pd

df_tripdata = pd.read_csv('./ny_taxi_data/green_tripdata_2019-09.csv.gz', 
                          compression='gzip',
                          low_memory=False)
df_tripdata.head()
# %%
df_taxi_zone = pd.read_csv('./ny_taxi_data/taxi+_zone_lookup.csv')
df_taxi_zone.head()

# %%
# count trips on 2019-09-18
# as in start and end on the same day
tday = '2019-09-18'
df_tripdata_18 = df_tripdata[ df_tripdata["lpep_pickup_datetime"].str.contains(tday) & df_tripdata["lpep_dropoff_datetime"].str.contains(tday) ]

df_tripdata_18.head()
# %%
len(df_tripdata_18.index)
# %%
df_tripdata_max_trip = df_tripdata.query('trip_distance == trip_distance.max()')
df_tripdata_max_trip.head()

# %%
# Consider lpep_pickup_datetime in '2019-09-18' and ignoring Borough has Unknown
# Which were the 3 pick up Boroughs that had a sum of total_amount superior to 50000?
tday = '2019-09-18'
df_tripdata_18 = df_tripdata[ df_tripdata["lpep_pickup_datetime"].str.contains(tday) ]
# should join first as borough is like suburb and locationid is potentially in same suburb
df_out = pd.merge(left=df_tripdata_18, right=df_taxi_zone, 
                  left_on='PULocationID', right_on='LocationID')
df_out.head()

# %%
df_total_amount = df_out.groupby(['Borough'])['total_amount'].sum().reset_index()
df_total_amount.sort_values(ascending=False, inplace=True, by='total_amount')
df_total_amount.head()

# %%
# For the passengers picked up in September 2019 in the zone name Astoria 
# which was the drop off zone that had the largest tip? 
# We want the name of the zone, not the id.
df_trip_x = pd.merge(left=df_tripdata, right=df_taxi_zone, 
                  left_on='PULocationID', right_on='LocationID')
df_trip_x.head()

# %%
df_trip_astoria = df_trip_x[df_trip_x['Zone']=='Astoria']
df_max_tip = df_trip_astoria.query('tip_amount == tip_amount.max()')
df_max_tip.head()
# %%
df_out = df_taxi_zone[df_taxi_zone['LocationID']==132]
df_out.head()
# %%
