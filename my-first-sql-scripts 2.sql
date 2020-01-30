SELECT Id, concat(Firstname,' ',lastname) as 'Full Name', gpa, sat 
from student
where sat >= 1200
Order by lastname asc; 

SELECT * FROM student
     Where gpa < 3.0

Select * from Student
where gpa<3.00
order by sat desc;

select * from student;
select * from major;

Select student.id, concat(firstname,' ', lastname) as 'name',Sat, GPA, 
       isnull(Description,'Undecided') as 'Major', isnull(MinSat,'') as 'Min SAT Required'
	   From Student
	   left join Major 
	   on major.id=student.MajorID;


	   select * from instructor;
	   select * from class;

	   
	   Select concat(firstname,' ',lastname) as 'Instructor', Yearsexperience, c.id as 'Course Code', i.IsTenured,
	        concat(subject,' ',section) as 'Class'
	        from Instructor i
		join Class c
			     on i.Id = c.InstructorID
        Where IsTenured = 1		
		
	   	order by i.Lastname	    
			