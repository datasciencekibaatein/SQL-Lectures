use store;

-- windows function


-- windows function perform calculation across a set of rows 
-- related to the current row without grouping the rows into a single output.


-- Types of functions
-- 1) Rank Functions, 2) Number Functions, and 3) Aggregation Functions

select 
	payment_mode,
	sum(quantity) Ttl_quantity
from sales
group by payment_mode;

select
	*
from sales;


/*
select
	column1,
    window_function() over([partition by column]
    [order by column]) as alias
from table;
*/


-- ========================================
--             ****Rank Functions****
-- ========================================


-- row_number() function

-- assigns unique number to each row
select
    order_date,
    payment_mode,
    quantity,
    row_number() over(partition by payment_mode order by quantity ) as row_num,
    sale_id
from sales;



-- rank() function
-- gives the same rank to ties, but skips the next rank

select
	payment_mode,
    quantity,
    rank() over(partition by payment_mode order by quantity) rank_quantity,
    row_number() over(partition by payment_mode) row_num
from sales;


-- dense_rank()
select
	payment_mode,
    quantity,
    dense_rank() over(partition by payment_mode order by quantity ) dense_quantity_rank,
    row_number() over() row_num
from sales;


-- ntile()
-- divides rows into equal buckets.

select
	s.sale_id,
	s.payment_mode,
    s.quantity * p.price product_price,
    ntile(2) over(order by s.quantity * p.price) as bucket
from sales s
join products p 
on s.product_id = p.product_id;


-- ========================================
--          ****Number Functions****
-- ========================================

-- lag() function
-- returns the previous row's value

select
    payment_mode,
	order_date,
	quantity,
    lag(quantity) over(partition by payment_mode order by order_date) as previous_quantity
from sales;

-- lead() function
-- returns the next row's value

select
	payment_mode,
    order_date,
    quantity,
    lead(quantity) over(partition by payment_mode order by order_date) next_quantity
from sales;


-- first_value() function
-- returns the first value

select
	payment_mode,
    order_date,
    quantity,
    first_value(quantity) over(partition by payment_mode order by order_date) as first_quantity
from sales;


-- last_value() function
-- returns the last value in the window

select
	payment_mode,
    order_date,
	quantity,
    last_value(quantity) over(partition by payment_mode order by order_date 
		rows between unbounded preceding and unbounded following) last_quantity
from sales;


-- ========================================
--          ****Aggregation Functions****
-- ========================================

-- sum,count,avg,min,max

select
	payment_mode,
    order_date,
    quantity,
    sum(quantity) over(partition by payment_mode ) Total_sum,
    sum(quantity) over(partition by payment_mode order by order_date) cumsum
from sales;


