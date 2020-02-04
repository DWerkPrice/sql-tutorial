Create Procedure StatusRejected
AS
BEGIN
    
    Update requests 
	   Set Status = 'REJECTED'     
	   Where Id = 1

END
Go
Exec StatusRejected;
go
Select * from Requests