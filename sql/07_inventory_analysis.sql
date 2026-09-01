-- ============================================================
-- INVENTORY ANALYSIS
-- ============================================================

-- Current inventory
SELECT
    product_id,
    product_name,
    units_in_stock,
    sale_price
FROM products
ORDER BY units_in_stock;

-- Products with low inventory
SELECT
    product_id,
    product_name,
    units_in_stock
FROM products
WHERE units_in_stock < 10
ORDER BY units_in_stock;

-- Sales vs inventory
SELECT
    p.product_id,
    p.product_name,
    p.units_in_stock,
    SUM(oi.quantity) AS units_sold
FROM products p
JOIN ordered_items oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.units_in_stock
ORDER BY units_sold DESC;

-- High-sales / low-inventory products
SELECT
    p.product_id,
    p.product_name,
    p.units_in_stock,
    SUM(oi.quantity) AS units_sold
FROM products p
JOIN ordered_items oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.units_in_stock
HAVING SUM(oi.quantity) > 10
   AND p.units_in_stock < 10
ORDER BY units_sold DESC;
