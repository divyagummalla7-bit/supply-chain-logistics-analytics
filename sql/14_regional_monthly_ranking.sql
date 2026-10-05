-- Supply Chain & Logistics Analytics
-- 20 Regional Monthly Sales Ranking
-- Demonstrates RANK() window function
-- Grain: Region + Month
-- Source: supply_chain_clean

WITH regional_monthly_sales AS (
    SELECT
        `Order Region` AS order_region,
        DATE_FORMAT(order_datetime, '%Y-%m') AS sales_month,
        ROUND(SUM(Sales), 2) AS total_sales
    FROM supply_chain_clean
    GROUP BY
        `Order Region`,
        DATE_FORMAT(order_datetime, '%Y-%m')
)
SELECT
    order_region,
    sales_month,
    total_sales,
    RANK() OVER (
        PARTITION BY sales_month
        ORDER BY total_sales DESC
    ) AS monthly_sales_rank
FROM regional_monthly_sales
ORDER BY
    sales_month,
    monthly_sales_rank;