-- Supply Chain & Logistics Analytics
-- 03 Regional Sales Analysis
-- Grain: Order Item
-- Source: supply_chain_clean

SELECT
    `Order Region` AS order_region,
    COUNT(DISTINCT `Order Id`) AS total_orders,
    COUNT(DISTINCT `Order Item Id`) AS total_order_items,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(`Order Profit Per Order`), 2) AS total_profit,
    ROUND(AVG(Late_delivery_risk) * 100, 2) AS late_delivery_rate
FROM supply_chain_clean
GROUP BY `Order Region`
ORDER BY total_sales DESC;