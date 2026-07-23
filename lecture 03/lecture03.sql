select 
	*
from employees;

-- group by

select
	department,
	sum(salary) as salary_pool
from employees
group by department
having sum(salary) > 7000000;


-- what is the avg salary of each department
select
	department,
    avg(salary) avg_salary
from employees
group by department
having avg(salary) > 85000;



select
    department,
    city,
    count(*) records,
    avg(salary) avg_salary
from employees
group by department,city;


select * from employees;

-- show the avg salary by department,
-- for those people having experience >=5
-- and avg_salary of department >=60000.



select
	department,
    avg(salary) avg_salary
from employees
where experience >=5 
group by department
having avg(salary) >=60000;


-- joins 
use store;

select * from sales limit 5;
select * from products;
select * from customers limit 5;

-- inner join
-- left join
-- right join
-- full join
-- cross join
-- self join

select
	s.sale_id,
    s.customer_id,
	s.quantity,
    s.order_date,
    c.customer_name,
    c.state,
    c.membership
from sales s
inner join customers c
on s.customer_id = c.customer_id;




select
	c.membership,
    sum(s.quantity) ttl_qty
from sales s
inner join customers c
on s.customer_id = c.customer_id
group by c.membership;




select
	s.sale_id,
    s.sales_person,
    s.quantity*p.price as revenue,
    s.payment_mode,
    c.customer_name
from sales s
inner join products p
on p.product_id = s.product_id
inner join customers c
on c.customer_id = s.customer_id;



select
	s.sales_person,
    sum(s.quantity*p.price) as revenue
from sales s
inner join products p
on p.product_id = s.product_id
group by s.sales_person;



-- left join

select
	*
from sales s 
left join customers c
on s.customer_id = c.customer_id;


-- right join
select
	*
from products p
right join sales s
on s.product_id = p.product_id;



-- full join

select
	*
from sales s 
left join customers c
on s.customer_id = c.customer_id

union

select
	*
from products p
right join sales s
on s.product_id = p.product_id;




select
	c.customer_name,
    p.product_name
from customers c
cross join products p;


create table employees(
	emp_id int,
    name varchar(30),
    manger_id int
    
);

insert into employees values
(1,"rahul",null),
(2,"neha",1),
(3,"krish",1),
(4,"rohit",2),
(5,"aaditya",3),
(6,"rishabh",2);


select * from employees;

select 
	e.name as employee_name,
    m.name as manager_name
from employees e
left join
employees m
on e.manger_id = m.emp_id;