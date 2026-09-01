# Customer & Sales Analytics | MySQL

## Business Case

A retail organization wants to understand customer purchasing behaviour, sales performance, product performance, inventory risk, and customer satisfaction.

The objective of this analysis is to transform transactional and customer data into actionable insights that can support revenue growth, customer retention, inventory planning, and operational decision-making.

## Business Questions

This analysis answers questions such as:

* What are the organization's key sales KPIs?
* Which customers generate the most revenue?
* Which products generate the most revenue?
* Which products have high sales but low inventory?
* Which products have poor customer satisfaction?
* Which customers are high-value?
* Which customers have high spending but low satisfaction?
* Which customers have stopped or reduced purchasing?
* How does customer spending vary across segments?
* Which products require further investigation?
* Where are potential data-quality issues?

## Data Sources

The analysis uses the following MySQL tables:

| Table                      | Business Purpose                            |
| -------------------------- | ------------------------------------------- |
| `customers`                | Customer demographics and lifetime spending |
| `customer_orders`          | Customer transaction/order information      |
| `customer_orders_review`   | Customer product ratings                    |
| `products`                 | Product pricing and inventory               |
| `ordered_items`            | Product-level order quantities and prices   |
| `suppliers`                | Supplier information                        |
| `supplier_delivery_status` | Delivery/order status information           |
| `employees`                | Employee and compensation information       |

## Analytical Workflow

```text
Operational Data
       ↓
Data Profiling
       ↓
Data Quality Checks
       ↓
Data Cleaning
       ↓
KPI Analysis
       ↓
Customer Analysis
       ↓
Sales Analysis
       ↓
Product Analysis
       ↓
Inventory Analysis
       ↓
Customer Satisfaction
       ↓
Advanced SQL Analysis
       ↓
Business Insights
       ↓
Recommendations
```

## SQL Techniques

The project demonstrates:

* SELECT
* WHERE
* ORDER BY
* GROUP BY
* HAVING
* Aggregate functions
* CASE
* IF
* Date functions
* String functions
* INNER JOIN
* LEFT JOIN
* Self JOIN
* UNION
* Subqueries
* Window functions
* ROW_NUMBER()
* RANK()
* DENSE_RANK()
* LAG()
* LEAD()
* PARTITION BY
* OVER()
* REGEXP
* ROLLUP

## Key Analytical Areas

### Customer Analytics

* Customer lifetime spending
* Revenue by customer
* High-value customer identification
* Customer segmentation
* Repeat purchasing behaviour
* Customer satisfaction

### Sales Analytics

* Total revenue
* Average order value
* Order volume
* Revenue trends
* Revenue contribution
* Top-performing orders

### Product Analytics

* Product revenue
* Units sold
* Product rankings
* Product pricing
* Low-performing products

### Inventory Analytics

* Current inventory
* Units sold
* High-sales/low-inventory products
* Potential stock-out risk

### Customer Satisfaction

* Average rating
* Low-rated products
* Rating distribution
* High-spending customers with low satisfaction

## Business Value

The analysis is designed to support business decisions around:

* Customer retention
* Revenue growth
* Product prioritization
* Inventory planning
* Customer experience
* Data quality
* Operational efficiency

## Tools

**MySQL | SQL | GitHub | Data Analytics | Exploratory Data Analysis**

## Project Status

Completed SQL analysis with ongoing refinement of business insights and documentation.
