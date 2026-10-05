-- Supply Chain & Logistics Analytics
-- 08 Average Shipping Duration Analysis
-- Grain: Order Item
-- Source: supply_chain_clean

SELECT
    `Shipping Mode` AS shipping_mode,
    COUNT(DISTINCT `Order Id`) AS total_orders,
    COUNT(DISTINCT `Order Item Id`) AS total_order_items,
    ROUND(AVG(`Days for shipping (real)`), 2) AS avg_actual_shipping_days,
    ROUND(AVG(`Days for shipment (scheduled)`), 2) AS avg_scheduled_shipping_days,
    ROUND(
        AVG(`Days for shipping (real)`)
        - AVG(`Days for shipment (scheduled)`),
        2
    ) AS avg_shipping_delay_days
FROM supply_chain_clean
GROUP BY `Shipping Mode`
ORDER BY avg_shipping_delay_days DESC;