
-- 11_final_validation.sql
-- Purpose: Final checks before publishing the project.
-- These checks are read-only and do not modify data.

-- 1. Confirm the main tables contain records.
SELECT 'customers' AS table_name, COUNT(*) AS row_count
FROM customers
UNION ALL
SELECT 'customer_orders', COUNT(*)
FROM customer_orders
UNION ALL
SELECT 'products', COUNT(*)
FROM products
UNION ALL
SELECT 'ordered_items', COUNT(*)
FROM ordered_items
UNION ALL
SELECT 'customer_orders_review', COUNT(*)
FROM customer_orders_review;

-- 2. Check whether order identifiers are duplicated.
-- Interpret this according to whether order_id should identify
-- an order or whether the table stores multiple rows per order.
SELECT
    order_id,
    COUNT(*) AS record_count
FROM customer_orders
GROUP BY order_id
HAVING COUNT(*) > 1
ORDER BY record_count DESC;

-- 3. Check for missing critical order fields.
SELECT
    SUM(order_id IS NULL) AS null_order_id,
    SUM(customer_id IS NULL) AS null_customer_id,
    SUM(product_id IS NULL) AS null_product_id,
    SUM(order_date IS NULL) AS null_order_date,
    SUM(order_total IS NULL) AS null_order_total
FROM customer_orders;

-- 4. Review unusual recorded order totals.
-- These are investigation flags, not automatic proof of errors.
SELECT *
FROM customer_orders
WHERE order_total <= 0
ORDER BY order_total;

-- 5. Review negative or missing inventory values.
SELECT
    product_id,
    product_name,
    units_in_stock
FROM products
WHERE units_in_stock IS NULL
   OR units_in_stock < 0
ORDER BY units_in_stock;

-- 6. Review customer review ratings outside the expected 1–10 range.
-- Confirm the source data type and exact rating column name first.
SELECT *
FROM customer_orders_review
WHERE `Rating 1-10` IS NOT NULL
  AND (
      `Rating 1-10` < 1
      OR `Rating 1-10` > 10
  );
