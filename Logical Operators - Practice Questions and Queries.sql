create database company;

use company;

create table employees (
  id int primary key,
  name varchar(50),
  department varchar(20),
  salary int,
  experience int
);

insert into employees (id, name, department, salary, experience) values
(1,'Amit','IT',65000,6),
(2,'Neha','HR',48000,4),
(3,'Rahul','Finance',52000,8),
(4,'Sneha','Marketing',28000,2),
(5,'Arjun','Sales',42000,11),
(6,'Priya','IT',39000,1),
(7,'Karan','HR',31000,3),
(8,'Divya','Finance',60000,5),
(9,'Mohan','Sales',23000,9),
(10,'Rohan','IT',45000,7);

select * from employees;

#Q1. Find employees whose salary is greater than 50000 and experience is more than 5 years.
select * from employees
where salary > 50000 and experience > 5;

#Q2. List employees who work in either the "IT" or "HR" department.
select * from employees
where department = "IT" or department = "HR";

#Q3. Retrieve employees whose salary is not less than 30000.
select * from employees 
where not salary < 30000;

#Q4. Show employees whose department is "Finance" and "Experience" is between 3 and 7 years.
select * from employees
where department = "Finance" and 
experience between 3 and 7;

#Q5. Find employees whose name starts with 'A' or salary is less than 25000.
select * from employees
where name like "A%" or salary < 25000;

#Q6. Display employees who do not belong to the 'Marketing' department.
select * from employees
where department != "Marketing";

#Q7. List employees whose salary is above 40000 or experience is below 2 years.
select * from employees
where salary > 40000 or experience < 2;

#Q8. Find employees whose department is 'IT' and salary is not above 60000.
select * from employees
where department = "IT" and not salary > 60000;

#Q9. Show employees whose name does not end with 'n' and salary is between 20000 and 50000.
select * from employees
where not name like "%n" and salary between 20000 and 50000;

#Q10. Retrieve employees who are in 'Sales' or have more than 10 years of experience.
select * from employees
where department = "Sales" or experience > 10;