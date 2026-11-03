USE bakery;

-- ============================================================
-- DATA PROFILING
-- ============================================================

-- Inspect customer orders
SELECT *
FROM customer_orders;

-- Inspect customers
SELECT *
FROM customers;

-- Inspect products
SELECT *
FROM products;

-- Inspect ordered items
SELECT *
FROM ordered_items;

-- Inspect customer reviews
SELECT *
FROM customer_orders_review;

-- Count customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- Count orders
SELECT COUNT(*) AS total_orders
FROM customer_orders;

-- Count products
SELECT COUNT(*) AS total_products
FROM products;

-- Count reviews
SELECT COUNT(*) AS total_reviews
FROM customer_orders_review;

-- Check customer spending statistics
SELECT
    ROUND(AVG(total_money_spent), 2) AS average_customer_spend,
    MIN(total_money_spent) AS minimum_customer_spend,
    MAX(total_money_spent) AS maximum_customer_spend
FROM customers;

-- Check order statistics
SELECT
    ROUND(AVG(order_total), 2) AS average_order_value,
    MIN(order_total) AS minimum_order_value,
    MAX(order_total) AS maximum_order_value,
    SUM(order_total) AS total_revenue
FROM customer_orders;

-- 1. Order dataset overview
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT order_id) AS unique_orders,
    COUNT(DISTINCT customer_id) AS unique_customers,
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    ROUND(SUM(order_total), 2) AS total_recorded_revenue,
    ROUND(AVG(order_total), 2) AS average_order_value,
    MIN(order_total) AS minimum_order_value,
    MAX(order_total) AS maximum_order_value
FROM customer_orders;

-- 2. Order data completeness
SELECT
    COUNT(*) AS total_records,
    SUM(
        CASE WHEN customer_id IS NULL
             THEN 1 ELSE 0 END
    ) AS missing_customer_ids,
    SUM(
        CASE WHEN product_id IS NULL
             THEN 1 ELSE 0 END
    ) AS missing_product_ids,
    SUM(
        CASE WHEN order_date IS NULL
             THEN 1 ELSE 0 END
    ) AS missing_order_dates,
    SUM(
        CASE WHEN order_total IS NULL
             THEN 1 ELSE 0 END
    ) AS missing_order_totals
FROM customer_orders;

-- 3. Potential order-value anomalies
SELECT
    order_id,
    customer_id,
    order_date,
    order_total
FROM customer_orders
WHERE order_total < 0 OR order_total = 0
ORDER BY order_date;

-- 4. Product inventory overview
SELECT
    COUNT(*) AS total_products, COUNT(DISTINCT product_id) AS unique_products,
    SUM(
        CASE WHEN units_in_stock IS NULL
             THEN 1 ELSE 0 END
    ) AS missing_stock_values,
    SUM(
        CASE WHEN units_in_stock < 0
             THEN 1 ELSE 0 END
    ) AS negative_stock_values,
    MIN(units_in_stock) AS minimum_stock,
    MAX(units_in_stock) AS maximum_stock,
    ROUND(AVG(units_in_stock), 2) AS average_stock
FROM products;
