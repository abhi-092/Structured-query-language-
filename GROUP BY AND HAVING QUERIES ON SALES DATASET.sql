select * from sales_account;

use company;

create table sales_account(
Sale_id int not null,
Product varchar (20),
Category varchar (30),
Quantity int ,
price float ,
Region varchar (50),
Sales_person varchar(50),
Sales_date Date
);

insert into sales_account(sale_id,product,category,quantity,price,region,sales_person,sales_date)values
(1,'Laptop','Electronics',5,50000,'East','John','2024-01-05'),
(2,'Mobile','Electronics',10,20000,'West','Mary','2024-01-10'),
(3,'Chair','Furniture',20,1500,'East','John','2024-02-15'),
(4,'Table','Furniture',8,5000,'North','Steve','2024-02-18'),
(5,'Laptop','Electronics',7,55000,'South','Mary','2024-03-01'),
(6,'Mobile','Electronics',15,18000,'East','John','2024-03-15'),
(7,'Sofa','Furniture',03,25000,'West','Steve','2024-03-20'),
(8,'Laptop','Electronics',2,52000,'North','Mary','2024-04-02'),
(9,'Chair','Furniture',30,1200,'South','John','2024-04-12'),
(10,'Mobile','Electronics',12,22000,'West','Steve','2024-04-15');


#1 find total sales amount for each region 

select region, sum(price) 
from sales_account
group by region
having sum(price);

#2 find total quantity sold by each salesperson

select sales_person,sum(quantity)
from sales_account
group by sales_person
having sum(quantity);

#3 Show categories where total quantity sold is more than 30

select category, SUM(quantity) AS total_quantity
FROM sales_account
GROUP BY category
HAVING SUM(quantity) > 30;

select * from sales_account;

#4 find total revenue by each category
select category,sum(quantity*price) as Total_revenue
from sales_account
group by category
having sum(quantity*price);


#5 Find salesperson who sold total quantity more than 20
select sales_person,sum(quantity) as total_sold
from sales_account
group by sales_person
having sum(quantity)>20;


#6 find region wise average sale price
select region, avg(price) as avg_sales_price
from sales_account
group by region ;


#7 Find total revenue for each salesperson and show only those having revenue above 300000
select sales_person, sum(quantity*price) as total_revenue
from sales_account
group by sales_person
having sum(quantity*price)>300000 ;

#8 find how many products each category has 
select category,count(product)
from sales_account
group by category
having count(product);

#9 find total sales per month 
select
  monthname(sales_date) AS month,
  sum(price) AS total_sales
from sales_account
group by monthname(sales_date);


#10 find each region's maximum sale price
select region,max(price) as maximum_sales_price
from sales_account
group by region
having max(price);

#11 find each category average quantity sold, but show only where avg>10
select category, avg(quantity) 
from sales_account
group by category
having avg(quantity)>10 ;


#12 find total revenue by region and category
select category,region,sum(quantity*price) 
from sales_account
group by region,category
having sum(quantity*price);

# 13 find how many sales each salesperson made in each region
select sales_person,region,count(price) as total_sales
from sales_account
group by sales_person,region
having count(price);

# 14 find the region where total quantity sold exceeds 20 
select region,sum(quantity) as total_quantity
from sales_account
group by region
having sum(quantity)>20;

# 15 Find salesperson who sold in more than one region ?
select sales_person,count(region)
from sales_account
group by sales_person
having count(quantity) > 1;

# 16 Find category having total revenue between ₹200000 and ₹1000000 ?
select category,sum(quantity*price) as total_revenue
from sales_account
group by category
having sum(quantity*price between 200000 and 1000000);

# 17 Find top 1 category with the highest total sale ?
select category,sum(quantity*price)
from sales_account
group by category
having sum(quantity*price) limit 1;

# 18 Find salesperson's average sale value per transaction ?
select sales_person,avg(price) per_transaction
from sales_account
group by sales_person
having avg(price);

# 19 Find category with minimum average price greater than ₹20000 ?
select category,min(price)
from sales_account
group by category
having avg(price) > 20000;

# 20 Find region and salesperson combination where revenue > <200000 ?
select region,sales_person,sum(quantity*price) as total_revenue
from sales_account
group by region,sales_person
having sum(quantity*price) > 200000;







