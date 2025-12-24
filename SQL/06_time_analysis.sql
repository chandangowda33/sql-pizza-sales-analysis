-- Objective:
-- Examine ordering patterns over time to identify peak hours, revenue trends, and opportunities for operational optimization.

-- Orders by Hour
SELECT
    order_hour,
    COUNT(order_id) AS total_orders
FROM orders_revenue
GROUP BY order_hour
ORDER BY order_hour;

-- Revenue by Hour
SELECT
    order_hour,
    ROUND(SUM(order_revenue), 2) AS revenue_by_hour
FROM orders_revenue
GROUP BY order_hour
ORDER BY order_hour;

-- Average Order Value by Hour
SELECT
    order_hour,
    ROUND(AVG(order_revenue), 2) AS avg_order_value
FROM orders_revenue
GROUP BY order_hour
ORDER BY order_hour;

-- Combined Hourly Performance
SELECT
    order_hour,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(order_revenue), 2) AS total_revenue,
    ROUND(AVG(order_revenue), 2) AS avg_order_value
FROM orders_revenue
GROUP BY order_hour
ORDER BY order_hour;

-- Busiest Hour
SELECT
    order_hour,
    COUNT(order_id) AS total_orders
FROM orders_revenue
GROUP BY order_hour
ORDER BY total_orders DESC
LIMIT 1;

-- Slowest Hour
SELECT
    order_hour,
    COUNT(order_id) AS total_orders
FROM orders_revenue
GROUP BY order_hour
ORDER BY total_orders ASC
LIMIT 1;

-- Time Buckets
SELECT
    CASE
        WHEN order_hour BETWEEN 11 AND 14 THEN 'Lunch'
        WHEN order_hour BETWEEN 18 AND 21 THEN 'Dinner'
        ELSE 'Off-Peak'
    END AS time_slot,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(order_revenue), 2) AS total_revenue
FROM orders_revenue
GROUP BY time_slot
ORDER BY total_orders DESC;
