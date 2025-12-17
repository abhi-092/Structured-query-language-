create database subquery;

use subquery;

create table employee(
emp_id int,
emp_name varchar(50),
dept_id int ,
salary int,
age int);

insert into employee (emp_id,emp_name,dept_id,salary,age) values
(1,"John",101,50000,28),
(2,"Emma",101,65000,32),
(3,"Raj",102,45000,26),
(4,"Meera",103,70000,38),
(5,"Ravi",102,48000,30),
(6,"Naina",103,52000,29),
(7,"Alex",101,58000,31);

select *from employee;

create table department (
dept_id int,
dept_name varchar(50));

insert into department (dept_id,dept_name) values
(101,"Sales"),
(102,"Marketing"),
(103,"Finance");

select *from department;

#Q1: Show emp. whose salary is above avg salary
select emp_name from employee
where salary>(select avg(salary) from employee);

#Q2: Find employees who work in the sales department
select emp_name from employee
where dept_id=(select dept_id from department where dept_name="sales");

#Q3: Find the highest paid employee
select emp_name,salary 
from employee
where salary=(select max(Salary) from employee);


#Q4 : Find employee older than the youngest employee
select emp_name,age from employee
where age>(select min(age)from employee);

#Q5: List employees who earn more than john 
select emp_name from employee
where salary>(select (salary) from employee where emp_name="John");


#Q6: Find employees in departments where the average salary is above 50'000
select emp_name,salary
from employee
where dept_id in (select dept_id from employee group by dept_id 
having avg(Salary)>50000);


#Q7: Find employees whose salary is second second highest 
select emp_name,salary 
from employee
where salary=(select max(Salary) from employee
where salary<(select max(Salary) from employee));


#Q8: Find employees in the same department as Emma
select emp_name
from employee
where dept_id = (select dept_id from employee
where emp_name= "Emma");


#Q9: List employees that have more than 2 employees 
select dept_name
from department 
where dept_id=( select dept_id from employee
where emp_name="Emma");


#Q10: Find employees who earn more than every employee in marketing 
select emp_name from employee 
where salary > (select max(salary) from employee
where dept_id=102);


#Q11: Find employees who earn minimum salary in their department 
select emp_name,salary ,dept_id
from employee
where salary in (select min(Salary) from employee 
group by dept_id);
#2nd method 
select emp_name, dept_id,salary
from employee e 
where salary = (select min(Salary) from employee 
where dept_id=e.dept_id);


#Q12: Find employees whose salary is above the department average 
select emp_name,salary,dept_id from employee e
where salary>(select avg(salary) from employee
where dept_id=e.dept_id);


#Q13: List employees who are younger than emma
select emp_name,age from employee
where age<(select min(age)from employee 
where emp_name="Emma");


#Q14: Find employees who do not work in any department present in the department table 
select emp_name,dept_id
from employee
where dept_id not in (select dept_id from department);

#Q15: Find the top 2 highest salary using a subquery
select emp_name,salary from employee
where salary in (select Salary from (
select distinct salary
from employee 
order by salary desc
limit 2 
 )as t);
 
 
 #Q16: Display employees whose salary is below department average 
select emp_name,salary,dept_id from employee e
where salary<(select avg(salary) from employee
where dept_id=e.dept_id);
 

 
 #Q17: Find employees whose age is greater than the average age
 select emp_name,age from employee
 where age>(Select avg(age) from employee);
 

 #Q18: Find employees who belong to departments starting with 'm'
select emp_name,dept_id
from employee
where dept_id = (select dept_id from department
where dept_name like "M%");
 
 
 #Q19: Find employees who do not have the same salary as anyone else
 select * from employee 
 where salary in ( select salary from employee
 group by salary
 having count(*)= 1);
 


