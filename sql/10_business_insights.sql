-- ============================================================
-- BUSINESS INSIGHT 1
-- High-Value Customers
--
-- Business Question:
-- Which customers generate the highest recorded revenue?
--
-- Business Use:
-- Identify customers who may warrant retention and
-- relationship-management attention.
-- ============================================================

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    ROUND(SUM(co.order_total), 2) AS total_revenue,
    COUNT(co.order_id) AS order_count,
    ROUND(AVG(co.order_total), 2) AS average_order_value
FROM customers c
INNER JOIN customer_orders co
    ON c.customer_id = co.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_revenue DESC
LIMIT 10;

-- ============================================================
-- BUSINESS INSIGHT 2
-- Repeat Customer Analysis
--
-- Business Question:
-- Which customers have placed multiple orders?
--
-- Business Use:
-- Identify customers demonstrating repeat purchasing behaviour.
-- ============================================================

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(co.order_id) AS order_count,
    ROUND(SUM(co.order_total), 2) AS total_revenue,
    ROUND(AVG(co.order_total), 2) AS average_order_value
FROM customers c
INNER JOIN customer_orders co
    ON c.customer_id = co.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(co.order_id) > 1
ORDER BY total_revenue DESC;

-- ============================================================
-- BUSINESS INSIGHT 3
-- High-Value Customers with Declining Order Values
--
-- Business Question:
-- Which customers have meaningful historical spending but
-- show a decline in their most recent order value?
--
-- Business Use:
-- Identify potential customer-retention signals.
-- ============================================================

WITH customer_orders_ranked AS (
    SELECT
        customer_id,
        order_id,
        order_date,
        order_total,

        LAG(order_total) OVER (
            PARTITION BY customer_id
            ORDER BY order_date, order_id
        ) AS previous_order_value
    FROM customer_orders
),

customer_summary AS (
    SELECT
        customer_id,
        SUM(order_total) AS total_revenue,
        MAX(order_date) AS most_recent_order,
        MAX(
            CASE
                WHEN order_total < previous_order_value
                THEN 1
                ELSE 0
            END
        ) AS has_declining_order
    FROM customer_orders_ranked
    GROUP BY customer_id
)

SELECT
    customer_id,
    ROUND(total_revenue, 2) AS total_revenue,
    most_recent_order
FROM customer_summary
WHERE total_revenue > (
    SELECT AVG(total_revenue)
    FROM customer_summary
)
AND has_declining_order = 1
ORDER BY total_revenue DESC;

-- ============================================================
-- BUSINESS INSIGHT 4
-- High-Sales / Low-Inventory Products
--
-- Business Question:
-- Which products demonstrate strong sales activity while
-- maintaining relatively low inventory?
--
-- Business Use:
-- Identify products that may require inventory monitoring.
-- ============================================================

SELECT
    p.product_id,
    p.product_name,
    p.units_in_stock,
    SUM(oi.quantity) AS units_sold,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS sales_revenue
FROM products p
INNER JOIN ordered_items oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.units_in_stock
HAVING
    SUM(oi.quantity) > 0
    AND p.units_in_stock <= 10
ORDER BY
    units_sold DESC,
    sales_revenue DESC;

-- ============================================================
-- BUSINESS INSIGHT 5
-- Low Customer Satisfaction Products
--
-- Business Question:
-- Which products have weaker customer ratings?
--
-- Business Use:
-- Prioritize products for quality, pricing, service,
-- or customer-experience investigation.
-- ============================================================

SELECT
    cor.product_id,
    COUNT(*) AS review_count,
    ROUND(AVG(cor.`Rating 1-10`), 2) AS average_rating
FROM customer_orders_review cor
GROUP BY cor.product_id
HAVING
    COUNT(*) >= 2
    AND AVG(cor.`Rating 1-10`) < 6
ORDER BY
    average_rating ASC,
    review_count DESC;

-- ============================================================
-- BUSINESS INSIGHT 6
-- High-Value Customers with Lower Satisfaction
--
-- Business Question:
-- Are high-value customers also experiencing lower
-- satisfaction?
--
-- Business Use:
-- Prioritize potentially important customers for
-- retention and customer-experience investigation.
-- ============================================================

WITH customer_spending AS (
    SELECT
        customer_id,
        SUM(order_total) AS total_revenue
    FROM customer_orders
    GROUP BY customer_id
),

customer_ratings AS (
    SELECT
        customer_id,
        AVG(`Rating 1-10`) AS average_rating,
        COUNT(*) AS review_count
    FROM customer_orders_review
    GROUP BY customer_id
)

SELECT
    cs.customer_id,
    ROUND(cs.total_revenue, 2) AS total_revenue,
    ROUND(cr.average_rating, 2) AS average_rating,
    cr.review_count
FROM customer_spending cs
INNER JOIN customer_ratings cr
    ON cs.customer_id = cr.customer_id
WHERE cs.total_revenue > (
    SELECT AVG(total_revenue)
    FROM customer_spending
)
AND cr.average_rating < 6
ORDER BY
    cs.total_revenue DESC;

-- ============================================================
-- BUSINESS INSIGHT 7
-- Revenue Concentration
--
-- Business Question:
-- How much revenue is generated by the highest-value
-- customers?
--
-- Business Use:
-- Understand revenue concentration and customer dependency.
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
        total_revenue,
        ROW_NUMBER() OVER (
            ORDER BY total_revenue DESC
        ) AS customer_rank
    FROM customer_revenue
),

total_business_revenue AS (
    SELECT
        SUM(total_revenue) AS total_revenue
    FROM customer_revenue
)

SELECT
    rc.customer_rank,
    rc.customer_id,
    ROUND(rc.total_revenue, 2) AS customer_revenue,
    ROUND(
        rc.total_revenue /
        tbr.total_revenue * 100,
        2
    ) AS revenue_percentage
FROM ranked_customers rc
CROSS JOIN total_business_revenue tbr
WHERE rc.customer_rank <= 10
ORDER BY rc.customer_rank;

-- ============================================================
-- BUSINESS INSIGHT 8
-- Product Revenue Ranking
--
-- Business Question:
-- Which products generate the most sales revenue?
--
-- Business Use:
-- Support product prioritization and sales planning.
-- ============================================================

WITH product_sales AS (
    SELECT
        p.product_id,
        p.product_name,
        SUM(oi.quantity) AS units_sold,
        SUM(oi.quantity * oi.unit_price) AS revenue
    FROM products p
    INNER JOIN ordered_items oi
        ON p.product_id = oi.product_id
    GROUP BY
        p.product_id,
        p.product_name
)

SELECT
    product_id,
    product_name,
    units_sold,
    ROUND(revenue, 2) AS revenue,
    DENSE_RANK() OVER (
        ORDER BY revenue DESC
    ) AS revenue_rank
FROM product_sales
ORDER BY revenue_rank;

-- ============================================================
-- BUSINESS INSIGHT 9
-- Product Business Priority
--
-- Business Question:
-- Which products should receive additional attention based
-- on sales performance, inventory, and customer satisfaction?
--
-- Business Use:
-- Create a starting point for product-level investigation.
-- ============================================================

WITH product_sales AS (
    SELECT
        p.product_id,
        p.product_name,
        p.units_in_stock,
        SUM(oi.quantity) AS units_sold,
        SUM(oi.quantity * oi.unit_price) AS revenue
    FROM products p
    INNER JOIN ordered_items oi
        ON p.product_id = oi.product_id
    GROUP BY
        p.product_id,
        p.product_name,
        p.units_in_stock
),

product_reviews AS (
    SELECT
        product_id,
        AVG(`Rating 1-10`) AS average_rating
    FROM customer_orders_review
    GROUP BY product_id
)

SELECT
    ps.product_id,
    ps.product_name,
    ps.units_sold,
    ps.units_in_stock,
    ROUND(ps.revenue, 2) AS revenue,
    ROUND(pr.average_rating, 2) AS average_rating,

    CASE
        WHEN ps.units_sold > 0
             AND ps.units_in_stock <= 10
             AND pr.average_rating < 6
            THEN 'High Priority'

        WHEN ps.units_sold > 0
             AND ps.units_in_stock <= 10
            THEN 'Inventory Review'

        WHEN pr.average_rating < 6
            THEN 'Customer Experience Review'

        ELSE 'Monitor'
    END AS business_priority

FROM product_sales ps
LEFT JOIN product_reviews pr
    ON ps.product_id = pr.product_id
ORDER BY
    CASE
        WHEN ps.units_sold > 0
             AND ps.units_in_stock <= 10
             AND pr.average_rating < 6
            THEN 1
        WHEN ps.units_sold > 0
             AND ps.units_in_stock <= 10
            THEN 2
        WHEN pr.average_rating < 6
            THEN 3
        ELSE 4
    END,
    ps.revenue DESC;
