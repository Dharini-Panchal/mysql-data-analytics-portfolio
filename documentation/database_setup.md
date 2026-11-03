# Database Setup and Project Execution Guide

## 1. Project Overview

This project uses MySQL to explore retail operations through SQL-based data profiling, data quality checks, cleaning validation, sales analysis, customer analysis, product performance, and business insights.

## 2. Prerequisites

Before running the queries, make sure you have:

* MySQL Server installed and running.
* MySQL Workbench or another MySQL client.
* Access to the database and tables required by the SQL scripts.
* The dataset files and permission to use them.

## 3. Database Requirements

The SQL scripts depend on the database schema and table names used in this project.

Before execution, verify that the required tables exist and that their column names match the SQL queries.

Do not assume the scripts will run against a different dataset without adjusting the schema or queries.

## 4. Recommended Execution Order

Run the SQL scripts in this order:

1. `sql/01_data_profiling.sql`
2. `sql/02_data_quality.sql`
3. `sql/03_data_cleaning.sql`
4. `sql/04_customer_analysis.sql`
5. `sql/05_sales_analysis.sql`
6. `sql/06_product_analysis.sql`
7. `sql/07_advanced_analysis.sql`
8. `sql/08_customer_satisfaction.sql`
9. `sql/09_advanced_sql.sql`
10. `sql/10_business_insights.sql`

**Important:** Confirm the actual filenames in your repository before using this sequence. If any filename differs, update this list to match.

## 5. Validation and Interpretation

* Review data quality results before interpreting business metrics.
* Check for missing values, duplicates, invalid formats, and unusual values.
* Treat unusual values as items to investigate rather than automatically assuming they are errors.
* Confirm that revenue and inventory calculations use the intended definitions.
* Document assumptions and thresholds used in the analysis.
* Validate query results before adding numerical findings to the executive summary.

## 6. Reproducibility Notes

Results may vary if the underlying dataset, schema, data types, or cleaning decisions change.

This repository documents the SQL analysis workflow. Any results presented should correspond to the actual queries and dataset used.

## 7. Data Source and Limitations

Document the dataset's original source, license, and any attribution requirements here.

If the source or license has not yet been verified, state that clearly rather than assuming the data is public or unrestricted.

This project demonstrates SQL analysis skills using the available dataset. Business recommendations are analytical suggestions, not proof that real-world operational changes have been implemented.
