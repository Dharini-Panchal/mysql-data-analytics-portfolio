# Data Profiling Methodology

## Objective

Establish a baseline understanding of the dataset before cleaning and business analysis.

## Profiling Checks

* **Record counts:** assess dataset size and coverage.
* **Uniqueness:** inspect identifiers for unexpected duplicates.
* **Completeness:** identify missing and NULL values.
* **Validity:** flag potentially invalid values and formats.
* **Date coverage:** identify the earliest and latest recorded dates.
* **Numeric distributions:** inspect minimum, maximum, and average values.
* **Business-rule validation:** investigate values that may conflict with expected business behaviour.

## Analytical Workflow

1. Inspect table structures and column data types.
2. Calculate baseline record counts and key metrics.
3. Identify missing, duplicate, and potentially anomalous values.
4. Document issues requiring investigation.
5. Apply justified cleaning rules.
6. Repeat relevant checks after cleaning.
7. Proceed to exploratory data analysis and KPI reporting.

## Reporting Standard

Record actual query results before reporting issue counts or conclusions. Distinguish confirmed data-quality defects from values that merely require further investigation.
