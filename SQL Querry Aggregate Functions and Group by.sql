select sum(sales) as 'Total sales for Cincy & Cle',
       max(sales) as 'Highest sales',
	   min(sales) as 'Lowest sales',
	   avg(sales) as 'Average sales',
	   count(id) as 'Number of Customers'
	   from customers
  where city = 'Cincinnati' or city = 'Cleveland' 

  -- order by sales desc;

  select city, sum(sales) as 'Total sales' 
     from customers
--    where sales > 50000
	group by city
	having sum(sales)>600000
--	order by sales desc;