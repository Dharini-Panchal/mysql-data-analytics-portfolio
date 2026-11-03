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
WHERE phone IS NULL OR phone = '';

-- Potentially invalid phone numbers
SELECT
    customer_id,
    phone
FROM customers
WHERE phone IS NOT NULL AND phone NOT REGEXP '^[0-9+() -]+$';

-- Customer names requiring review
SELECT
    customer_id,
    first_name,
    last_name
FROM customers
WHERE first_name NOT REGEXP '^[A-Za-z -]+$' OR last_name NOT REGEXP '^[A-Za-z -]+$';

-- Missing order tips
SELECT
    COUNT(*) AS missing_tip_records
FROM customer_orders
WHERE tip IS NULL OR tip = '';

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
WHERE sale_price IS NULL OR sale_price < 0;

-- ============================================================
-- DATA QUALITY SUMMARY
--
-- Purpose:
-- Summarize potential data-quality issues before analysis.
-- ============================================================

SELECT
    COUNT(*) AS total_customer_records,
    SUM(
        CASE
            WHEN phone IS NULL OR TRIM(phone) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_phone_count,
    SUM(
        CASE
            WHEN phone IS NOT NULL AND TRIM(phone) <> '' AND phone NOT REGEXP '^[0-9+(). -]+$'
            THEN 1 ELSE 0
        END
    ) AS potentially_invalid_phone_count,
    SUM(
        CASE
            WHEN first_name IS NULL OR TRIM(first_name) = ''  OR last_name IS NULL  OR TRIM(last_name) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_name_count
FROM customers;