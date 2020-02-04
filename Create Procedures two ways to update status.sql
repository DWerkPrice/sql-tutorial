CREATE Procedure SetRequestStatus
    @RequestId int,
	@IsApproved bit = 1
As
BEGIN
   SET NOCOUNT ON;
   DECLARE @status nvarchar(10);
   if @IsApproved = 1
   Begin
      Set @Status = 'APPROVED';
   End
   If @IsApproved =0 
   Begin
       Set @status = 'REJECTED';
   END
   UPDATE Requests Set
	     Status = @status
	Where Id = @RequestID;
	END
	Go


Create Procedure SetRequestToApproved
      @RequestId int
AS
   BEGIN
      SET NOCOUNT ON;
	  UPDATE Requests Set 
	     Status = 'APPROVED'
		 Where Id = @RequestId;
		    
END
Go
Create Procedure SetRequestToRejected
      @RequestId int
AS
   BEGIN
      SET NOCOUNT ON;
	  UPDATE Requests Set 
	     Status = 'REJECTED'
		 Where Id = @RequestId;
		    
END
Go

select * from Requests
Exec SetRequestStatus @RequestId = 1, @IsApproved = 1