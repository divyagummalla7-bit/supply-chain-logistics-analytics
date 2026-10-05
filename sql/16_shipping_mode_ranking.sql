-- Supply Chain & Logistics Analytics
-- 22 Shipping Mode Ranking
-- Demonstrates RANK() window function
-- Grain: Shipping Mode
-- Source: supply_chain_clean

WITH shipping_mode_summary AS (
    SELECT
        `Shipping Mode` AS shipping_mode,
        COUNT(DISTINCT `Order Id`) AS total_orders,
        COUNT(DISTINCT `Order Item Id`) AS total_order_items,
        ROUND(SUM(Sales), 2) AS total_sales,
        ROUND(AVG(Late_delivery_risk) * 100, 2) AS late_delivery_rate
    FROM supply_chain_clean
    GROUP BY `Shipping Mode`
)
SELECT
    shipping_mode,
    total_orders,
    total_order_items,
    total_sales,
    late_delivery_rate,
    RANK() OVER (
        ORDER BY total_sales DESC
    ) AS sales_rank
FROM shipping_mode_summary
ORDER BY sales_rank;