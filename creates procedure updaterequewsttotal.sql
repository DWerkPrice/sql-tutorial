CREATE Procedure UpdateRequestTotal
   @RequestId int
AS
BEGIN

---calculate total
   SET NOCOUNT ON
	Update Requests Set
	   Total= (
		  Select sum(rl.Quantity * p.price) as 'Request Total'
			 From Requests r
			   join Requestline rl
				  on rl.RequestID =r.Id
			   join Products p
				  on p.id = rl.ProductId
				  Where r.ID = @requestID
	   )
	   Where id=@RequestId;
END
Go


Select * from Requests



