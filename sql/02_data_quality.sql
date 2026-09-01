USE bakery;

-- ============================================================
-- DATA QUALITY ASSESSMENT
-- ============================================================

-- Missing customer phone numbers
SELECT
    customer_id,
    first_name,
    last_name,
    phone
FROM customers
WHERE phone IS NULL
   OR phone = '';

-- Potentially invalid phone numbers
SELECT
    customer_id,
    phone
FROM customers
WHERE phone IS NOT NULL
  AND phone NOT REGEXP '^[0-9+() -]+$';

-- Customer names requiring review
SELECT
    customer_id,
    first_name,
    last_name
FROM customers
WHERE first_name NOT REGEXP '^[A-Za-z -]+$'
   OR last_name NOT REGEXP '^[A-Za-z -]+$';

-- Missing order tips
SELECT
    COUNT(*) AS missing_tip_records
FROM customer_orders
WHERE tip IS NULL
   OR tip = '';

-- Check customer orders for missing customer IDs
SELECT *
FROM customer_orders
WHERE customer_id IS NULL;

-- Check products for missing inventory values
SELECT *
FROM products
WHERE units_in_stock IS NULL;

-- Check products for invalid prices
SELECT *
FROM products
WHERE sale_price IS NULL
   OR sale_price < 0;
