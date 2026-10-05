-- Supply Chain & Logistics Analytics
-- 23 Product Category Contribution
-- Demonstrates percentage-of-total calculation
-- Grain: Category
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
        (total_sales / SUM(total_sales) OVER ()) * 100,
        2
    ) AS sales_contribution_percent
FROM category_sales
ORDER BY total_sales DESC;