-- Supply Chain & Logistics Analytics
-- 09 Late Delivery by Region
-- Grain: Order Item
-- Source: supply_chain_clean

SELECT
    `Order Region` AS order_region,
    COUNT(DISTINCT `Order Id`) AS total_orders,
    COUNT(DISTINCT `Order Item Id`) AS total_order_items,
    ROUND(AVG(Late_delivery_risk) * 100, 2) AS late_delivery_rate,
    ROUND(AVG(`Days for shipping (real)`), 2) AS avg_actual_shipping_days,
    ROUND(AVG(`Days for shipment (scheduled)`), 2) AS avg_scheduled_shipping_days
FROM supply_chain_clean
GROUP BY `Order Region`
ORDER BY late_delivery_rate DESC;