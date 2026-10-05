-- Supply Chain & Logistics Analytics
-- 30 Category & Department Analysis
-- Grain: Department + Product Category
-- Source: supply_chain_clean

SELECT
    `Department Name` AS department_name,
    `Category Name` AS category_name,
    COUNT(DISTINCT `Order Id`) AS total_orders,
    COUNT(DISTINCT `Order Item Id`) AS total_order_items,
    SUM(`Order Item Quantity`) AS total_quantity,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(`Order Profit Per Order`), 2) AS total_profit,
    ROUND(AVG(Late_delivery_risk) * 100, 2) AS late_delivery_rate
FROM supply_chain_clean
GROUP BY
    `Department Name`,
    `Category Name`
ORDER BY
    total_sales DESC;