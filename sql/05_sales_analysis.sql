-- ============================================================
-- SALES ANALYSIS
-- ============================================================

-- Total revenue
SELECT
    ROUND(SUM(order_total), 2) AS total_revenue
FROM customer_orders;

-- Average order value
SELECT
    ROUND(AVG(order_total), 2) AS average_order_value
FROM customer_orders;

-- Total number of orders
SELECT
    COUNT(*) AS total_orders
FROM customer_orders;

-- Revenue by date
SELECT
    order_date,
    ROUND(SUM(order_total), 2) AS daily_revenue
FROM customer_orders
GROUP BY order_date
ORDER BY order_date;

-- Top 10 highest-value orders
SELECT
    order_id,
    customer_id,
    order_date,
    order_total
FROM customer_orders
ORDER BY order_total DESC
LIMIT 10;

-- Revenue by customer
SELECT
    customer_id,
    ROUND(SUM(order_total), 2) AS customer_revenue
FROM customer_orders
GROUP BY customer_id
ORDER BY customer_revenue DESC;

-- Customers with multiple orders
SELECT
    customer_id,
    COUNT(*) AS order_count,
    ROUND(SUM(order_total), 2) AS total_revenue
FROM customer_orders
GROUP BY customer_id
HAVING COUNT(*) > 1
ORDER BY total_revenue DESC;
