-- querry to delete timex from order lines

select distinct(Description) from Orderlines
   --  Where Description = 'Timex'

delete from orderlines
     where ID in (select ID from Orderlines
     Where Description = 'Timex')
 