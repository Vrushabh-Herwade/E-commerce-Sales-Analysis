-- ✅ 1. Total number of unique customers
SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM olist_final;

-- ✅ 2. Top 10 states by number of customers
SELECT 
    customer_state,
    COUNT(DISTINCT customer_id) AS total_customers
FROM olist_final
GROUP BY customer_state
ORDER BY total_customers DESC
LIMIT 10;

-- ✅ 3. Top 10 customer cities by order count
SELECT 
    customer_city,
    COUNT(order_id) AS total_orders
FROM olist_final
GROUP BY customer_city
ORDER BY total_orders DESC
LIMIT 10;

-- ✅ 4. Average customer wait time by state
SELECT 
    customer_state,
    ROUND(AVG(customer_wait_time), 2) AS avg_wait_days,
    COUNT(*) AS total_orders
FROM olist_final
GROUP BY customer_state
HAVING total_orders >= 20
ORDER BY avg_wait_days DESC;

-- ✅ 5. Top 10 highest spending customers
SELECT 
    customer_id,
    ROUND(SUM(total_order_value), 2) AS total_spent,
    COUNT(order_id) AS total_orders
FROM olist_final
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

-- ✅ 6. Average number of items per customer
SELECT 
    ROUND(AVG(num_items), 2) AS avg_items_per_order
FROM olist_final;

-- ✅ 7. Order status breakdown
SELECT 
    order_status,
    COUNT(*) AS count_orders,
    ROUND(100 * COUNT(*) / (SELECT COUNT(*) FROM olist_final), 2) AS percentage
FROM olist_final
GROUP BY order_status
ORDER BY count_orders DESC;
