USE bakery;

-- ============================================================
-- CUSTOMER ANALYSIS
-- ============================================================

-- Total customers
SELECT
    COUNT(*) AS total_customers
FROM customers;

-- Average customer spending
SELECT
    ROUND(AVG(total_money_spent), 2) AS average_customer_spend
FROM customers;

-- Top 10 highest-value customers
SELECT
    customer_id,
    first_name,
    last_name,
    total_money_spent
FROM customers
ORDER BY total_money_spent DESC
LIMIT 10;

-- Customers spending more than $1,000
SELECT
    customer_id,
    first_name,
    last_name,
    total_money_spent
FROM customers
WHERE total_money_spent > 1000
ORDER BY total_money_spent DESC;

-- Customer segmentation
SELECT
    customer_id,
    first_name,
    last_name,
    total_money_spent,
    CASE
        WHEN total_money_spent >= 1000 THEN 'High Value'
        WHEN total_money_spent >= 500 THEN 'Medium Value'
        WHEN total_money_spent >= 100 THEN 'Low Value'
        ELSE 'Very Low'
    END AS customer_segment
FROM customers
ORDER BY total_money_spent DESC;

-- Customers who have never placed an order
SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM customers c
LEFT JOIN customer_orders co
    ON c.customer_id = co.customer_id
WHERE co.order_id IS NULL;
