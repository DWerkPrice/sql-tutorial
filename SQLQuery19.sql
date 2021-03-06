USE [testcapstone]
GO
/****** Object:  StoredProcedure [dbo].[SetRequestStatus]    Script Date: 2/4/2020 3:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[SetRequestStatus]
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

	
