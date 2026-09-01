# Data Dictionary

## customer_orders

| Column | Description |
|---|---|
| order_id | Unique order identifier |
| customer_id | Customer associated with the order |
| product_id | Product associated with the order |
| order_date | Date the order was placed |
| order_total | Total monetary value of the order |
| tip | Tip information associated with the order |

## customer_orders_review

| Column | Description |
|---|---|
| order_id | Associated order |
| customer_id | Customer providing the review |
| product_id | Reviewed product |
| order_date | Order date |
| Rating 1-10 | Customer satisfaction rating |

## customers

| Column | Description |
|---|---|
| customer_id | Unique customer identifier |
| first_name | Customer first name |
| last_name | Customer last name |
| birth_date | Customer date of birth |
| phone | Customer phone number |
| address | Customer address |
| city | Customer city |
| state | Customer state |
| total_money_spent | Customer lifetime spending |

## employees

| Column | Description |
|---|---|
| employee_id | Unique employee identifier |
| first_name | Employee first name |
| last_name | Employee last name |
| department | Employee department |
| title | Employee job title |
| salary | Employee salary |

## ordered_items

| Column | Description |
|---|---|
| order_id | Associated order |
| product_id | Ordered product |
| status | Order status |
| quantity | Quantity ordered |
| unit_price | Price per unit |
| shipped_date | Shipment date |
| shipper_id | Associated shipper |

## products

| Column | Description |
|---|---|
| product_id | Unique product identifier |
| product_name | Product name |
| units_in_stock | Current inventory |
| sale_price | Product sale price |

## suppliers

| Column | Description |
|---|---|
| supplier_id | Unique supplier identifier |
| name | Supplier name |

## supplier_delivery_status

| Column | Description |
|---|---|
| order_status_id | Order status identifier |
| name | Status description |
