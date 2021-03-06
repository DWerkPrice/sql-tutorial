USE [testcapstone]
GO
/****** Object:  StoredProcedure [dbo].[UpdateRequestTotal]    Script Date: 2/4/2020 12:10:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[UpdateRequestTotal]
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