-- ============================================================
-- DATA CLEANING
-- ============================================================

-- Identify duplicate customer records
SELECT
    customer_id,
    COUNT(*) AS duplicate_count
FROM customer_sweepstakes
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Identify duplicate rows using ROW_NUMBER
SELECT *
FROM
(
    SELECT
        sweepstake_id,
        customer_id,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY sweepstake_id
        ) AS row_num
    FROM customer_sweepstakes
) AS duplicates
WHERE row_num > 1;

-- Standardize phone numbers
SELECT
    phone,
    REGEXP_REPLACE(phone, '[()-/+]', '') AS cleaned_phone
FROM customer_sweepstakes;

-- Standardize state values
SELECT
    state,
    UPPER(state) AS standardized_state
FROM customer_sweepstakes;

-- Convert empty values to NULL
UPDATE customer_sweepstakes
SET phone = NULL
WHERE phone = '';

-- Standardize Yes/No values
UPDATE customer_sweepstakes
SET `Are you over 18?` =
    CASE
        WHEN `Are you over 18?` = 'Yes' THEN 'Y'
        WHEN `Are you over 18?` = 'No' THEN 'N'
        ELSE `Are you over 18?`
    END;

-- ============================================================
-- DATA CLEANING WORKFLOW & VALIDATION
-- Project: Customer & Sales Analytics
-- Tool: MySQL
--
-- Objective:
-- Prepare reliable, analysis-ready data while documenting
-- cleaning decisions and validating the resulting records.
--
-- Workflow:
-- 1. Profile source data
-- 2. Identify duplicates and missing values
-- 3. Standardize formats and categories
-- 4. Apply documented cleaning rules
-- 5. Revalidate cleaned data
-- 6. Confirm readiness for downstream analytics
-- ============================================================

-- Validation 1: Missing customer attributes
SELECT
    COUNT(*) AS total_records,
    SUM(
        CASE
            WHEN first_name IS NULL OR TRIM(first_name) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_first_names,
    SUM(
        CASE
            WHEN last_name IS NULL OR TRIM(last_name) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_last_names,
    SUM(
        CASE
            WHEN phone IS NULL OR TRIM(phone) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_phone_numbers
FROM customers;

-- Validation 2: Duplicate primary-key check
SELECT
    customer_id,
    COUNT(*) AS record_count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Validation 3: Leading/trailing whitespace
SELECT
    customer_id,
    first_name,
    last_name,
    city,
    state
FROM customers
WHERE first_name <> TRIM(first_name) OR last_name <> TRIM(last_name) 
    OR city <> TRIM(city) OR state <> TRIM(state);
