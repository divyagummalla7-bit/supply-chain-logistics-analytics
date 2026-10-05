-- Supply Chain & Logistics Analytics
-- 12 Product Row Number Analysis
-- Demonstrates ROW_NUMBER() window function
-- Grain: Order Item
-- Source: supply_chain_clean

SELECT
    `Product Name` AS product_name,
    `Category Name` AS category_name,
    Sales AS sales_value,
    ROW_NUMBER() OVER (
        PARTITION BY `Category Name`
        ORDER BY Sales DESC
    ) AS product_rank_in_category
FROM supply_chain_clean
ORDER BY
    `Category Name`,
    product_rank_in_category;