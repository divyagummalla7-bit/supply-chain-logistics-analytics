-- Supply Chain & Logistics Analytics
-- 17 Delivery Status Conditional Analysis
-- Demonstrates CASE WHEN conditional logic
-- Grain: Order Item
-- Source: supply_chain_clean

SELECT
    CASE
        WHEN Late_delivery_risk = 1 THEN 'Late Delivery'
        ELSE 'On Time'
    END AS delivery_status,
    COUNT(*) AS total_order_items,
    SUM(`Order Item Quantity`) AS total_quantity,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(`Order Profit Per Order`), 2) AS total_profit,
    ROUND(AVG(`Days for shipping (real)`), 2) AS avg_actual_shipping_days,
    ROUND(AVG(`Days for shipment (scheduled)`), 2) AS avg_scheduled_shipping_days
FROM supply_chain_clean
GROUP BY
    CASE
        WHEN Late_delivery_risk = 1 THEN 'Late Delivery'
        ELSE 'On Time'
    END
ORDER BY total_order_items DESC;