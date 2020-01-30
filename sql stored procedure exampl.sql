--select * from Customers where city ='Cincinnati' and
--sales  between 40000 and 70000;

--declare @city varchar(30) = 'Cincinnati';
--declare @lowsales decimal(8,2) = 40000;
--declare @highsales decimal (8,2) =70000;

--set @lowsales = 40000;
--set @highsales = 70000;

--select * from Customers where city =@city and
  --        sales  between @lowsales and @highsales

--declare @city varchar(30) = 'Columbus';
--declare @lowsales decimal(8,2) = 30000;
--declare @highsales decimal (8,2) =80000;

--set @lowsales = 40000;
--set @highsales = 70000;

--select * from Customers where city =@city and
  --        sales  between @lowsales and @highsales

alter procedure SalesRangeByCity 
   @city varchar(30) = 'Cleveland',
   @lowsales decimal(8,2) = 30000,
   @highsales decimal (8,2) = 85000
as
BEGIN

   select * from Customers
       where city =@city and
             sales  between @lowsales and @highsales
END