# MySQL Data Analytics Portfolio: Retail Operations

A SQL-based analytics project exploring retail sales, customer behaviour, product performance, inventory, and customer satisfaction using MySQL.

## Business Objective

How can retail data help a business understand sales performance, identify inventory concerns, evaluate customer behaviour, and prioritize areas for further investigation?

This project uses structured SQL queries to examine these questions and translate the analysis into potential business recommendations.

## Tools and Technical Skills

* **Database:** MySQL
* **Querying:** SELECT, WHERE, GROUP BY, HAVING, JOINs, subqueries, and Common Table Expressions (CTEs)
* **Advanced SQL:** Window functions, ranking, LAG, aggregations, and comparative analysis
* **Data Quality:** Missing-value checks, duplicate checks, format validation, and anomaly investigation
* **Documentation:** KPI definitions, data quality reporting, cleaning decisions, and business insights

*Only retain skills that are demonstrated in the SQL files in this repository.*

## Project Workflow

1. **Data profiling:** Examine table structure, record counts, date ranges, and key metrics.
2. **Data quality assessment:** Investigate missing values, duplicates, invalid formats, and unusual values.
3. **Cleaning validation:** Document cleaning decisions and validate the resulting data.
4. **Exploratory analysis:** Examine customer, sales, product, and satisfaction patterns.
5. **Advanced SQL analysis:** Use CTEs and window functions for customer comparisons, rankings, and changes over time.
6. **Business insights:** Identify patterns and potential priorities for management to investigate.
7. **Documentation:** Record assumptions, KPIs, limitations, and recommendations.

## Business Questions

* Which customers contribute the most recorded spending?
* How do order values change over time?
* Which products generate the most revenue?
* Which products may need inventory review?
* Which products have lower customer satisfaction ratings?
* How concentrated is recorded revenue among customers?
* What should management investigate based on the analysis?

## Repository Guide

| Folder or file   | Purpose                                                                            |
| ---------------- | ---------------------------------------------------------------------------------- |
| `sql/`           | SQL profiling, quality checks, analysis, and business insight queries              |
| `documentation/` | Data model, KPI framework, cleaning decisions, setup instructions, and methodology |
| `results/`       | Query outputs and executive summary                                                |
| `data/`          | Dataset files or data-related documentation, as included in the repository         |

## How to Explore the Project

1. Review `results/executive_summary.md` for the main analytical overview.
2. Read `documentation/kpi_framework.md` to understand the metrics.
3. Review `documentation/data_quality_report.md` and `documentation/cleaning_decision_log.md`.
4. Follow `documentation/database_setup.md` for setup requirements and the recommended execution order.
5. Explore the numbered SQL files in `sql/` to review the queries.

## Important Limitations

* Findings depend on the available dataset and its quality.
* Unusual records are not automatically errors.
* Thresholds used to flag inventory or satisfaction concerns are analytical assumptions, not universal business standards.
* Potential customer-retention concerns require further evidence and should not be treated as confirmed churn.
* Recommendations are proposed actions for investigation, not evidence of implemented business changes.

## About This Project

This is an independent portfolio project demonstrating practical SQL analysis, data quality assessment, analytical reasoning, and business-oriented documentation.

**GitHub:** [Dharini-Panchal](https://github.com/Dharini-Panchal)

**LinkedIn:** [Dharini Panchal](https://www.linkedin.com/in/dharini-panchal/)
