-- ✅ 1. Total number of unique sellers
SELECT COUNT(DISTINCT seller_id) AS total_unique_sellers
FROM olist_final;

-- ✅ 2. Top 10 sellers by number of items sold
SELECT 
    seller_id,
    COUNT(*) AS total_items_sold
FROM olist_final
GROUP BY seller_id
ORDER BY total_items_sold DESC
LIMIT 10;

-- ✅ 3. Top 10 sellers by total revenue
SELECT 
    seller_id,
    ROUND(SUM(price), 2) AS total_revenue
FROM olist_final
GROUP BY seller_id
ORDER BY total_revenue DESC
LIMIT 10;

-- ✅ 4. Seller performance: delivery metrics (delay, fast shipping)
SELECT 
    seller_id,
    COUNT(*) AS total_orders,
    ROUND(AVG(delivery_time_days), 2) AS avg_delivery_days,
    ROUND(100 * SUM(is_late)/COUNT(*), 2) AS late_delivery_pct,
    ROUND(100 * SUM(is_fast_shipping)/COUNT(*), 2) AS fast_shipping_pct
FROM olist_final
WHERE is_delivered = 1
GROUP BY seller_id
ORDER BY total_orders DESC
LIMIT 10;

-- ✅ 5. Top sellers by customer wait time (lowest wait time = better)
SELECT 
    seller_id,
    ROUND(AVG(customer_wait_time), 2) AS avg_wait_time,
    COUNT(*) AS orders
FROM olist_final
WHERE is_delivered = 1
GROUP BY seller_id
HAVING COUNT(*) >= 20
ORDER BY avg_wait_time ASC
LIMIT 10;

-- ✅ 6. Seller freight cost share (average)
SELECT 
    seller_id,
    ROUND(AVG(freight_share), 2) AS avg_freight_share,
    COUNT(*) AS orders
FROM olist_final
GROUP BY seller_id
HAVING COUNT(*) >= 20
ORDER BY avg_freight_share DESC
LIMIT 10;
