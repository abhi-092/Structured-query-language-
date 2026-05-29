create database company_2;

use company_2;

create table employees(emp_id int, name varchar(10), department varchar(10), salary int);

insert into employees(emp_id, name, department, salary) values
(1,"Alica","HR",50000),
(2,"Bob","IT",70000),
(3,"Charlie","IT",60000),
(4,"David","HR",55000),
(5,"Eve","Finance",65000);

select * from employees;

# ---Questions---

# 1.Create a procedure to display all employees detail.
DELIMITER //
CREATE PROCEDURE ShowAllEmployees()
BEGIN
SELECT * FROM employees;
END //
DELIMITER ;

CALL ShowAllEmployees();

# 2.Create a stored procedure to fetch all employees from a specific department.
DELIMITER //
create procedure GetEmployeesByDept(in dept_name varchar(20))
begin
select * from employees where department = dept_name;
end//
DELIMITER ;

call GetEmployeesByDept("IT");

# 3.Create a stored procedure to insert a new employees.
DELIMITER //
create procedure AddEmployee(in emp_name varchar(10), in emp_dept varchar(10), in emp_salary int)
begin
insert into employees(name, department, salary)
values(emp_name, emp_dept, emp_salary);
end //
DELIMITER ;

call AddEmployee("Frank", "Finance", 62000);

select * from employees;

# 4.Create a stored procedure to return the total salary of all employees.
DELIMITER //
create procedure total_salary()
begin
select Sum(salary) from employees;
end //
DELIMITER //

call total_salary();

# 5.Create a stored procedure to increase salary by a given percentage for a department.
DELIMITER //
create procedure IncreaseSalaryByDept(in dept_name varchar(10), in percentage_increase decimal(10,2))
begin
update employees
set salary = salary + (salary * percentage_increase / 100)
where department = dept_name;
end //
DELIMITER ;

set sql_safe_updates=0;

call IncreaseSalaryByDept("IT",10);

select * from employees;

# 6.Create a stored procedure to delete an employee by ID.
DELIMITER //
create procedure DeleteEmpById(in id int)
begin
delete from employees where emp_id = id;
end //
DELIMITER ;

call DeleteEmpById(2);

select * from employees;

# 7. Create a procedure to update employee name.
delimiter //
create procedure updateEmpName(in id int, in emp_name varchar(20))
begin
update employees
set name = emp_name where emp_id = id;
end //
delimiter ;

set sql_safe_updates = 0;

call updateEmpName(3, "Riya");

select * from employees;

# 8. Create a procedure to highest salary employee.
delimiter //
create procedure GetHighestSalary()
begin
select * from employees
order by salary desc
limit 1;
end //
delimiter ;

call GetHighestSalary();

# 9. Create a procedure to return average salary.
delimiter //
create procedure GetAvgSalary()
begin
select avg(salary) as Average_salary from employees;
end //
delimiter ;

call GetAvgSalary();

# 10. Create a procedure to count total employees.
delimiter //
create procedure CountTotalEmployee()
begin
select count(emp_id) from employees;
end //
delimiter ;

call CountTotalEmployee();

# 11. Create a procedure to return average salary department wise.
delimiter //
create procedure AvgSalaryByDept()
begin
select department, avg(salary) from employees group by department;
end //
delimiter ;

call AvgSalaryByDept();

# 12. Create a procedure to get employees above a salary.
delimiter //
create procedure GetSalaryByUser(in emp_salary int)
begin 
select * from employees where salary > emp_salary;
end //
delimiter ;

call GetSalaryByUser(50000);

# 13. Create a procedure to add two numbers.
delimiter //
create procedure AddTwoNum(in a decimal(10,2), in b decimal(10,2))
begin
select a + b as Add_Num;
end //
delimiter ;

call AddTwoNum(10.00, 20.00);