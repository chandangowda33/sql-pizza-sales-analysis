-- Top-Selling Pizzas (By Revenue)
SELECT
    pizza_name,
    SUM(item_revenue) AS total_revenue
FROM order_items_enriched
GROUP BY pizza_name
ORDER BY total_revenue DESC
LIMIT 5;

-- Top-Selling Pizzas (By Quantity)
SELECT
    pizza_name,
    SUM(quantity) AS total_quantity_sold
FROM order_items_enriched
GROUP BY pizza_name
ORDER BY total_quantity_sold DESC
LIMIT 5;

-- Least-Performing Pizzas (By Revenue)

SELECT
    pizza_name,
    SUM(item_revenue) AS total_revenue
FROM order_items_enriched
GROUP BY pizza_name
ORDER BY total_revenue ASC
LIMIT 5;

-- Category-Level Performance
SELECT
    category,
    SUM(item_revenue) AS category_revenue,
    SUM(quantity) AS total_pizzas_sold
FROM order_items_enriched
GROUP BY category
ORDER BY category_revenue DESC;

-- Size-Based Performance
SELECT
    size,
    SUM(item_revenue) AS revenue_by_size,
    SUM(quantity) AS quantity_by_size
FROM order_items_enriched
GROUP BY size
ORDER BY revenue_by_size DESC;

-- Product Revenue Contribution (%)
SELECT
    pizza_name,
    ROUND(
        SUM(item_revenue) * 100.0 /
        SUM(SUM(item_revenue)) OVER (),
        2
    ) AS revenue_percentage
FROM order_items_enriched
GROUP BY pizza_name
ORDER BY revenue_percentage DESC;

-- Top Pizza by Category
SELECT
    category,
    pizza_name,
    total_revenue
FROM (
    SELECT
        category,
        pizza_name,
        SUM(item_revenue) AS total_revenue,
        RANK() OVER (
            PARTITION BY category
            ORDER BY SUM(item_revenue) DESC
        ) AS rank_in_category
    FROM order_items_enriched
    GROUP BY category, pizza_name
) ranked
WHERE rank_in_category = 1;
