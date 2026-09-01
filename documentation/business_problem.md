# Business Problem

## Project: Customer & Sales Analytics

### Business Context

A retail organization wants to better understand customer purchasing behaviour, sales performance, product performance, inventory risk, and customer satisfaction.

The organization has transactional, customer, product, inventory, and customer review data stored across multiple MySQL tables.

The objective of this project is to transform operational data into actionable business insights that can support decision-making.

## Business Questions

### Customer Analytics

- **Who are the highest-value customers?**
  - _SELECT customer_id, first_name, last_name, total_money_spent FROM customers ORDER BY total_money_spent DESC LIMIT 3;_
- **Which customers generate the most revenue? :**
  - _SELECT c.customer_id, c.first_name, c.last_name, SUM(co.order_total) AS Revenue, c.total_money_spent FROM customers AS c JOIN customer_orders AS co ON c.customer_id = co.customer_id GROUP BY c.customer_id, c.first_name, c.last_name ORDER BY Revenue DESC LIMIT 5;_
    
- **Which customers have placed multiple orders?**
  - _SELECT customer_id, COUNT(order_id) AS OrderPlacedEachCustomer FROM customer_orders GROUP BY customer_id HAVING COUNT(order_id) > 1;_
    
- **Which customers have never placed an order?**
  - _SELECT c.customer_id, c.first_name, c.last_name FROM customers AS c LEFT JOIN customer_orders AS co ON c.customer_id = co.customer_id WHERE co.order_id IS NULL;_
    
- **Which customers demonstrate high spending but low satisfaction?**
  - _SELECT c.customer_id, c.first_name, c.last_name, c.total_money_spent, ROUND(AVG(cor.`Rating 1-10`), 2) AS AvgRate FROM customers c JOIN customer_orders co ON c.customer_id = co.customer_id JOIN customer_orders_review cor ON co.order_id = cor.order_id GROUP BY c.customer_id, c.first_name, c.last_name, c.total_money_spent HAVING c.total_money_spent > 500 AND AVG(cor.`Rating 1-10`) < 5 ORDER BY c.total_money_spent DESC;_

- **How can customers be segmented based on spending?**
 - _SELECT customer_id, first_name, last_name, total_money_spent, CASE WHEN total_money_spent >= 1000 THEN 'High Value' WHEN total_money_spent >= 500 THEN 'Medium Value' WHEN total_money_spent >= 100 THEN 'Low Value' ELSE 'Very Low' END AS CustomerSegment FROM customers ORDER BY total_money_spent DESC;_
   
### Sales Analytics

- What is total revenue?
  
- What is the average order value?
- Which orders have the highest value?
- Which customers contribute the most revenue?
- How does revenue change over time?
- Which products generate the most revenue?

### Product Analytics

- Which products sell the most units?
- Which products generate the most revenue?
  
- **Which products have low customer ratings?**
  - _SELECT p.product_id, p.product_name, ROUND(AVG(cor.`Rating 1-10`), 2) AS AvgRate FROM products p JOIN customer_orders_review cor ON p.product_id = cor.product_id GROUP BY p.product_id, p.product_name HAVING AVG(cor.`Rating 1-10`) < 7 ORDER BY AvgRate;_
    
- **Which products have high sales but low inventory?**
  - _SELECT p.product_id, p.product_name, p.units_in_stock, SUM(oi.quantity) AS units_sold FROM products AS p JOIN ordered_items AS oi ON p.product_id = oi.product_id GROUP BY p.product_id, p.product_name, p.units_in_stock ORDER BY units_sold DESC;_
    
- **Which products have no sales?**
  - _SELECT p.product_id, p.product_name FROM products AS p LEFT JOIN ordered_items AS oi ON p.product_id = oi.product_id WHERE oi.product_id IS NULL;_
  
### Inventory Analytics

- Which products have potentially risky inventory levels?
- Which high-demand products may require replenishment?
- Which products have high inventory but low sales?

### Customer Satisfaction

- What is the average customer rating?
- Which products have low ratings?
- Which customers consistently provide low ratings?
- Are high-value customers experiencing lower satisfaction?

## Analytical Objective

The analysis follows an end-to-end data analytics workflow:

Raw Data
→ Data Profiling
→ Data Quality Assessment
→ Data Cleaning
→ Exploratory Data Analysis
→ KPI Analysis
→ Advanced SQL Analysis
→ Business Insights
→ Recommendations

## Expected Business Value

The analysis is intended to help stakeholders:

- Identify high-value customers
- Improve customer retention
- Prioritize high-performing products
- Identify inventory risks
- Investigate customer dissatisfaction
- Improve data quality
- Support data-driven operational decisions
