create database Joins;

use Joins;

create table Student(
Student_id int,
Student_name varchar(50),
Course_id int null
);


insert into Student(Student_id,Student_name,Course_id)values
(1,'John',101),
(2,'Emma',102),
(3,'Raj',103),
(4,'Sara',null),
(5,'Alex',101);

select * from student;

create table courses(
Course_id int,
course_name varchar(50),
Instructor_id varchar(50)
);

insert into courses(course_id,course_name,Instructor_id)values
(101,'Data Science',1),
(102,'Machine Learning',2),
(103,'Database Systems',3),
(104,'Web development',4);

select *from courses;

create table Instructors(
Instructor_id int,
instructor_name varchar(50)
);

insert into instructors(Instructor_id,instructor_name)values
(1,'Dr. Smith'),
(2,'Dr. Miller'),
(3,'Dr. Patil'),
(4,'Dr. Brown'),
(5,'Dr. Jones');

select * from instructors;

# table join code

#1 Give all students with thier course names.
select s.student_name,c.course_name
from student s
inner join courses c
on s.course_id=c.course_id;


#2 List students enrolled in " machine learning"
select s.student_name, c.course_name
from student s
inner join courses c
on s.course_id=c.course_id
where course_name="Machine learning";

#3 Display student name , course name, and instructor name.
select s.student_name,c.course_name,i.instructor_name
from student s
inner join courses c on s.course_id = c.course_id
inner join instructors i on c.instructor_id=i.instructor_id;

#4 show instructors and corresponding students.
select s.student_name,i.instructor_name
from student s
inner join courses c on s.course_id=c.course_id
inner join instructors i on c.instructor_id=i.instructor_id;

#5 Display courses having at least one student
select c.course_name,count(s.student_id>1) as student_count
from student s 
inner join courses c on s.course_id=c.course_id
group by c.course_name
having student_count>=1;


#6 List all students with instructors whose names start with 'Dr.P'
Select s.Student_id,s.Student_name,i.Instructor_name
from Student s
inner join courses c
on s.course_id=c.course_id
inner join instructors i 
on c.Instructor_id = i.Instructor_id
where i.instructor_name like 'Dr. P%';


#7 Get all students and their course names (including those not enrolled).
select s.Student_id,s.Student_name,c.course_name
from student s
left join courses c
on s.Course_id=c.Course_id;

#8 List all courses and enrolled students ( including courses without students)
select s.student_id,s.student_name,c.course_name
from student s 
right join courses c
on s.Course_id=c.Course_id;


#9 find student who are not enrolled in any course
select s.student_name,c.course_name
from courses c
right join student s
on s.Course_id=c.Course_id
where c.course_name is null;

#10 Display all courses and instructors , even if no instructor is assingned 
select c.course_id,i.instructor_name,c.course_name 
from courses c
left join instructors i
on c.instructor_id=i.instructor_id;


#11 Show all instructors with their courses ( even if no course)
select c.instructor_id,i.instructor_name,c.course_name
from  instructors i
left join courses c
on c.instructor_id=i.instructor_id;

#12 Display students and instructors (even if no course assigned)
select s.student_name,i.instructor_name
from student s
left join courses c
on s.course_id=c.course_id
left join instructors i 
on c.instructor_id=i.instructor_id;

#13 Display all students and courses using right join 
select s.student_name,c.course_name
from courses c
right join student s
on c.course_id=s.course_id;

#14 Show all instructors and courses (ensure all courses are displayed )
select c.course_name,i.instructor_name
from courses c
right join instructors i
on c.instructor_id=i.instructor_id;


#15 Display all courses and corresponding students;
# Show NULL if no student 
select c.course_name, count(s.student_id)
from student s
right join courses c on s.course_id=c.course_id
group by course_name;

#16 Find all the instructor with students 
select i.instructor_name,s.student_name
from student s 
right join courses c on s.course_id=c.course_id
right join instructors i on c.instructor_id=i.instructor_id;

#17 List all students and instructors ( ensure all instructors are shown )
select i.instructor_name,s.student_name
from student s 
right join courses c on s.course_id=c.course_id
right join instructors i on c.instructor_id=i.instructor_id;



