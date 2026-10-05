-- Supply Chain & Logistics Analytics
-- 29 Category Sales Contribution
-- Grain: Product Category
-- Source: supply_chain_clean

WITH category_sales AS (
    SELECT
        `Category Name` AS category_name,
        ROUND(SUM(Sales), 2) AS total_sales
    FROM supply_chain_clean
    GROUP BY `Category Name`
)
SELECT
    category_name,
    total_sales,
    ROUND(
        (total_sales / NULLIF((SELECT SUM(total_sales) FROM category_sales), 0)) * 100,
        2
    ) AS sales_contribution_percent,
    RANK() OVER (
        ORDER BY total_sales DESC
    ) AS sales_rank
FROM category_sales
ORDER BY sales_rank;