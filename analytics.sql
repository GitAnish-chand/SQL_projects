

-- EDA

-------------- 1. Monthly Revenue Trend

SELECT
    -- TO_CHAR is used to format a date/timestamp into a specific string pattern
    TO_CHAR(order_date, 'YYYY-MM') AS month,
    sum(total_amount) AS total_revenue,
    COUNT(*) AS total_orders,
    ROUND(AVG(total_amount)::NUMERIC, 2) AS avg_order_value
FROM orders
WHERE order_status = 'Delivered'
GROUP BY month
ORDER BY month;

---------------- 2. Top 10 Highest Revenue Generating Restaurants

select 
	r.restaurant_name,
	r.city,
	count(o.order_id) as total_orders,
	sum(o.total_amount) as total_revenue,
	ROUND(AVG(o.total_amount)::NUMERIC, 2) AS avg_bill
from restaurants r
join orders o
on r.restaurant_id = o.restaurant_id
where o.order_status = 'Delivered'
group by r.city,r.restaurant_name
order by total_revenue desc
limit 10;

---------------- 3. Top 5 Most Ordered Restaurants

SELECT 
    r.restaurant_name,
    r.city,
    COUNT(o.order_id) AS order_count
FROM orders o
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name, r.city
ORDER BY order_count DESC
LIMIT 5;

---------------- 4. City-wise Order Distribution & Revenue

SELECT 
    r.city,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_revenue,
    ROUND(AVG(o.total_amount)::Numeric, 2) AS aov
FROM orders o
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.city
ORDER BY total_revenue DESC;





---------------- 5.  Customer Lifetime Value (CLV) – Top 10 Customers

SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders,
    ROUND(SUM(o.total_amount)::Numeric, 2) AS lifetime_value,
    ROUND(AVG(o.total_amount)::Numeric, 2) AS avg_order_value,
    MIN(o.order_date) AS first_order,
    MAX(o.order_date) AS last_order
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY lifetime_value DESC
LIMIT 10;

---------------- 6. Repeat Customer Rate

WITH customer_stats AS (
    SELECT 
        customer_id,
        COUNT(order_id) AS order_count
    FROM orders
    GROUP BY customer_id
)
SELECT 
    ROUND(100.0 * SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS repeat_customer_percentage
FROM customer_stats;


---------------- 7. Rider Performance Analysis
SELECT 
    r.rider_name,
    COUNT(d.delivery_id) AS total_deliveries,
    ROUND(AVG(TIME_TO_SEC(d.delivery_time)/60), 1) AS avg_delivery_time_min,
    ROUND(MIN(TIME_TO_SEC(d.delivery_time)/60), 1) AS fastest_delivery_min,
    ROUND(MAX(TIME_TO_SEC(d.delivery_time)/60), 1) AS slowest_delivery_min
FROM deliveries d
JOIN riders r ON d.rider_id = r.rider_id
GROUP BY r.rider_id, r.rider_name
ORDER BY total_deliveries DESC, avg_delivery_time_min ASC;

---------------- 8. Average Delivery Time by City
SELECT 
    res.city,
    ROUND(AVG(TIME_TO_SEC(del.delivery_time)/60), 1) AS avg_delivery_time_min,
    COUNT(del.delivery_id) AS deliveries
FROM deliveries del
JOIN orders o ON del.order_id = o.order_id
JOIN restaurants res ON o.restaurant_id = res.restaurant_id
GROUP BY res.city
ORDER BY avg_delivery_time_min;


---------------- 9. Cuisine Preference Analysis (Manual tagging suggested)
SELECT 
    CASE 
        WHEN order_item LIKE '%Biryani%' THEN 'Biryani'
        WHEN order_item LIKE '%Pizza%' THEN 'Pizza'
        WHEN order_item LIKE '%Burger%' OR order_item LIKE '%Whopper%' THEN 'Burger'
        WHEN order_item LIKE '%Dosa%' OR order_item LIKE '%Idli%' THEN 'South Indian'
        WHEN order_item LIKE '%Chicken%' OR order_item LIKE '%Mutton%' THEN 'North Indian Non-Veg'
        ELSE 'Others'
    END AS cuisine_type,
    COUNT(*) AS orders,
    ROUND(SUM(total_amount), 2) AS revenue
FROM orders
GROUP BY cuisine_type
ORDER BY orders DESC;

---------------- 10. Peak Order Day Analysis
SELECT 
    DAYNAME(order_date) AS day_of_week,
    COUNT(*) AS total_orders,
    ROUND(SUM(total_amount), 2) AS revenue
FROM orders
GROUP BY day_of_week, DAYOFWEEK(order_date)
ORDER BY DAYOFWEEK(order_date);

---------------- 11. Average Order Value by Restaurant Type (Premium vs Budget)
SELECT 
    CASE WHEN total_amount > 800 THEN 'Premium' ELSE 'Budget' END AS restaurant_tier,
    COUNT(*) AS orders,
    ROUND(AVG(total_amount), 2) AS avg_amount
FROM orders
GROUP BY restaurant_tier;

---------------- 12. Top 5 Fastest Deliveries
SELECT 
    d.delivery_id, o.order_id, r.rider_name, res.restaurant_name, d.delivery_time
FROM deliveries d
JOIN orders o ON d.order_id = o.order_id
JOIN riders r ON d.rider_id = r.rider_id
JOIN restaurants res ON o.restaurant_id = res.restaurant_id
ORDER BY d.delivery_time ASC
LIMIT 5;

---------------- 13. Customer Registration vs First Order Lag
SELECT 
    c.customer_name,
    c.reg_date,
    MIN(o.order_date) AS first_order_date,
    DATEDIFF(MIN(o.order_date), c.reg_date) AS days_to_first_order
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name, c.reg_date
ORDER BY days_to_first_order DESC;


---------------- 14. Rider Utilization Rate
SELECT 
    ROUND(100.0 * COUNT(DISTINCT d.rider_id) / (SELECT COUNT(*) FROM riders), 2) AS rider_utilization_percentage
FROM deliveries d;

---------------- 15. Revenue Contribution by Top 20% Customers (Pareto Principle Check)
WITH customer_revenue AS (
    SELECT 
        customer_id,
        SUM(total_amount) AS revenue
    FROM orders
    GROUP BY customer_id
),
ranked AS (
    SELECT *,
           SUM(revenue) OVER (ORDER BY revenue DESC) AS cumulative_revenue,
           SUM(revenue) OVER () AS total_revenue
    FROM customer_revenue
)
SELECT 
    ROUND(100.0 * MAX(CASE WHEN cumulative_revenue <= 0.8 * total_revenue THEN 1 ELSE 0 END), 2) AS top_percent_customers_for_80_percent_revenue
FROM ranked;



select * from orders;
select * from customers;
select * from restaurants;
select * from deliveries;
select * from riders;


SELECT
    table_name
FROM
    information_schema.tables
WHERE
    table_schema = 'public';  -- Filters for the default user schema


