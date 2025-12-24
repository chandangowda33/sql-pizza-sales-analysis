-- Objective:
-- Assess data quality by validating row counts, null values, duplicates, and basic distributions across all tables.

-- Primary Key Validation

SELECT COUNT(*) - COUNT(DISTINCT order_id) AS duplicate_order_ids
FROM orders;

SELECT COUNT(*) - COUNT(DISTINCT order_details_id) AS duplicate_rows
FROM order_details;

SELECT COUNT(*) - COUNT(DISTINCT pizza_id) AS duplicate_pizza_ids
FROM pizzas;

SELECT COUNT(*) - COUNT(DISTINCT pizza_type_id) AS duplicate_types
FROM pizza_types;


-- Date Range Check
SELECT
    MIN(order_date) AS min_order_date,
    MAX(order_date) AS max_order_date
FROM orders;

-- Price,Ingredients and Quantity Validation
SELECT *
FROM order_details
WHERE quantity <= 0;

SELECT *
FROM pizzas
WHERE price <= 0;

SELECT *
FROM pizza_types
WHERE ingredients IS NULL
   OR ingredients = '';



-- Orders with Multiple Items
SELECT order_id, COUNT(*) AS item_count
FROM order_details
GROUP BY order_id
HAVING COUNT(*) > 1
ORDER BY item_count DESC;

-- Ingredient Count 
SELECT
    pizza_type_id,
    LENGTH(ingredients) - LENGTH(REPLACE(ingredients, ',', '')) + 1 AS ingredient_count
FROM pizza_types
ORDER BY ingredient_count DESC;

