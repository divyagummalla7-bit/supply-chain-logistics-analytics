-- Supply Chain & Logistics Analytics
-- 13 Category Profit Ranking
-- Demonstrates DENSE_RANK() window function
-- Grain: Category
-- Source: supply_chain_clean

WITH category_profit AS (
    SELECT
        `Category Name` AS category_name,
        ROUND(SUM(Sales), 2) AS total_sales,
        ROUND(SUM(`Order Profit Per Order`), 2) AS total_profit
    FROM supply_chain_clean
    GROUP BY `Category Name`
)
SELECT
    category_name,
    total_sales,
    total_profit,
    DENSE_RANK() OVER (
        ORDER BY total_profit DESC
    ) AS profit_rank
FROM category_profit
ORDER BY profit_rank;