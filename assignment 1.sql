#Q1 Create a database named company and a table named employees with the following fields:
create database company;
use company;
create table employes (
id INT Primary Key,
name VARCHAR(100),
position VARCHAR(100),
salary DECIMAL(10,2),
date_of_joining DATE
);


#Q2 Insert the following data into the employees table:
insert into employes values
(1,'John Doe', 'Manager', 55000.00, '2020-01-15'),
(2,'Jane Smith', 'Developer', 48000.00, '2019-07-10'),
(3,'Alice Johnson', 'Designer', 45000.00, '2021-03-22'),
(4,'Bob Brown', 'Developer', 50000.00, '2018-11-01');
select *from employes;


#Q3 Write a query to retrieve all employees who are Developers.
select * from employes where position="developer";


#Q4 Write a query to update the salary of Alice Johnson to 46000.00.
update employes set salary = '46000.00' where id= "1";
select * from employes;

set sql_safe_updates=0;

#Q5 Write a query to delete the employee record for Bob Brown.
delete from employes where name='Bob Brown';
select * from employes;

#Q6 Write a query to find the employees who have a salary greater than 48000.
select * from employes where salary>48000;

#Q7 Write a query to add a new column email to the employees table.
alter table employes add column Email varchar(100);
select * from employes;

#Q8 Write a query to update the email for John Doe to john.doe@company.com.
update employes set email='john.doe@company.com' where name='John Doe';
select * from employes;

#Q9 Write a query to retrieve only the name and salary of all employees.
select name,salary from employes;

#Q10 Write a query to count the number of employees who joined after January 1, 2020.
select count(*) from employes where Date_of_joining= '2020-01-01';

#Q11 Write a query to order the employees by salary in descending order.
select * from employes order by salary desc;

#Q12  Write a query to drop the email column from the employees table.
alter table employes drop column Email;
select * from employes;

#Q13 Write a query to find the employee with the highest salary.
select * from employes where salary=(select max(salary) from employes);


