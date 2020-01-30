Select  s.Id as 'Student ID', concat(s.Firstname,' ',s.Lastname) as 'Name', m.Description as Major,
   c.id as 'Course Number', concat(c.Subject,' ',c.Section) as 'Course', concat(i.Firstname,' ',i.Lastname) as 'Professor'
   from Student s
   join StudentClassRel sc
       on s.Id = sc.StudentId
   join Class c
        on sc.ClassId = c.Id
	join Instructor i
	    on c.InstructorId = i.Id
    join Major m
	     on s.MajorId = m.Id