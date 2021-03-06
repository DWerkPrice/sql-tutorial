USE [testcapstone]
GO
/****** Object:  StoredProcedure [dbo].[GetAllRequests]    Script Date: 2/4/2020 12:00:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[GetAllRequests]
AS
BEGIN
   Set nocount on
   DECLARE cur cursor for
        SELECT distinct r.Id from Requests r
		     join RequestLine rl
			     on r.id = rl.Requestid
   DECLARE @id int;
   OPEN cur;

   FETCH NEXT from cur Into @id;
   WHILE @@FETCH_STATUS = 0
   BEGIN
	  -- other statements go here
	     PRINT 'Request id is ' + CAST(@id as nvarchar(10));
	     EXEC UpdateRequestTotal @id;
		 FETCH NEXT from cur into @id;
   END
   Close cur;
   DEALLOCATE cur;
 END
 go
 Exec Getallrequests

