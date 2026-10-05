-- Supply Chain & Logistics Analytics
-- 14 Monthly Sales LAG Analysis
-- Demonstrates LAG() window function
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
    LAG(total_sales) OVER (
        ORDER BY sales_month
    ) AS previous_month_sales,
    ROUND(
        total_sales - LAG(total_sales) OVER (
            ORDER BY sales_month
        ),
        2
    ) AS sales_change
FROM monthly_sales
ORDER BY sales_month;