USE inventory;
create DATABASE inventory;

drop table inventory;
SELECT * from inventory;

## changing datatypes 

alter table inventory CHANGE category category VARCHAR(100);
alter table inventory CHANGE region region VARCHAR(100);
alter table inventory CHANGE demand_forecast demand_forecast DOUBLE;
alter table inventory CHANGE price price INT;
alter table inventory CHANGE weather_condition weather_condition VARCHAR(100);
alter table inventory CHANGE date date DATE;

## data cleaning 

SELECT * from inventory
WHERE NOT NULL;

SELECT isnull(price)
from inventory;

# Q1 find out second price amount of table 


SELECT max(price)as second_highest_price 
from inventory 
WHERE price NOT IN (SELECT max(price) FROM inventory);

SELECT max(price)
from inventory;


## Q2 Write an SQL Query find number of according to date is between 2022-01-02 and 2022-05-01

SELECT date , price , demand_forecast 
from inventory
WHERE date BETWEEN '2022-01-02' and '2023-05-15'
ORDER BY date ,demand_forecast ASC;


## Q3 write a SQL Query to find year from date 
CREATE VIEW vk_view as 
SELECT year(date) as year
FROM inventory;

SELECT * from vk_view WHERE year = 2023;
SELECT count(*) 
from vk_view WHERE year = 2024;

## Q4 find out first record of the table 

SELECT * from inventory WHERE date  <= '2022-01-01' AND store_id = 'S001';
CREATE VIEW demand_values as 
SELECT demand_forecast , region , 
CASE
	WHEN demand_forecast BETWEEN -10 and 100 THEN'low demand'
    when demand_forecast BETWEEN 101 and 200 then 'mid demand'
    when demand_forecast BETWEEN 201 and 300 then 'high demand'
    ELSE 'above high demand'
END as 'demand values'
from inventory
ORDER BY demand_forecast , region ASC;

SELECT * from demand_values ;

## Q5 find out first and second highest profits 

SELECT max(profits) as first_highest
from inventory;

SELECT max(profits)as second_profits from inventory 
WHERE profits NOT IN (SELECT max(profits) from inventory)

