-- Supply Chain & Logistics Analytics
-- 18 Monthly Order Analysis
-- Grain: Month
-- Source: supply_chain_clean

SELECT
    DATE_FORMAT(order_datetime, '%Y-%m') AS order_month,
    COUNT(DISTINCT `Order Id`) AS total_orders,
    COUNT(DISTINCT `Order Item Id`) AS total_order_items,
    SUM(`Order Item Quantity`) AS total_quantity,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(`Order Profit Per Order`), 2) AS total_profit
FROM supply_chain_clean
GROUP BY DATE_FORMAT(order_datetime, '%Y-%m')
ORDER BY order_month;