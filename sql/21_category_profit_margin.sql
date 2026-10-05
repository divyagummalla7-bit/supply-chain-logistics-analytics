-- Supply Chain & Logistics Analytics
-- 27 Category Profit Margin Analysis
-- Grain: Product Category
-- Source: supply_chain_clean

SELECT
    `Category Name` AS category_name,
    COUNT(DISTINCT `Order Id`) AS total_orders,
    COUNT(DISTINCT `Order Item Id`) AS total_order_items,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(`Order Profit Per Order`), 2) AS total_profit,
    ROUND(
        (SUM(`Order Profit Per Order`) / NULLIF(SUM(Sales), 0)) * 100,
        2
    ) AS profit_margin_percent
FROM supply_chain_clean
GROUP BY `Category Name`
ORDER BY profit_margin_percent DESC;