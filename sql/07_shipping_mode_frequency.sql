-- Supply Chain & Logistics Analytics
-- 07 Shipping Mode Frequency Analysis
-- Grain: Order Item
-- Source: supply_chain_clean

SELECT
    `Shipping Mode` AS shipping_mode,
    COUNT(DISTINCT `Order Id`) AS total_orders,
    COUNT(DISTINCT `Order Item Id`) AS total_order_items,
    SUM(`Order Item Quantity`) AS total_quantity,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(AVG(`Days for shipping (real)`), 2) AS avg_actual_shipping_days,
    ROUND(AVG(`Days for shipment (scheduled)`), 2) AS avg_scheduled_shipping_days,
    ROUND(AVG(Late_delivery_risk) * 100, 2) AS late_delivery_rate
FROM supply_chain_clean
GROUP BY `Shipping Mode`
ORDER BY total_order_items DESC;