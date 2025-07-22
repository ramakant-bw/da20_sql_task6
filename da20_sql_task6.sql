
-- SQL TASK 6


--------------------------------------------------------------------------------------------------

--Creating 3 views on joins

--1.Creating view for artist and his album (Inner Join)

select * from artist limit 10;
select * from album limit 10;
select * from track limit 10;

Create View Artist_album As
	select ar.name, al.title from artist as ar 
	inner join album as al 
	on ar.artist_id = al.artist_id 
	limit 20;

select * from Artist_album

--------------------------------------------------------------------------------------------------

--2.Creating View For Customer and Customer Support Employee (Left Join)

select * from customer limit 10;
select * from employee limit 10;

Create View Customer_Care As
	select c.First_Name, c.Last_Name, c.city, e.First_Name as support_by, e.title as designation
	from customer as c
	left join employee as e
	on c.Support_Rep_id = e.Employee_id 

Select * from Customer_care

--------------------------------------------------------------------------------------------------

--3. Creating View For Customer and His Bought Track (Right Join)

select * from track limit 10;
select * from customer limit 10;

Create View Sold_track As
	select c.First_Name as customer_name, c.city, t.name as bought_track 
	from track as t
	right join customer as c 
	on t.track_id = c.customer_id

Select * from Sold_track;

--------------------------------------------------------------------------------------------------
