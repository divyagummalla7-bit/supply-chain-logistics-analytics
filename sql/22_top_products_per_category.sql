-- Supply Chain & Logistics Analytics
-- 28 Top Products per Category
-- Grain: Product + Category
-- Source: supply_chain_clean

WITH product_sales AS (
    SELECT
        `Category Name` AS category_name,
        `Product Name` AS product_name,
        COUNT(DISTINCT `Order Item Id`) AS total_order_items,
        ROUND(SUM(Sales), 2) AS total_sales,
        ROUND(SUM(`Order Profit Per Order`), 2) AS total_profit
    FROM supply_chain_clean
    GROUP BY
        `Category Name`,
        `Product Name`
),
ranked_products AS (
    SELECT
        category_name,
        product_name,
        total_order_items,
        total_sales,
        total_profit,
        ROW_NUMBER() OVER (
            PARTITION BY category_name
            ORDER BY total_sales DESC
        ) AS product_rank
    FROM product_sales
)
SELECT
    category_name,
    product_rank,
    product_name,
    total_order_items,
    total_sales,
    total_profit
FROM ranked_products
WHERE product_rank <= 3
ORDER BY
    category_name,
    product_rank;