-- ✅ 1. Average shipping time (seller → customer)
SELECT 
    ROUND(AVG(delivery_time_days), 2) AS avg_delivery_time_days
FROM olist_final
WHERE is_delivered = 1;

-- ✅ 2. Average customer wait time (purchase → delivery)
SELECT 
    ROUND(AVG(customer_wait_time), 2) AS avg_customer_wait_time_days
FROM olist_final
WHERE is_delivered = 1;

-- ✅ 3. Average delay vs estimate
SELECT 
    ROUND(AVG(delay_vs_estimate), 2) AS avg_delay_vs_estimate_days
FROM olist_final
WHERE is_delivered = 1;

-- ✅ 4. Percentage of late deliveries
SELECT 
    ROUND(100 * SUM(is_late) / COUNT(*), 2) AS late_delivery_percentage
FROM olist_final
WHERE is_delivered = 1;

-- ✅ 5. Percentage of fast shipping
SELECT 
    ROUND(100 * SUM(is_fast_shipping) / COUNT(*), 2) AS fast_shipping_percentage
FROM olist_final
WHERE is_delivered = 1;

-- ✅ 6. Delivery time by order status (optional)
SELECT 
    order_status,
    COUNT(*) AS total_orders,
    ROUND(AVG(delivery_time_days), 2) AS avg_delivery_time
FROM olist_final
WHERE is_delivered = 1
GROUP BY order_status
ORDER BY total_orders DESC;

-- ✅ 7. Trend: average delay over time (month-wise)
SELECT 
    DATE_FORMAT(order_purchase_timestamp, '%Y-%m') AS order_month,
    ROUND(AVG(delay_vs_estimate), 2) AS avg_delay
FROM olist_final
WHERE is_delivered = 1
GROUP BY order_month
ORDER BY order_month;
