-- ✅ 1. Total number of unique product categories
SELECT COUNT(DISTINCT product_category_name) AS total_categories
FROM olist_final;

-- ✅ 2. Top 10 most sold categories by item count
SELECT 
    product_category_name,
    COUNT(*) AS items_sold
FROM olist_final
GROUP BY product_category_name
ORDER BY items_sold DESC
LIMIT 10;

-- ✅ 3. Top 10 categories by total revenue
SELECT 
    product_category_name,
    ROUND(SUM(price), 2) AS total_revenue
FROM olist_final
GROUP BY product_category_name
ORDER BY total_revenue DESC
LIMIT 10;

-- ✅ 4. Average delay by category (only for delivered orders)
SELECT 
    product_category_name,
    ROUND(AVG(delay_vs_estimate), 2) AS avg_delay_days,
    ROUND(100 * SUM(is_late)/COUNT(*), 2) AS late_pct,
    COUNT(*) AS total_orders
FROM olist_final
WHERE is_delivered = 1
GROUP BY product_category_name
HAVING total_orders >= 20
ORDER BY avg_delay_days DESC
LIMIT 10;

-- ✅ 5. Fast shipping rate per category
SELECT 
    product_category_name,
    ROUND(100 * SUM(is_fast_shipping)/COUNT(*), 2) AS fast_shipping_pct,
    COUNT(*) AS total_orders
FROM olist_final
GROUP BY product_category_name
HAVING total_orders >= 20
ORDER BY fast_shipping_pct DESC
LIMIT 10;

-- ✅ 6. Avg price and avg freight per category
SELECT 
    product_category_name,
    ROUND(AVG(price), 2) AS avg_price,
    ROUND(AVG(freight_value), 2) AS avg_freight,
    COUNT(*) AS total_orders
FROM olist_final
GROUP BY product_category_name
HAVING total_orders >= 20
ORDER BY avg_price DESC
LIMIT 10;
