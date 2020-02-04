Create Procedure GetAllRequests
AS
BEGIN
   Set nocount on
   DECLARE cur cursor for
        SELECT Id from Requests;
   DECLARE @id int;
   OPEN cur;

   FETCH NEXT from cur Into @id;
   WHILE @@FETCH_STATUS = 0
   BEGIN
	  -- other statements go here
	     PRINT 'Request id is ' + CAST(@id as nvarchar(10));
	     FETCH NEXT from cur into @id;
   END
   Close cur;


END
Go
Exec GetAllRequests;
go