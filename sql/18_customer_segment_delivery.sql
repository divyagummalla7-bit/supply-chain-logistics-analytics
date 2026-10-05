-- Supply Chain & Logistics Analytics
-- 24 Customer Segment Delivery Analysis
-- Grain: Customer Segment
-- Source: supply_chain_clean

SELECT
    `Customer Segment` AS customer_segment,
    COUNT(DISTINCT `Order Id`) AS total_orders,
    COUNT(DISTINCT `Order Item Id`) AS total_order_items,
    ROUND(AVG(Late_delivery_risk) * 100, 2) AS late_delivery_rate,
    ROUND(AVG(`Days for shipping (real)`), 2) AS avg_actual_shipping_days,
    ROUND(AVG(`Days for shipment (scheduled)`), 2) AS avg_scheduled_shipping_days,
    ROUND(
        AVG(`Days for shipping (real)`)
        - AVG(`Days for shipment (scheduled)`),
        2
    ) AS avg_shipping_delay_days
FROM supply_chain_clean
GROUP BY `Customer Segment`
ORDER BY late_delivery_rate DESC;