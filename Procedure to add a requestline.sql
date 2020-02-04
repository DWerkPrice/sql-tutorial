--  procedure to add a requestline record

Alter Procedure AddLineItem
    @RequestDescription nvarchar(30), 
	@ProductPartnbr nvarchar(30),
	@Quantity int = 1
As 
Begin
    SET NOCOUNT ON;
	DECLARE @RequestId int, @ProductId int;
    SELECT @RequestID = ID from Requests Where Description = @RequestDescription;
	SELECT @ProductId = Id from Products Where PartnBr = @ProductPartNbr;
	Insert into Requestline (Requestid, ProductId, Quantity)
	     Values (@RequestId, @ProductId, @Quantity);
End
Go 
Exec AddLineItem @RequestDescription='1st Request',@ProductPartnbr='WORD';
Go
Select * from RequestLine where RequestId = 1