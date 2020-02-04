/* Querry to determine total spending across at vendors by orders
*/


Select v.Code, sum((rl.quantity) * p.Price) as 'Total' from Vendors v
    Join Products p on v.id = p.Vendorid
	Join Requestline rl on rl.ProductID = p.ID
	Group by v.Code --having v.Code = 'AMZN' allows the cut to one vendor
