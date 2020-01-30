/* demonstrating how to calculate customers over aggregate average sales
   using subquerries */

--Select avg(sales) from customers

--Select * from customers
  -- where sales > 59535
 
-- /* subquerry example showing all customers sales that are greater than avg(sales)
--*/

--select * from customers
  -- where sales > (select avg(sales) from customers)

 Select max(sales) from customers
         where city = 'cleveland'

select * from customers 
where Sales > (Select max(sales) from customers 
where city = 'Cleveland')