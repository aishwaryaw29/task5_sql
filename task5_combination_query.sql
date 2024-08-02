create table cars(
	make varchar(120),
	model varchar(120),	
	years int,	
	engine_size double precision not null,
	fuel_type varchar(120),
	price double precision 
)
	
copy cars from 'E:\ARC\SQL\day6\cars_2010_2020.csv' delimiter ',' csv header

select * from cars

	
--1) group cars by make, calculate min(price) where fuel_type = 'Petrol' in desc order

select make, min(price) AS min_price from cars
	  where fuel_type = 'Petrol'
	  group by make order by min(price) desc

	
--2) group cars by make and years, calculate count(model) & filter groups with count(model) > 5

select make, years, count(model) AS model_count from cars
       group by make, years
       having count(model) > 5


--3) group cars by fuel_type and years & calculate sum(price) where make = 'Audi'

select fuel_type, years, sum(price) AS total_price from cars
       where make = 'Audi'
       group by fuel_type, years


--4) group cars by make and engine_size, calculate max(price) & filter groups with max(price) > 30000

select make, engine_size, max(price) AS max_price from cars
       group by make, engine_size
       having max(price) > 30000


--5) group cars by make and years, calculate min(engine_size) where fuel_type ='Diesel'

select make, years, min(engine_size) AS min_engine_size from cars
       where fuel_type = 'Diesel'
       group by make, years


--6) group cars by model and years, calculate avg(engine_size) and filter groups with avg(engine_size) > 2.0 

select model, years, avg(engine_size) AS average_engine_size from cars
       group by model, years
       having avg(engine_size) > 2.0


--7)  group cars by fuel_type and engine_size & calculate count(distinct make) in desc order where years >= 2013

select fuel_type, engine_size, count(distinct make) AS make_count from cars
       where years >= 2013
       group by fuel_type, engine_size order by count(distinct make) desc


--8) group cars by make and fuel_type, calculate sum(price) & filter groups with sum(price) > 500000

select make, fuel_type, sum(price) AS total_price from cars 
       group by make, fuel_type
       having sum(price) > 500000


--9) group cars by model and years, calculate avg(price) and filter groups with avg(price) between 10000 and 25000

select model, years, avg(price) AS average_price from cars
       group by model, years
       having avg(price) between 10000 and 25000

	
--10)  group cars by make and fuel_type, calculate avg(price) where years > 2015 & filter groups with avg(price) > 20000

select make, fuel_type, avg(price) AS average_price from cars
       where years > 2015
       group by make, fuel_type
       having avg(price) > 20000
	






