Insert into orders (customerid,Date,Description)
   Values (2,'2020-02-01','My First individualized Order')


Insert into OrderLines (OrdersId,Product,Description,Quantity,Price)
      values (28,'Cell Phone','Iphone 8+',2,900)

Insert into OrderLines (OrdersId,Product,Description,Quantity,Price)
      values (28,'Pens','Bic multicolor',10,7.99)

Select top 2 * from Orderlines
	       order by id desc

