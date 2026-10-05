-- Supply Chain & Logistics Analytics
-- 01 KPI Analysis
-- Grain: Order Item
-- Source: supply_chain_clean

SELECT
    COUNT(DISTINCT `Order Id`) AS total_orders,
    COUNT(DISTINCT `Order Item Id`) AS total_order_items,
    ROUND(SUM(Sales), 2) AS total_sales,
    SUM(`Order Item Quantity`) AS total_quantity,
    ROUND(SUM(`Order Profit Per Order`), 2) AS total_profit,
    ROUND(AVG(Late_delivery_risk) * 100, 2) AS late_delivery_rate
FROM supply_chain_clean;