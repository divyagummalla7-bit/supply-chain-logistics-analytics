-- Supply Chain & Logistics Analytics
-- 26 Monthly Profit Analysis
-- Grain: Month
-- Source: supply_chain_clean

SELECT
    DATE_FORMAT(order_datetime, '%Y-%m') AS profit_month,
    COUNT(DISTINCT `Order Id`) AS total_orders,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(`Order Profit Per Order`), 2) AS total_profit,
    ROUND(
        (SUM(`Order Profit Per Order`) / NULLIF(SUM(Sales), 0)) * 100,
        2
    ) AS profit_margin_percent
FROM supply_chain_clean
GROUP BY DATE_FORMAT(order_datetime, '%Y-%m')
ORDER BY profit_month;