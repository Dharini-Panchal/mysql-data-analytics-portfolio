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
