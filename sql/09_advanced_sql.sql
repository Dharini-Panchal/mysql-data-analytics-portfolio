-- ============================================================
-- ADVANCED SQL ANALYSIS
-- ============================================================

-- Rank customers by spending
SELECT
    customer_id,
    first_name,
    last_name,
    total_money_spent,
    RANK() OVER (
        ORDER BY total_money_spent DESC
    ) AS spending_rank
FROM customers;

-- Rank products by revenue
SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS revenue,
    DENSE_RANK() OVER (
        ORDER BY SUM(oi.quantity * oi.unit_price) DESC
    ) AS revenue_rank
FROM products p
JOIN ordered_items oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name;

-- Customer order sequence
SELECT
    customer_id,
    order_id,
    order_date,
    order_total,
    ROW_NUMBER() OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS order_number
FROM customer_orders;

-- Previous customer order
SELECT
    customer_id,
    order_id,
    order_date,
    order_total,
    LAG(order_total) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS previous_order_value
FROM customer_orders;

-- Compare current order with previous order
SELECT
    customer_id,
    order_id,
    order_date,
    order_total,
    LAG(order_total) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS previous_order_value,
    order_total -
    LAG(order_total) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS order_value_change
FROM customer_orders;

-- Customers spending above the average
SELECT
    customer_id,
    first_name,
    last_name,
    total_money_spent
FROM customers
WHERE total_money_spent >
(
    SELECT AVG(total_money_spent)
    FROM customers
)
ORDER BY total_money_spent DESC;


-- ============================================================
-- 10. CTE: Customers Spending Above Average
-- Business Question:
-- Which customers have total spending above the average
-- customer spending level?
-- ============================================================

WITH customer_revenue AS (
    SELECT
        customer_id,
        SUM(order_total) AS total_revenue
    FROM customer_orders
    GROUP BY customer_id
)

SELECT
    customer_id,
    ROUND(total_revenue, 2) AS total_revenue
FROM customer_revenue
WHERE total_revenue > (
    SELECT AVG(total_revenue)
    FROM customer_revenue
)
ORDER BY total_revenue DESC;
