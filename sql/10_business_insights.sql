-- ============================================================
-- BUSINESS INSIGHTS
-- ============================================================

-- High-value customers with multiple orders
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS order_count,
    ROUND(SUM(o.order_total), 2) AS total_revenue
FROM customers c
JOIN customer_orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(o.order_id) > 1
ORDER BY total_revenue DESC;

-- Products with high sales but low customer ratings
SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS units_sold,
    ROUND(AVG(r.`Rating 1-10`), 2) AS average_rating
FROM products p
JOIN ordered_items oi
    ON p.product_id = oi.product_id
JOIN customer_orders_review r
    ON p.product_id = r.product_id
GROUP BY
    p.product_id,
    p.product_name
HAVING SUM(oi.quantity) >
(
    SELECT AVG(product_sales)
    FROM
    (
        SELECT
            SUM(quantity) AS product_sales
        FROM ordered_items
        GROUP BY product_id
    ) AS sales
)
AND AVG(r.`Rating 1-10`) <
(
    SELECT AVG(`Rating 1-10`)
    FROM customer_orders_review
)
ORDER BY units_sold DESC;
