### Question 1. Knowing docker tags
Which tag has the following text? - Automatically remove the container when it exits
docker run --help | grep -i "Automatically remove"

--rm                             Automatically remove the container when it exits

### Question 2. Understanding docker first run
What is version of the package wheel ?
docker run -it python:3.9 bash
pip list | grep -i wheel

wheel      0.42.0


# Prepare Postgres
### Question 3. Count records
How many taxi trips were totally made on September 18th 2019?
15612

### Question 4. Largest trip for each day
Which was the pick up day with the largest trip distance Use the pick up time for your calculations.
2019-09-26 19:32:52
trip_distance = 341.64

### Question 5. The number of passengers
Consider lpep_pickup_datetime in '2019-09-18' and ignoring Borough has Unknown
Which were the 3 pick up Boroughs that had a sum of total_amount superior to 50000?
"Brooklyn" "Manhattan" "Queens"

### Question 6. Largest tip
For the passengers picked up in September 2019 in the zone name Astoria which was the drop off zone that had the largest tip? We want the name of the zone, not the id.
JFK Airport	