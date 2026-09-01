-- ============================================================
-- PRODUCT ANALYSIS
-- ============================================================

-- Product revenue
SELECT
    p.product_id,
    p.product_name,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM products p
JOIN ordered_items oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY revenue DESC;

-- Top 10 products by units sold
SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS units_sold
FROM products p
JOIN ordered_items oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY units_sold DESC
LIMIT 10;

-- Products with no sales
SELECT
    p.product_id,
    p.product_name
FROM products p
LEFT JOIN ordered_items oi
    ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

-- Products with low customer satisfaction
SELECT
    p.product_id,
    p.product_name,
    ROUND(AVG(r.`Rating 1-10`), 2) AS average_rating
FROM products p
JOIN customer_orders_review r
    ON p.product_id = r.product_id
GROUP BY
    p.product_id,
    p.product_name
HAVING AVG(r.`Rating 1-10`) < 7
ORDER BY average_rating;
