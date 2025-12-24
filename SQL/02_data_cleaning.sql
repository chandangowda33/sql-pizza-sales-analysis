-- Objective:
-- Apply necessary data validation checks and ensure consistency in keys, data types, and value ranges before analysis.

CREATE TABLE orders_clean AS
SELECT
    order_id,
    order_date,
    CAST(order_time AS TIME) AS order_time
FROM orders;

CREATE TABLE order_details_clean AS
SELECT *
FROM order_details;

CREATE TABLE pizzas_clean AS
SELECT *
FROM pizzas;

CREATE TABLE pizza_types_clean AS
SELECT *
FROM pizza_types;
