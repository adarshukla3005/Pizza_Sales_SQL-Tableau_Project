# Pizza_Sales_SQL-Tableau_Project

Report1
![Report1](https://github.com/adarshukla3005/Pizza_Sales_SQL-Tableau_Project/assets/122630902/c1f68742-dfdf-42f4-9660-196955a46bcd)


Report2
![Report2](https://github.com/adarshukla3005/Pizza_Sales_SQL-Tableau_Project/assets/122630902/9dfd570c-603b-4cf0-a7df-c0af81958cac)



A. Key Performance Indicators
1. Total Revenue:
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;
 
2. Average Order Value
SELECT SUM(total_price) / COUNT(distinct order_id) as Average_OrderVal ;
from pizza_sales;
 
3. Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales;
 
4. Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;
 



5. Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) 
AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_PizzaOrder FROM pizza_sales;
 


B. Hourly Trend for Total Pizzas Sold
SELECT DATEPART(HOUR, order_time) as order_hour, SUM(quantity) as Total_pizzas_Sold 
from pizza_sales
group by DATEPART(HOUR, order_time)
order by order_hour asc;
Output
 

C. Weekly Trend for Orders
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

          


D. % of Sales by Pizza Category
SELECT 
    pizza_category, ROUND(SUM(total_price),2) AS Total_sales,
    ROUND(SUM(total_price) * 100.0 / 
	(SELECT SUM(total_price) FROM pizza_sales), 2) 
	AS Percent_Total_sales
FROM pizza_sales
-- WHERE MONTH(order_date) = 1
GROUP BY pizza_category;
Output
 
E. % of Sales by Pizza Size
SELECT 
	pizza_size, ROUND(SUM(total_price),2) AS Total_sales,
    ROUND(SUM(total_price) * 100.0 / 
	(SELECT SUM(total_price) FROM pizza_sales), 2) 
	AS Percent_Total_sales
FROM pizza_sales
-- where DATEPART(Quarter, order_date) = 1  -- for quarters
GROUP BY pizza_size
order by Percent_Total_sales desc;

Output
 
F. Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC
Output
 
G. Top 5 Pizzas by Revenue
SELECT Top(5) pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
 
H. Bottom 5 Pizzas by Revenue
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
 
I. Top 5 Pizzas by Quantity
SELECT Top 5 pizza_name, SUM(quantity) AS Total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity DESC
Output
 
J. Bottom 5 Pizzas by Quantity
SELECT Top 5 pizza_name, SUM(quantity) AS Total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity asc
Output
 
K. Top 5 Pizzas by Total Orders
select top(5) pizza_name, COUNT(DISTINCT(order_id)) as Total_orders from pizza_sales
GROUP BY pizza_name
order by Total_orders desc;
 
L. Borrom 5 Pizzas by Total Orders
select top(5) pizza_name, COUNT(DISTINCT(order_id)) as Total_orders from pizza_sales
GROUP BY pizza_name
order by Total_orders asc;
 
