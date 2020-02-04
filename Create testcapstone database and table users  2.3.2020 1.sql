/*
this query creates user and vendor files for capstone project
*/

use Master;
 go
 drop database if exists testcapstone
 go
  create database testcapstone
 go
 use testcapstone
 go
 create table users (
    Id int primary key not null identity (1,1),
	Username nvarchar(30) not null unique,
	Password nvarchar(30) not null,
	Firstname nvarchar(30) not null,
	Lastname nvarchar(30) not null,
    Phone nvarchar(12) not null,
	email nvarchar(255) not null,
	IsAdmin bit not null default 0,
	IsReviewer bit not null default 0
 );
 Go
 Insert into Users (Username, Password, Firstname, Lastname, Phone, Email, IsAdmin, IsReviewer)
        values('sa','sa', 'System', 'Adnmin','513-555-1212', 'sys@admin.com', 1,1);
 Insert into Users (Username, Password, Firstname, Lastname, Phone, Email, IsReviewer)
        values('rv','rv', 'System','Reviewer','513-555-1212', 'sys@reviewer.com', 1);
 Insert into Users (Username, Password, Firstname, Lastname, Phone, Email)
        values('us','us', 'System','User','513-555-1212', 'sys@user.com');
 go

  create table Vendors (
    Id int primary key not null identity (1,1),
	Code nvarchar(30) not null unique,
	Name nvarchar(30) not null,
	Address nvarchar(30) not null,
	City nvarchar(30) not null,
    State nvarchar(2) not null,
	Zip nvarchar(5) not null,
	Phone nvarchar(12),
	Email nvarchar(255)
	);
go


    
 Insert into Vendors (Code, Name, Address, City,State, Zip, Phone, Email)
        values('AMZN','Amazon', '1 Cadabran','Seatle','WA','90215','513-555-1212', 'sales@amazon.com');
 Insert into Vendors (Code, Name, Address, City,State, Zip, Phone, Email)
        values('MSFT','Microsoft', '8 First','Seattle','WA','45201','513-555-1212', 'sales@microsoft.com');
 Insert into Vendors (Code, Name, Address, City,State, Zip, Phone, Email)
        values('MX','Main X-ray', '1 Second','Chicago','IL','60615','513-555-1212', 'mx@mx.com');
 Insert into Vendors (Code,  Name, Address, City,State, Zip, Phone, Email)
        values('TS','True Sales', '8 Main','Irvine','CA','90215','513-555-1212', 'ts@ts.com');
 Insert into Vendors(Code, Name, Address, City,State, Zip, Phone, Email)
        values('LV','Local Valence', '33 Edward','Irvine','CA','90215','513-555-1212', 'LV@lv.com');
Go

Create table Products(
    Id int primary key not null identity(1,1),
	PartNbr nvarchar(30) not null Unique,
	Name nvarchar(30) not null,
	Price decimal(11,2),
    Unit nvarchar(30),
	PhotoPath nvarchar(255) null,
	Vendorid int not null foreign key references products(id)
);
Go
Insert into Products (PartNbr, Name, Price, Unit, VendorID)
   values ('ECHO', 'Amazon Echo', 99.99, 'Each', (Select id from Vendors where code = 'AMZn'));
Insert into Products (PartNbr, Name, Price, Unit, VendorID)
   values ('ECHODOT', 'Amazon Echo Dot', 39.99, 'Each', (Select id from Vendors where code = 'AMZN'));
Insert into Products (PartNbr, Name, Price, Unit, VendorID)
   values ('WORD', 'Microsoft WORD', 119.99, 'Each', (Select id from Vendors where code = 'MSFT'));
Insert into Products (PartNbr, Name, Price, Unit, VendorID)
   values ('EXCEL', 'Microsoft Excel', 119.99, 'Each', (Select id from Vendors where code = 'MSFT'));
Insert into Products (PartNbr, Name, Price, Unit, VendorID)
   values ('PWPT', 'Microsoft POWERPOINT', 119.99, 'Each', (Select id from Vendors where code = 'MSFT'));


go

Create Table Requests (
    Id int primary key not null identity(1,1),
	Description nvarchar(80) not null,
	Justification nvarchar(80) not null,
	RejectionReason nvarchar(80) null,
	DeliveryMode nvarchar(20) not null default 'Pickup',
	Status nvarchar(10) not null default 'NEW',
	Total decimal(11,2) not null default 0,
	UserId int not null foreign key references Users(ID)
);
  
	

Insert into Requests (Description,Justification,UserId)
   Values ('1st Request','None needed',(Select Id from Users where Username = 'us'));
Insert into Requests (Description,Justification,UserId)
   Values ('2nd Request','None needed',(Select Id from Users where Username = 'us'));
Insert into Requests (Description,Justification,UserId)
   Values ('3rd Request','None needed',(Select Id from Users where Username = 'rv'));
       
go

Create table Requestline (
   Id int not null primary key identity(1,1),
   RequestID int not null foreign key references Requests(id),
   ProductID int not null foreign key references Products(id),
   Quantity int not null check (Quantity>0) default 1
);

Insert into Requestline (RequestID,ProductID,Quantity)
    Values (1, 1, 1);
Insert into Requestline (RequestID,ProductID,Quantity)
    Values (1, 2, 1);
Insert into Requestline (RequestID,ProductID,Quantity)
    Values (3, 4, 4);
Go

select * from requests
select * from products
Select * from Requestline

--Select * (p.Price*rl.Quantity) as Total from Requests r
/*Select r.ID, (rl.quantity*p.Price) as total from Requests r
   Join Requestline rl on rl.RequestId = r.Id
   Join Products p on rl.Productid = p.id

Update Requests r
    Set r.Total = Total
	from (Select r.ID, (rl.quantity*p.Price) as total from Requests r
   Join Requestline rl on rl.RequestId = r.Id
   Join Products p on rl.Productid = p.id)
   Where r.Id = r.ID

Update requests 
   set Total = p.Price * rl.Quantity
   where Id=rl.RequestId in (Select * from Requests r
   Join Requestline rl on rl.RequestId = r.Id
   Join Products p on rl.Productid = p.id)

--Select * from Products p 
--    join Requestline rl on rl.ProductID = p.ID


--select * from users;
--select * from vendor; 
 /*Create database Capstone
 Go
 Create table Users (
    Id int not null primary key identity(1,1),
    Username nvarchar(30) not null,
	Password nvarchar(30) not null,
	Firstname nvarchar(30) not null,
    Lastname nvarchar(30) not null,
    Phone nvarchar(12),
	Email nvarchar(255),
	IsReviewer bit not null default 0,
	IsAdmin bit not null default 0
);

Select * from users



Insert into Users
    (Username,Password,Firstname,Lastname,Phone,Email,IsReviewer,IsAdmin)
	Values
	('Pricebill','2222','Bill','Price','513-451-5555','bprice@gmail.com',1,1);
	Insert into Users
    (Username,Password,Firstname,Lastname,Phone,Email,IsReviewer,IsAdmin)
	Values
	('Rolfesmike','9375','Mike','Rolfes','513-555-5555','mrolfes@mail.com',0,0);
Insert into Users
    (Username,Password,Firstname,Lastname,Phone,Email,IsReviewer,IsAdmin)
	Values
	('Stevensjudy','1111','Judy','Stevens','513-855-7777','jstevens@hotmail.com',1,1);
	*/



	-- Calculate Total for Request
	*/
Select p.name, rl.Quantity, p.Price, (rl.Quantity * p.price) as 'Line Total'
	   From Requests r
	     join Requestline rl
		    on rl.RequestID =r.Id
         join Products p
		    on p.id = rl.ProductId
			Where r.Description = '1st Request'

Select sum(rl.Quantity * p.price) as 'Request Total'
	   From Requests r
	     join Requestline rl
		    on rl.RequestID =r.Id
         join Products p
		    on p.id = rl.ProductId
			Where r.Description = '1st Request'

---calculate total

DECLARE @requestId int = 1;

Update Requests 
   Set Total= (
   Select sum(rl.Quantity * p.price) as 'Request Total'
	   From Requests r
	     join Requestline rl
		    on rl.RequestID =r.Id
         join Products p
		    on p.id = rl.ProductId
			Where r.ID = @requestID
)
   Where id=@RequestId;
Go


Select * from Requests



