-- Supply Chain & Logistics Analytics
-- 16 Cumulative Monthly Sales
-- Demonstrates SUM() OVER() window function
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
    ROUND(
        SUM(total_sales) OVER (
            ORDER BY sales_month
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ),
        2
    ) AS cumulative_sales
FROM monthly_sales
ORDER BY sales_month;