/*  This is a set of querries that sets up a new database called bootcamp
creates tables under bootcamp and fills the data
some of the lines correct issues of hitting execute with incorrect info or 
 or executing lines more than once
 */

-- Create database Bootcamp;
-- Use Bootcamp;

--Create table Students (
--   Id int not null primary key identity(1, 1),
--   Firstname nvarchar(30) not null,
--   Lastname nvarchar(30) not null,
--   Active bit not null default 1,
--   Birthday DateTime not null,
--   Loan decimal(8,2) 
--);

--insert into Students
--      (Firstname,Lastname,Active,Birthday,Loan)
--	  Values
--	  ('David','Thompson',1,05/21/1999,50000)

--select * from Students

--insert into Students
--      (Firstname,Lastname,Active,Birthday,Loan)
--	  Values
--	  ('Lorie','Rolfes',1,'1995-02-03 11:35:00',20000)

--select * from students

--Delete from Students 
--     Where id=7

--Update students 
--   set Birthday='2000-01-14'
--   where id=1
/*
Create table Technology (
   Id int not null primary key identity(100, 100),
   Name nvarchar(50) not null,
   PrimaryInstructor nvarchar(30) not null
);
*/

/*
Insert into Technology
       (Name,PrimaryInstructor)
	   Values ('DotNet','Greg');
*/

/*
Create table Cohort (
   Id int not null primary key identity(1,1),
   Starts DateTime null,
   Capacity int not null default 0,
   Enrolled int not null default 0,
   TechnologyId int foreign key references Technology(Id)
);

*/


/* changes loan to not null with a default of 0
update students
    Set loan = 0.00
	where loan is null;

Select * from students where loan is null;

Alter table Students
   Alter column loan decimal(8,2) not null;

   select * from Students

   Alter table Students
      add constraint df_loan default 0 for loan;


-- add column to cohort table called note
alter table cohort
    add note nvarchar(80) not null;


Alter table cohort
	   drop note;
*/