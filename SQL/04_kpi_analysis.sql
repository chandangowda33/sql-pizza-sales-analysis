-- Objective:
-- Calculate core business KPIs including total revenue, total orders, total quantity sold, and average order value.

SELECT
    ROUND(SUM(order_revenue), 0) AS total_revenue,
    COUNT(order_id) AS total_orders,
    SUM(total_pizzas) AS total_pizzas_sold,
    ROUND(AVG(order_revenue), 2) AS avg_order_value,
    ROUND(AVG(total_pizzas), 2) AS avg_pizzas_per_order,
    ROUND(SUM(order_revenue) / SUM(total_pizzas), 2) AS revenue_per_pizza
FROM orders_revenue;

