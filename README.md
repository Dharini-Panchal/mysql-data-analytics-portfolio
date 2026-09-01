# Customer & Sales Analytics | MySQL Data Analytics Portfolio

## 📌 Project Highlights

| Business Area | Analysis |
|---|---|
| Customer Analytics | Customer value, segmentation, retention |
| Sales Analytics | Revenue, AOV, order trends |
| Product Analytics | Product revenue and sales performance |
| Inventory Analytics | Stock risk and demand |
| Customer Satisfaction | Ratings and low-satisfaction products |
| Data Quality | Missing values, duplicates, invalid formats |
| Advanced SQL | Window functions, subqueries, REGEXP |

## 🔎 Key SQL Techniques

- JOINs
- LEFT JOIN
- GROUP BY
- HAVING
- Subqueries
- Window Functions
- ROW_NUMBER
- RANK
- DENSE_RANK
- LAG
- LEAD
- CASE
- REGEXP
- REGEXP_REPLACE
- Date Functions
- Aggregations
  
## 📊 Project Overview

This project demonstrates an end-to-end SQL analytics workflow using MySQL to analyze customer orders, products, inventory, customer reviews, and employee data.

The project simulates the type of analytical work performed by a Junior Data Analyst / Data Analyst in a business environment — including data profiling, data quality validation, exploratory analysis, KPI development, customer segmentation, product performance analysis, and business recommendations.

The analysis was developed using MySQL and focuses on transforming operational data into meaningful business insights.

---

## 🎯 Business Objective

The organization wants to understand:

* Which customers generate the most revenue?
* Which products drive sales performance?
* Which products may represent inventory risk?
* How are customer order values changing over time?
* Which customers demonstrate declining purchasing behaviour?
* Which products receive poor customer ratings?
* Where are data-quality issues affecting analysis?
* Which business areas require further investigation?

The goal is to provide decision-makers with reliable, actionable insights based on transactional and customer data.

---

## 🛠️ Technical Skills Demonstrated

### SQL / MySQL

* SELECT statements
* Filtering and conditional logic
* GROUP BY and HAVING
* Aggregate functions
* INNER / LEFT / OUTER JOIN concepts
* Self joins
* Cross joins
* UNION
* Subqueries
* Common Table Expressions (CTEs)
* Window functions
* ROW_NUMBER()
* RANK()
* DENSE_RANK()
* LAG()
* LEAD()
* PARTITION BY
* CASE statements
* IF functions
* Date and time functions
* String functions
* CAST / CONVERT
* Regular expressions (REGEXP)
* ROLLUP

### Analytics

* Data profiling
* Data quality assessment
* Data cleaning
* Exploratory Data Analysis (EDA)
* KPI analysis
* Customer analysis
* Product performance analysis
* Sales analysis
* Inventory analysis
* Customer satisfaction analysis
* Trend analysis
* Comparative analysis
* Business recommendations

---

## 🔍 Analytical Workflow

The project follows a structured analytics workflow:

```text
Raw Operational Data
        ↓
Data Profiling
        ↓
Data Quality Assessment
        ↓
Data Cleaning & Validation
        ↓
Exploratory Data Analysis
        ↓
KPI Development
        ↓
Customer / Product / Sales Analysis
        ↓
Advanced SQL Analysis
        ↓
Business Insights
        ↓
Recommendations
```

---

## 📁 Project Structure

```text
sql/
├── 01_data_profiling.sql
├── 02_data_quality.sql
├── 03_data_cleaning.sql
├── 04_customer_analysis.sql
├── 05_sales_analysis.sql
├── 06_product_analysis.sql
├── 07_inventory_analysis.sql
├── 08_customer_satisfaction.sql
├── 09_advanced_sql.sql
└── 10_business_insights.sql
```

---

## 📈 Key Analytical Areas

### Customer Analytics

Analysis includes:

* Customer spending
* Average customer order value
* High-value customers
* First and most recent orders
* Customer purchasing behaviour
* Changes between consecutive orders
* Customers with declining order values

### Sales Analytics

Analysis includes:

* Total revenue
* Average order value
* Order volume
* Revenue contribution
* Product-level revenue
* Customer-level revenue
* Sales ranking

### Product Analytics

Analysis includes:

* Product revenue
* Units sold
* Product pricing
* Product ranking
* High-performing products
* Low-performing products

### Inventory Analytics

Analysis includes:

* Current stock levels
* Products with low inventory
* High-sales / low-inventory products
* Potential inventory risks

### Customer Satisfaction

Analysis includes:

* Average ratings
* Low-rated products
* Customer rating patterns
* Relationship between product performance and customer satisfaction

---

## 🧠 Advanced SQL Analysis

The project demonstrates advanced SQL techniques including:

```sql
ROW_NUMBER()
RANK()
DENSE_RANK()
LAG()
LEAD()
OVER()
PARTITION BY
```

These techniques are used to perform:

* Customer order sequencing
* Top-N analysis
* Department salary ranking
* Product revenue ranking
* Previous vs. current order comparisons
* Customer purchasing trend analysis

Regular expressions are also used for data-quality validation, including identifying potentially invalid:

* Phone numbers
* Names
* State codes
* Product names
* Monetary / tip fields

---

## 💼 Business Value

Rather than focusing only on SQL syntax, this project translates analytical findings into business questions and recommendations.

The analysis can help stakeholders:

* Identify high-value customers
* Detect declining customer purchasing behaviour
* Prioritize high-performing products
* Identify potential inventory risks
* Investigate customer dissatisfaction
* Improve data quality
* Support data-driven operational decisions

---

## 🎓 Learning & Professional Development

This project was developed after completing the **MySQL for Data Analytics** course by Analyst Builder and Alex Freberg on LinkedIn Learning.

The course provided practical training in MySQL, SQL analytics, data cleaning, exploratory analysis, window functions, regular expressions, and professional database workflows.

The repository extends the learning into a structured business analytics portfolio project.

**Core**: SQL | MySQL | Data Analytics | Data Analyst | Business Analytics | Data Cleaning | Data Quality | Exploratory Data Analysis | EDA

**Advanced SQL**: Joins | Subqueries | CTEs | Window Functions | ROW_NUMBER | RANK | DENSE_RANK | LAG | LEAD | CASE | Aggregations | REGEXP

**Analytics**: Customer Analytics | Sales Analytics | Product Analytics | Inventory Analytics | KPI Analysis | Trend Analysis | Customer Segmentation | Business Insights | Data-Driven Decision Making

**Workflow**: Data Profiling | Data Validation | Data Transformation | Staging Database | Production Database | Data Dictionary | Business Requirements | Analytical Workflow
