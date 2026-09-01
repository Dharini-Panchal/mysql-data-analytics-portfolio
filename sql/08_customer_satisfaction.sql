-- ============================================================
-- CUSTOMER SATISFACTION ANALYSIS
-- ============================================================

-- Average customer rating
SELECT
    ROUND(AVG(`Rating 1-10`), 2) AS average_rating
FROM customer_orders_review;

-- Rating distribution
SELECT
    `Rating 1-10` AS rating,
    COUNT(*) AS review_count
FROM customer_orders_review
GROUP BY `Rating 1-10`
ORDER BY rating;

-- Products with lowest average ratings
SELECT
    product_id,
    ROUND(AVG(`Rating 1-10`), 2) AS average_rating
FROM customer_orders_review
GROUP BY product_id
ORDER BY average_rating
LIMIT 10;

-- Low satisfaction customers
SELECT
    customer_id,
    COUNT(*) AS review_count,
    ROUND(AVG(`Rating 1-10`), 2) AS average_rating
FROM customer_orders_review
GROUP BY customer_id
HAVING AVG(`Rating 1-10`) < 6
ORDER BY average_rating;

-- High-spending customers with low satisfaction
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.total_money_spent,
    ROUND(AVG(r.`Rating 1-10`), 2) AS average_rating
FROM customers c
JOIN customer_orders o
    ON c.customer_id = o.customer_id
JOIN customer_orders_review r
    ON o.order_id = r.order_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    c.total_money_spent
HAVING c.total_money_spent > 500
   AND AVG(r.`Rating 1-10`) < 5
ORDER BY c.total_money_spent DESC;
