--CREATE DATABASE database_pizza_sales;
use database_pizza_sales;
SELECT * FROM [pizza_sales sql 1]
-- »Ì⁄  ﬂ«„ ﬁÿ⁄…
select sum(quantity) as total_quantity from [pizza_sales sql 1];
select count(distinct pizza_name) as 'number of pizza' from [pizza_sales sql 1];
select sum(unit_price) from [pizza_sales sql 1];
select top 10 * from [pizza_sales sql 1];
select sum(quantity) as 'total quantity for M' from [pizza_sales sql 1] where pizza_size = 'M';
select sum(quantity) as 'total quantity for L' from [pizza_sales sql 1] where pizza_size = 'L';
select count (pizza_category) as 'total classic pizza' from [pizza_sales sql 1] where pizza_category = 'classic';
select pizza_category , sum(quantity) from [pizza_sales sql 1] group by pizza_category 
select pizza_name , sum(unit_price) from [pizza_sales sql 1] group by pizza_name
select top 10 pizza_category , sum(quantity) from [pizza_sales sql 1] group by pizza_category order by sum(quantity) desc;
select sum(quantity) from [pizza_sales sql 1] where pizza_size = 'M'OR pizza_size = 'L'
select sum(quantity) from [pizza_sales sql 1] where pizza_size NOT IN('M','L')
select quantity * unit_price as Total_Price from [pizza_sales sql 1];
select sum(quantity * unit_price) as Total_Price from [pizza_sales sql 1];
alter table [pizza_sales sql 1 ] add Total_Sales float;
update [pizza_sales sql 1] set Total_Sales = quantity* unit_price;
alter table [pizza_sales sql 1 ] add Tax float;
select DATENAME (weekday,order_date), sum(total_sales) , sum ( tax) from [pizza_sales sql 1] group by datename (weekday, order_date);
select datename ( weekday , order_date) as day_name , round(sum(total_sales),2) as tota_sales_day , round(sum(tax),2) as total_tax from [pizza_sales sql 1] group by datename(weekday,order_date);


create view sales_by_days as
select datename(weekday , order_date) as day_name, ROUND(sum(total_sales),0) as total_price_per_day , count(distinct order_id ) as total_orders from [pizza_sales sql 1] group by datename(weekday , order_date);
select * from sales_by_days;



select round( sum(total_sales) / count(distinct order_id) , 2) as average_orders_value from [pizza_sales sql 1];
select sum(quantity) / count (distinct order_id) as avg_pizza_per_order from [pizza_sales sql 1];
select cast( cast( sum( quantity ) as decimal (10,2)) / cast ( count ( distinct order_id) as decimal (10,2)) as decimal(10,2)) as avg_pizza_per_order from [pizza_sales sql 1];

