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
