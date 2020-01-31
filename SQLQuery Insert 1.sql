-- sql order inserting new orders


Insert into orders (Customerid,Date, Description)
    Values (1,'2020-02-01','My first inserted order');



Select * from orders where id =(select max(id) from orders)

Insert into OrderLines(OrdersId, Product, Description, Quantity, Price)
      values (27,'Echo','Amazon Echo',3,99.99);
Insert into OrderLines(OrdersId, Product, Description, Quantity, Price)
      values (27,'Echodot','Amazon Echo Dot',5,39.99);






Select top 2 * from orders
   order by id desc

Select top 2 * from Orderlines
   order by id desc