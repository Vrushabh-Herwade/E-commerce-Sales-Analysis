-- 01_orders_analysis.sql
-- Basic overview of orders in Olist data

-- 1. Total number of orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM olist_final;

-- 2. Orders by status
SELECT order_status, COUNT(*) AS order_count
FROM olist_final
GROUP BY order_status
ORDER BY order_count DESC;

-- 3. Orders by month (useful for trends in Power BI)
SELECT
    DATE_FORMAT(order_purchase_timestamp, '%Y-%m') AS order_month,
    COUNT(*) AS orders_in_month
FROM olist_final
GROUP BY order_month
ORDER BY order_month;

-- 4. Average number of items per order
SELECT
    ROUND(AVG(product_qty), 2) AS avg_items_per_order
FROM (
    SELECT order_id, COUNT(*) AS product_qty
    FROM olist_final
    GROUP BY order_id
) AS sub;
