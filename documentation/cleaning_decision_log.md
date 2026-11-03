# Data Cleaning Decision Log

## Project

Customer & Sales Analytics — MySQL

## Objective

Document data quality issues, cleaning decisions, and validation rules to improve transparency and reproducibility.

| Data Quality Issue     | Validation Method                                        | Cleaning Decision                                                                             | Post-Cleaning Check                          |
| ---------------------- | -------------------------------------------------------- | --------------------------------------------------------------------------------------------- | -------------------------------------------- |
| Duplicate records      | `GROUP BY`, `COUNT(*)`, `ROW_NUMBER()` where appropriate | Investigate duplicates before removal; preserve the correct record based on a documented rule | Recheck duplicate keys                       |
| Missing values         | `IS NULL`, blank-string checks                           | Retain, exclude, or replace values according to business meaning                              | Recheck missing-value counts                 |
| Inconsistent text      | `TRIM()`, string comparisons                             | Standardize whitespace and categories where appropriate                                       | Recheck inconsistent values                  |
| Invalid formats        | `REGEXP`, date parsing and type checks                   | Flag and investigate invalid values before transformation                                     | Revalidate formats                           |
| Missing numeric values | `IS NULL`                                                | Do not automatically interpret missing values as zero                                         | Check NULL counts and analytical assumptions |

## Quality Assurance Principles

* Preserve source data when practical.
* Document assumptions and transformation rules.
* Avoid deleting records without a justified rule.
* Distinguish missing values from confirmed zero values.
* Validate records after transformations.
* Keep data-cleaning logic separate from business-analysis queries where practical.

## Reporting Note

Only issues confirmed by executed validation queries should be reported as observed findings. Potential issues should be described as checks or risks until confirmed.
