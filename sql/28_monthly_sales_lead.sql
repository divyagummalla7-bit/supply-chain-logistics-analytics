-- Supply Chain & Logistics Analytics
-- 15 Monthly Sales LEAD Analysis
-- Demonstrates LEAD() window function
-- Grain: Month
-- Source: supply_chain_clean

WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(order_datetime, '%Y-%m') AS sales_month,
        ROUND(SUM(Sales), 2) AS total_sales
    FROM supply_chain_clean
    GROUP BY DATE_FORMAT(order_datetime, '%Y-%m')
)
SELECT
    sales_month,
    total_sales,
    LEAD(total_sales) OVER (
        ORDER BY sales_month
    ) AS next_month_sales,
    ROUND(
        LEAD(total_sales) OVER (
            ORDER BY sales_month
        ) - total_sales,
        2
    ) AS next_month_sales_change
FROM monthly_sales
ORDER BY sales_month;