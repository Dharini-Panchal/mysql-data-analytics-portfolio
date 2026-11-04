# Data Source and Project Limitations

## Dataset Source

* **Dataset name:** mysql-data-analytics-portfolio
* **Data format:** SQL
* **Database:** MySQL

## Project Scope

This project demonstrates SQL-based analysis of customer activity, orders, sales, product performance, inventory, customer ratings, and data quality.

The analysis is limited to the tables, fields, and records available in the dataset.

## Analytical Limitations

1. Recorded customer spending may differ from revenue calculated from order-line records. The definitions and reconciliation should be documented.
2. A single snapshot of customer data cannot, by itself, establish that a customer has churned.
3. Low inventory is a potential risk indicator, not proof of lost sales.
4. Customer ratings show recorded feedback but do not establish the cause of dissatisfaction.
5. Business thresholds used in the analysis are project-defined assumptions unless supported by a documented business standard.
6. Missing or invalid records may affect calculations. Relevant limitations should be described alongside findings.
7. Recommendations are proposed actions for further investigation; they do not represent implemented business changes.

## Reproducibility

Query results depend on the database schema, source records, data types, SQL version, and cleaning assumptions. Results reported in this repository should be traceable to the queries and dataset used.

## Privacy and Redistribution

Do not commit real personal, confidential, or restricted data. Include only data you are permitted to share, and document any masking, exclusion, or aggregation performed.
