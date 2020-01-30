select * from customers	
   where id = 8 or id = 11 or id =12

Select * from customers
       where charindex('bank',Name)>0

Select * from customers
	   where id in(8,11,12);

Select * from customers
	   where id in (Select Id from customers
       where charindex('bank',Name)>0 or charindex('eagle',Name)>0 or charindex('cardinal',name) >0);
