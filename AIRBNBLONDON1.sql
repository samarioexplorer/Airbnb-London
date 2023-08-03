SELECT * FROM LONDON

-- "Delete the unncecessary columns on the table"
Alter table LONDON drop column name;
Alter table LONDON drop column last_review;
Alter table LONDON drop column reviews_per_month;
Alter table LONDON drop column license;
Alter table LONDON drop column host_name;

-- "Let's check out for both null or blank data on the table"
SELECT *FROM LONDON WHERE price IS NULL AND TRIM(price)<>'';

-- "Let's group the table by average price and neighbourhood sorted descending"

SELECT neighbourhood, round(AVG(price), 2) as "AVG Price"
FROM LONDON
where neighbourhood is not null
GROUP BY neighbourhood
ORDER BY round(AVG(price), 2) DESC;

-- "Top 10 by reviews number"
SELECT *FROM LONDON 
where number_of_reviews is not null
ORDER BY number_of_reviews DESC
LIMIT 10;

-- "Number of Airbnbs by neighbourhood"
SELECT DISTINCT neighbourhood, COUNT(id) AS Airbnb_number
FROM LONDON 
where neighbourhood is not null
GROUP BY neighbourhood 
ORDER BY Airbnb_number DESC;

-- "Airbnb number by owner"
SELECT DISTINCT host_id, COUNT(host_id) AS Airbnb_owner
FROM LONDON 
GROUP BY host_id 
ORDER BY Airbnb_owner DESC;

-- "TOP 10 by Airbnb number and neighbourhood"
SELECT DISTINCT neighbourhood, COUNT(id) AS Airbnb_number
FROM LONDON 
where neighbourhood is not null
GROUP BY neighbourhood 
ORDER BY Airbnb_number DESC
LIMIT 10;

-- "Top 10 by Airnbnb room number"
SELECT room_type, COUNT(room_type) AS Airbnb_room_number
FROM LONDON
where room_type is not null
GROUP BY room_type 
ORDER BY airbnb_room_number DESC;

-- "Average price by room type and neighbourhood"
SELECT DISTINCT neighbourhood, room_type, round(AVG(price), 2) as "AVG Price"
FROM LONDON
where room_type is not null
GROUP BY neighbourhood, room_type 
ORDER BY round(AVG(price), 2) DESC;

-- "Average availability along the year"
SELECT DISTINCT neighbourhood, round(AVG(availability_365),2) as "Availability"
FROM LONDON 
where neighbourhood is not null
GROUP BY neighbourhood 
ORDER BY round(AVG(availability_365),2) DESC;