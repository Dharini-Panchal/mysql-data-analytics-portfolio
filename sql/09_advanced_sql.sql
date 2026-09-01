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
-- CTE: Customers Spending Above Average
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

-- ============================================================
-- CTE: Customer Value Segmentation
-- Business Question:
-- How can customers be grouped by total recorded spending?
-- ============================================================

WITH customer_revenue AS (
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        COALESCE(SUM(co.order_total), 0) AS total_revenue
    FROM customers c
    LEFT JOIN customer_orders co
        ON c.customer_id = co.customer_id
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name
)

SELECT
    customer_id,
    customer_name,
    ROUND(total_revenue, 2) AS total_revenue,
    CASE
        WHEN total_revenue >= 500 THEN 'High Value'
        WHEN total_revenue >= 200 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customer_revenue
ORDER BY total_revenue DESC;

-- ============================================================
-- Customer Order Value Change
-- Business Question:
-- Which customers show a decline in order value compared
-- with their previous purchase?
-- ============================================================

SELECT
    customer_id,
    order_id,
    order_date,
    order_total,

    LAG(order_total) OVER (
        PARTITION BY customer_id
        ORDER BY order_date, order_id
    ) AS previous_order_value,

    ROUND(
        order_total -
        LAG(order_total) OVER (
            PARTITION BY customer_id
            ORDER BY order_date, order_id
        ),
        2
    ) AS order_value_change,

    CASE
        WHEN order_total >
             LAG(order_total) OVER (
                 PARTITION BY customer_id
                 ORDER BY order_date, order_id
             )
            THEN 'Increasing'

        WHEN order_total <
             LAG(order_total) OVER (
                 PARTITION BY customer_id
                 ORDER BY order_date, order_id
             )
            THEN 'Declining'

        ELSE 'No Change'
    END AS purchase_trend

FROM customer_orders
ORDER BY customer_id, order_date, order_id;

-- ============================================================
-- Top Customers by Revenue
-- Business Question:
-- Who are the highest-value customers?
-- ============================================================

WITH customer_revenue AS (
    SELECT
        customer_id,
        SUM(order_total) AS total_revenue
    FROM customer_orders
    GROUP BY customer_id
),

ranked_customers AS (
    SELECT
        customer_id,
        ROUND(total_revenue, 2) AS total_revenue,
        DENSE_RANK() OVER (
            ORDER BY total_revenue DESC
        ) AS revenue_rank
    FROM customer_revenue
)

SELECT
    customer_id,
    total_revenue,
    revenue_rank
FROM ranked_customers
WHERE revenue_rank <= 3
ORDER BY revenue_rank;
