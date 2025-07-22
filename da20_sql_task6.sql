
-- SQL TASK 6
  -----------



--6.A Creating 3 views on joins
  -----------------------------

--1.Creating view for artist and his album (Inner Join)

Create View Artist_album As
	select ar.name, al.title from artist as ar 
	inner join album as al 
	on ar.artist_id = al.artist_id 
	limit 20;

select * from Artist_album

--------------------------------------------------------------------------------------------------

--2.Creating View For Customer and Customer Support Employee (Left Join)

Create View Customer_Care As
	select c.First_Name, c.Last_Name, c.city, e.First_Name as support_by, e.title as designation
	from customer as c
	left join employee as e
	on c.Support_Rep_id = e.Employee_id 

Select * from Customer_care

--------------------------------------------------------------------------------------------------

--3. Creating View For Customer and His Bought Track (Right Join)

Create View Sold_track As
	select c.First_Name as customer_name, c.city, t.name as bought_track 
	from track as t
	right join customer as c 
	on t.track_id = c.customer_id

Select * from Sold_track;

--------------------------------------------------------------------------------------------------



--6.B Creating 3 Views On  Where, Group By , Having , Order By
  -------------------------------------------------------------

-- 1. Creating View On Customer Who Live In 'New York' City Using - 'Where'

Create View Cust_New_york As
	Select First_name as Customer_name, City 
	From Customer
	Where City = 'New York';

Select * From Cust_New_York;

--------------------------------------------------------------------------------------------------


-- 2. Creating View For Getting Total Bill Of Customer Using - 'Group By And Order By'

Create View c_Total_bill As
	Select c.First_name, Sum(il.Unit_price) As Total_bill
	From customer as c inner join invoice_line as il
	on c.customer_id = il.invoice_id
	Group By il.Invoice_Id, c.first_name Order By Total_bill Desc;

Select * From c_Total_bill;


--------------------------------------------------------------------------------------------------


3. Creating View For Customer Who Have More Then 13$ Bill Using - 'Group By And Having'

    Select c.First_name, Sum(il.Unit_price) As Total_bill
	From customer as c inner join invoice_line as il
	on c.customer_id = il.invoice_id
	Group By il.Invoice_Id, c.first_name Having Sum(il.Unit_price) > 13;


--------------------------------------------------------------------------------------------------	



--6.C Creating 3 Views On Joins with Where, Group By, Having, Order By
  --------------------------------------------------------------------


-- 1. Creating View For Customer From 'USA' and Buy 'Walk On Water' Track - Using 'Join with Where' 

Create View Cust_USA_wow As
	Select c.first_name as customer_name, t.name as track_name, c.country 
	from customer as c 
	inner join track as t 
	on c.customer_id = t.track_id
	where c.country = 'USA' And t.name = 'Walk On Water';

Select * From Cust_USA_wow

--------------------------------------------------------------------------------------------------


-- 2. Creating View For Customer Who Buy More Then 1 Tracks Using - 'Join with Group By and Having'

Create View frequent_buyer As
	 select c.First_name as customer_name, count(t.track_id) as Total_track
	 from customer as c inner join track as t on c.customer_id = t.Track_id
	 group by customer_name 
	 having count(t.track_id) > 1;

Select * From frequent_buyer;

--------------------------------------------------------------------------------------------------	 


--3. Creating View For Top 10 Track Sold Most Using - 'Join with Group By And Order By'

Create View Top_10 As 
	Select t.name as Track_name,  count(i.invoice_line_id) as Times_sold from track as t 
	inner join invoice_line as i on t.track_id = i.track_id
	Group By t.name 
	Order BY Times_sold Desc Limit 10;

Select * From Top_10

--------------------------------------------------------------------------------------------------


-- 6. D Creating Views On Multi Join, cte, subquery 
   ------------------------------------------------

-- 1. Creating View For List Of Album Titles And The Unit Prices For The Artist "Aerosmith".

Create View Aerosmith As
	select ar.name, al.title, tr.Unit_Price from artist as ar 
	inner join album as al on ar.artist_id = al.artist_id
	inner join track as tr on al.album_id = tr.album_id
	where ar.name = 'Aerosmith';

Select * From Aerosmith


--------------------------------------------------------------------------------------------------


---2. Creating View using CTE to select all customers from the USA

Create View USA_Cust As
	WITH USACustomers AS (
		SELECT customer_id, first_name, last_name, city
		FROM customer
		WHERE country = 'USA'
	)
	SELECT customer_id, first_name, last_name, city
	FROM USACustomers;

Select * From USA_Cust

--------------------------------------------------------------------------------------------------


-- 3. Creating View using Subquery to Find Invoices for Customers in Paris


Create View Paris_invoice As	
	SELECT *
	FROM invoice
	WHERE customer_id IN (SELECT customer_id FROM customer WHERE city = 'Paris');

Select * From Paris_invoice;

--------------------------------------------------------------------------------------------------	