# Data Quality Report

## Objective

Before performing business analysis, the dataset was assessed for potential data quality issues that could affect analytical accuracy.

The validation process focused on:

* Missing values
* Duplicate records
* Invalid formats
* Inconsistent categorical values
* Invalid dates
* Invalid phone numbers
* Inconsistent customer information
* Potentially incorrect numeric values

---

## Data Quality Dimensions

| Dimension    | Validation Focus                    |
| ------------ | ----------------------------------- |
| Completeness | Missing or NULL values              |
| Uniqueness   | Duplicate records                   |
| Validity     | Incorrect formats or values         |
| Consistency  | Standardized categories and formats |
| Accuracy     | Logical and business-rule checks    |
| Timeliness   | Date and time consistency           |

---

## Validation Workflow

```text
Raw Data
   ↓
Schema Inspection
   ↓
Duplicate Detection
   ↓
NULL / Missing Value Checks
   ↓
Format Validation
   ↓
Categorical Standardization
   ↓
Date / Phone Validation
   ↓
Data Cleaning
   ↓
Post-Cleaning Validation
   ↓
Analytics
```

---

## Data Quality Controls

The SQL analysis includes checks for:

* Duplicate records
* Missing customer attributes
* Invalid phone formats
* Date formatting issues
* Inconsistent categorical values
* NULL values
* Data standardization requirements
* Potentially invalid numeric values

---

## Analytical Principle

Business analysis should be performed only after identifying and addressing data quality issues that could materially affect the results.

Data cleaning decisions are documented separately from analytical queries to maintain transparency and reproducibility.

