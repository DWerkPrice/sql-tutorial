-- reduces price for best customers over $90000 in sales prices by 10%



Update Orderlines Set
   Price = Price * 0.9
   Where id in(
   Select Ol.id  
       from customers c
	   join orders o
	      on c.id = o.customerid
       join orderlines ol 
	      on ol.ordersid = o.id
	   where c.sales > 90000
	   

	  