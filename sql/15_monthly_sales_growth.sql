-- Supply Chain & Logistics Analytics
-- 21 Monthly Sales Growth Analysis
-- Demonstrates LAG() and percentage growth
-- Grain: Month
-- Source: supply_chain_clean

WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(order_datetime, '%Y-%m') AS sales_month,
        ROUND(SUM(Sales), 2) AS total_sales
    FROM supply_chain_clean
    GROUP BY DATE_FORMAT(order_datetime, '%Y-%m')
),
sales_growth AS (
    SELECT
        sales_month,
        total_sales,
        LAG(total_sales) OVER (
            ORDER BY sales_month
        ) AS previous_month_sales
    FROM monthly_sales
)
SELECT
    sales_month,
    total_sales,
    ROUND(previous_month_sales, 2) AS previous_month_sales,
    ROUND(
        total_sales - previous_month_sales,
        2
    ) AS sales_change,
    ROUND(
        ((total_sales - previous_month_sales)
        / NULLIF(previous_month_sales, 0)) * 100,
        2
    ) AS growth_percent
FROM sales_growth
ORDER BY sales_month;