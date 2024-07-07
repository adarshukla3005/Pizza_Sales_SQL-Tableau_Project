
select * from pizza_sales
-- Total Revenue
SELECT SUM(total_price) as Total_Revenue from pizza_sales

-- Order ID with distinct value
Select DISTINCT(order_id) from pizza_sales order by order_id asc;

-- Average Order Value
SELECT SUM(total_price) / COUNT(distinct order_id) as Average_OrderVal 
from pizza_sales;

-- Total Pizza Sold
select SUM(quantity) as Total_Pizza_Sold from pizza_sales

-- Total Orders Placed
--we used count here instead of sum so as to get just 1+ count for same order id
select count(DISTINCT order_id) as Total_Orders from pizza_sales

-- Average Pizza/Order
--in integer it came 2 we'll convert it into decimal
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) 
AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_PizzaOrder FROM pizza_sales;



-- Hourly Trend for Total Pizzas Sold
SELECT DATEPART(HOUR, order_time) as order_hour, SUM(quantity) as Total_pizzas_Sold 
from pizza_sales
group by DATEPART(HOUR, order_time)
order by order_hour asc;

-- Weekly Trend for Total Orders
SELECT 
    DATEPART(YEAR, order_date) AS Year, 
    DATEPART(WEEK, order_date) AS Week, 
    COUNT(DISTINCT order_id) AS OrderCount
FROM 
    pizza_sales
GROUP BY 
    DATEPART(YEAR, order_date), 
    DATEPART(WEEK, order_date)
ORDER BY 
    Week;

select * from pizza_sales;

-- Percent of sales by Pizza Category also by month 'WHERE MONTH(order_date) = 1'
SELECT 
    pizza_category, ROUND(SUM(total_price),2) AS Total_sales,
    ROUND(SUM(total_price) * 100.0 / 
	(SELECT SUM(total_price) FROM pizza_sales), 2) 
	AS Percent_Total_sales
FROM pizza_sales
-- WHERE MONTH(order_date) = 1
GROUP BY pizza_category;

-- Percentage of sales by Pizza Size also quarterly
SELECT 
	pizza_size, ROUND(SUM(total_price),2) AS Total_sales,
    ROUND(SUM(total_price) * 100.0 / 
	(SELECT SUM(total_price) FROM pizza_sales), 2) 
	AS Percent_Total_sales
FROM pizza_sales
-- where DATEPART(Quarter, order_date) = 1  -- for quarters
GROUP BY pizza_size
order by Percent_Total_sales desc;


-- Top 5 best sellers by revenue
--select * from pizza_sales;
select top(5) pizza_name, round(SUM(total_price),2) as Total_Revenue from pizza_sales
GROUP BY pizza_name
order by Total_Revenue desc  -- asc for bottom 5

-- Top 5 best sellers by quantity
select top(5) pizza_name, SUM(quantity) as Total_quantity from pizza_sales
GROUP BY pizza_name
order by Total_quantity desc;

-- Bottom 5 best sellers by quantity
select top(5) pizza_name, SUM(quantity) as Total_quantity from pizza_sales
GROUP BY pizza_name
order by Total_quantity asc;

-- Top 5 best sellers by Orders
select top(5) pizza_name, COUNT(DISTINCT(order_id)) as Total_orders from pizza_sales
GROUP BY pizza_name
order by Total_orders desc;

-- Bottom 5 best sellers by Orders
select top(5) pizza_name, COUNT(DISTINCT(order_id)) as Total_orders from pizza_sales
GROUP BY pizza_name
order by Total_orders asc;

-- Total Pizza sold by Pizza category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

-- worst pizza category
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
--WHERE pizza_category = 'Classic'
GROUP BY pizza_name
ORDER BY Total_Orders asc


-- 


