-- Objective:
-- Create derived columns and analytical views such as order revenue and order hour to support KPI and trend analysis.

-- Item-Level Revenue Table

CREATE TABLE order_items_enriched AS
SELECT
    od.order_details_id,
    od.order_id,
    od.pizza_id,
    p.pizza_type_id,
    pt.name AS pizza_name,
    pt.category,
    p.size,
    od.quantity,
    p.price,
    (od.quantity * p.price) AS item_revenue
FROM order_details_clean od
JOIN pizzas_clean p
    ON od.pizza_id = p.pizza_id
JOIN pizza_types_clean pt
    ON p.pizza_type_id = pt.pizza_type_id;
    
Select * from order_items_enriched;

-- Time-Based Features (Order Level)
CREATE TABLE orders_enriched AS
SELECT
    o.order_id,
    o.order_date,
    o.order_time,
    EXTRACT(HOUR FROM o.order_time) AS order_hour
FROM orders_clean o;

Select * from orders_enriched;

-- Order-Level Revenue Table
CREATE TABLE orders_revenue AS
SELECT
    oe.order_id,
    oe.order_date,
    oe.order_hour,
    SUM(oi.item_revenue) AS order_revenue,
    SUM(oi.quantity) AS total_pizzas
FROM orders_enriched oe
JOIN order_items_enriched oi
    ON oe.order_id = oi.order_id
GROUP BY
    oe.order_id,
    oe.order_date,
    oe.order_hour;



