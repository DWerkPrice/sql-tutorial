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

  create table Vendor (
    Id int primary key not null identity (1,1),
	Code nvarchar(30) not null unique,
	Name nvarchar(30) not null,
	Address nvarchar(30) not null,
	City nvarchar(30) not null,
    State nvarchar(30) not null,
	Zip nvarchar(5) not null,
	Phone nvarchar(12),
	Email nvarchar(255)
	);

go

 Insert into Vendor (Code, Name, Address, City,State, Zip, Phone, Email)
        values('RV','Rec Veh', '18 Happy','Irvine','CA','90215','513-555-1212', 'rv@rv.com');
 Insert into Vendor (Code, Name, Address, City,State, Zip, Phone, Email)
        values('IS','Intuitive Surgical', '8 First','Cincinnati','OH','45201','513-555-1212', 'is@is.com');
 Insert into Vendor (Code, Name, Address, City,State, Zip, Phone, Email)
        values('MX','Main X-ray', '1 Second','Chicago','IL','60615','513-555-1212', 'mx@mx.com');
 Insert into Vendor (Code, Name, Address, City,State, Zip, Phone, Email)
        values('TS','True Sales', '8 Main','Irvine','CA','90215','513-555-1212', 'ts@ts.com');
 Insert into Vendor (Code, Name, Address, City,State, Zip, Phone, Email)
        values('LV','Local Valence', '33 Edward','Irvine','CA','90215','513-555-1212', 'LV@lv.com');
Go

 select * from users;
select * from vendor; 
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