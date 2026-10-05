-- Supply Chain & Logistics Analytics
-- 05 Category Sales Ranking
-- Grain: Order Item
-- Source: supply_chain_clean

SELECT
    `Category Name` AS category_name,
    COUNT(DISTINCT `Order Item Id`) AS total_order_items,
    SUM(`Order Item Quantity`) AS total_quantity,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(`Order Profit Per Order`), 2) AS total_profit,
    ROUND(AVG(Late_delivery_risk) * 100, 2) AS late_delivery_rate
FROM supply_chain_clean
GROUP BY `Category Name`
ORDER BY total_sales DESC;