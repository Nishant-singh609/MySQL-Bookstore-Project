-- Basic:
-- Retrieve the total number of orders placed.
-- Calculate the total revenue generated from pizza sales.
-- Identify the highest-priced pizza.
-- Identify the most common pizza size ordered.
-- List the top 5 most ordered pizza types along with their quantities.
select * from orders;

-- Intermediate:
-- Join the necessary tables to find the total quantity of each pizza category ordered.
-- Determine the distribution of orders by hour of the day.
-- Join relevant tables to find the category-wise distribution of pizzas.
-- Group the orders by date and calculate the average number of pizzas ordered per day.
-- Determine the top 3 most ordered pizza types based on revenue.

-- Advanced:
-- Calculate the percentage contribution of each pizza type to total revenue.
-- Analyze the cumulative revenue generated over time.
-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

USE pizza;
-- Basic:
-- Retrieve the total number of orders placed.
-- Calculate the total revenue generated from pizza sales.
-- Identify the highest-priced pizza.
-- Identify the most common pizza size ordered.
-- List the top 5 most ordered pizza types along with their quantities.

select * from orders;
select count(order_id) as total_order from orders;

-- Calculate the total revenue generated from pizza sales.
select sum(order_details.quantity * pizzas.price) as total_sale_of_pizza 
from  order_details join pizzas on order_details.pizza_id = pizzas.pizza_id;

-- Identify the highest-priced pizza.
select pizza_types.name,pizzas.price as highter_price_pizza
from pizza_types join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id
order by highter_price_pizza desc limit 1;

-- Identify the most common pizza size ordered.
select pizzas.size,sum(order_details.quantity) as hightest_comman_sales
from order_details join pizzas on order_details.pizza_id=pizzas.pizza_id
group by pizzas.size
order by hightest_comman_sales desc limit 1;

-- List the top 5 most ordered pizza types along with their quantities.

select pizza_types.name,sum(order_details.quantity)as 5_most_ord_type_quntity
from order_details join pizzas on order_details.pizza_id=pizzas.pizza_id join pizza_types on
pizza_types.pizza_type_id=pizzas.pizza_type_id
group by pizza_types.name 
order by 5_most_ord_type_quntity desc limit 5;


-- ----------------- the basic qustion has been sloved ------------------------


-- ----------------- the intermidate question  have to solve ---------------------------------

-- Intermediate:
-- Join the necessary tables to find the total quantity of each pizza category ordered.
-- Determine the distribution of orders by hour of the day.
-- Join relevant tables to find the category-wise distribution of pizzas.
-- Group the orders by date and calculate the average number of pizzas ordered per day.
-- Determine the top 3 most ordered pizza types based on revenue.


-- Join the necessary tables to find the total quantity of each pizza category ordered.

select pizza_types.category,sum(order_details.quantity) as qun_pizza_category_ord
from order_details join pizzas on pizzas.pizza_id = order_details.pizza_id join pizza_types on 
pizzas.pizza_type_id=pizza_types.pizza_type_id
group by pizza_types.category;

-- Determine the distribution of orders by hour of the day.
-- 11 baje kitna order ishme bsicaly hours par gaya hay ki nahi dekhna hay


select hour(time) ,count(order_id)as total_order from orders
group by hour(time) ;

-- Join relevant tables to find the category-wise distribution of pizzas.
select category, count(name) from pizza_types
group by category;

-- Group the orders by date and calculate the total number of pizzas ordered per day.

select orders.date,sum(order_details.quantity) as total_quantity_order_per_day
from orders join order_details on order_details.order_id=orders.order_id
group  by orders.date;

-- Group the orders by date and calculate the avrages number of pizzas ordered per day.

select avg(total_order_per_day) from (select orders.date ,sum(order_details.quantity) 
as total_order_per_day from orders join order_details on orders.order_id=order_details.order_id
group by orders.date) as new_table;


-- Determine the top  all most ordered pizza types based on revenue.

select pizza_types.name,sum(order_details.quantity* pizzas.price) as total_quan_price 
from pizza_types join pizzas on  pizza_types.pizza_type_id=pizzas.pizza_type_id 
join order_details on pizzas.pizza_id=order_details.pizza_id
group by pizza_types.name 
order by total_quan_price desc  ;

-- Determine the top 3 most ordered pizza types based on revenue.

select pizza_types.name,sum(order_details.quantity* pizzas.price) as total_quan_price 
from pizza_types join pizzas on  pizza_types.pizza_type_id=pizzas.pizza_type_id 
join order_details on pizzas.pizza_id=order_details.pizza_id
group by pizza_types.name 
order by total_quan_price desc limit 3 ;

--   -------------- the Intermediate qustion  has been solved -----------------


-- --------------------------- Advanced ---------------------------------

-- Calculate the percentage contribution of each pizza type to total revenue.
-- Analyze the cumulative revenue generated over time.
-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.


-- first -- Calculate the contribution of each pizza type to total revenue per pizzas revenue.
select pizza_types.name,sum(order_details.quantity* pizzas.price) as total_qun_price_pizza from 
order_details  join  pizzas on pizzas.pizza_id = order_details.pizza_id join pizza_types
on pizza_types.pizza_type_id=pizzas.pizza_type_id
group by pizza_types.name
order by  total_qun_price_pizza;

-- ---------- total  revenue  --------------

select sum(total_qun_price_pizza) as total_revenue from (select pizza_types.name,sum(order_details.quantity* pizzas.price) 
as total_qun_price_pizza from order_details  join  pizzas on pizzas.pizza_id = order_details.pizza_id 
join pizza_types on pizza_types.pizza_type_id=pizzas.pizza_type_id
group by pizza_types.name) as new_table;


-- first -- Calculate the percentage contribution of each pizza type to total revenue.
 
select pizza_types.name,sum(order_details.quantity* pizzas.price) as total_qun_price_pizza,
sum((order_details.quantity* pizzas.price)/(select sum(total_qun_price_pizza) as total_revenue from (select pizza_types.name,sum(order_details.quantity* pizzas.price) 
as total_qun_price_pizza from order_details  join  pizzas on pizzas.pizza_id = order_details.pizza_id 
join pizza_types on pizza_types.pizza_type_id=pizzas.pizza_type_id
group by pizza_types.name) as new_table)*100) as percentage_per_pizza_types from 
order_details  join  pizzas on pizzas.pizza_id = order_details.pizza_id join pizza_types
on pizza_types.pizza_type_id=pizzas.pizza_type_id
group by pizza_types.name;

-- ************************** new new **************************************

-- first -- Calculate the contribution of each pizza type to total revenue per pizzas revenue.


select pizza_types.category,sum(order_details.quantity* pizzas.price) as total_qun_price_pizza from 
order_details  join  pizzas on pizzas.pizza_id = order_details.pizza_id join pizza_types
on pizza_types.pizza_type_id=pizzas.pizza_type_id
group by pizza_types.category
order by  total_qun_price_pizza desc;

-- ---------- total  revenue  --------------

select sum(total_qun_price_pizza) as total_revenue from (select pizza_types.category,sum(order_details.quantity* pizzas.price) 
as total_qun_price_pizza from order_details  join  pizzas on pizzas.pizza_id = order_details.pizza_id 
join pizza_types on pizza_types.pizza_type_id=pizzas.pizza_type_id
group by pizza_types.category) as new_table;


-- first -- Calculate the percentage contribution of each pizza type to total revenue.

select pizza_types.category,sum(order_details.quantity* pizzas.price) as total_qun_price_pizza,
sum((order_details.quantity* pizzas.price)/(select sum(total_qun_price_pizza) as total_revenue 
from (select pizza_types.category,sum(order_details.quantity* pizzas.price) 
as total_qun_price_pizza from order_details  join  pizzas on pizzas.pizza_id = order_details.pizza_id 
join pizza_types on pizza_types.pizza_type_id=pizzas.pizza_type_id
group by pizza_types.category) as new_table)*100) as percentage_per_pizza_types from 
order_details  join  pizzas on pizzas.pizza_id = order_details.pizza_id join pizza_types
on pizza_types.pizza_type_id=pizzas.pizza_type_id
group by pizza_types.category;





-- ------------ Analyze the cumulative revenue generated over time.  -----------------------

select orders.date, sum(order_details.quantity*pizzas.price) as per_day_sale
from order_details join orders on order_details.order_id = orders.order_id 
join pizzas on  order_details.pizza_id =pizzas.pizza_id 
join pizza_types on pizza_types.pizza_type_id = pizzas.pizza_type_id
group by orders.date;


-- ------------ Analyze the per_day revenue generated over time.  -----------------------


select orders.date, sum(order_details.quantity*pizzas.price) as per_day_sale, 
sum(sum(order_details.quantity*pizzas.price)) over( order by orders.date) as cumulative_revenue_per_day
from order_details join orders on order_details.order_id = orders.order_id 
join pizzas on  order_details.pizza_id =pizzas.pizza_id 
join pizza_types on pizza_types.pizza_type_id = pizzas.pizza_type_id
group by orders.date
order by orders.date;

-- Determine the top all most ordered pizza types based on revenue for each pizza category.

select category,name,total_reun_price_pizza,
 rank() over(partition by category order by total_reun_price_pizza desc) as ranks
 from (select pizza_types.category as category,pizza_types.name as name,
sum(order_details.quantity* pizzas.price) as total_reun_price_pizza from 
order_details  join  pizzas on pizzas.pizza_id = order_details.pizza_id join pizza_types
on pizza_types.pizza_type_id=pizzas.pizza_type_id
group by pizza_types.category,pizza_types.name) as new_table;



-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.


select category,name,total_reun_price_pizza,ranks from  (select category,name,total_reun_price_pizza,
 rank() over(partition by category order by total_reun_price_pizza desc) as ranks
 from (select pizza_types.category as category,pizza_types.name as name,
sum(order_details.quantity* pizzas.price) as total_reun_price_pizza from 
order_details  join  pizzas on pizzas.pizza_id = order_details.pizza_id join pizza_types
on pizza_types.pizza_type_id=pizzas.pizza_type_id
group by pizza_types.category,pizza_types.name) as new_table) as new_table_1
where ranks <=3;



  -- ------------------- finaly i have solved all qustion basic to advance            -----------------------