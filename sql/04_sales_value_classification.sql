-- Supply Chain & Logistics Analytics
-- 04 Sales Value Classification
-- Grain: Order Item
-- Source: supply_chain_clean

SELECT
    `Order Item Id` AS order_item_id,
    `Product Name` AS product_name,
    `Category Name` AS category_name,
    Sales AS sales_value,
    CASE
        WHEN Sales < 100 THEN 'Low Value'
        WHEN Sales < 500 THEN 'Medium Value'
        ELSE 'High Value'
    END AS sales_value_class
FROM supply_chain_clean
ORDER BY Sales DESC;