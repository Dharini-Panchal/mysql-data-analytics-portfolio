# Data Model

## Overview

The project uses a relational MySQL structure representing customers, orders, products, order items, reviews, suppliers, delivery status, and employees.

The analytical model connects transactional data with customer, product, inventory, and satisfaction information.

## Core Analytical Entities

```text
CUSTOMERS
   │
   │ customer_id
   ↓
CUSTOMER_ORDERS
   │
   ├──────────────→ CUSTOMER_ORDERS_REVIEW
   │
   │ order_id
   ↓
ORDERED_ITEMS
   │
   │ product_id
   ↓
PRODUCTS
```

Additional supporting entities:

```text
SUPPLIERS
    │
    └── Supplier information

SUPPLIER_DELIVERY_STATUS
    │
    └── Delivery/order status reference

EMPLOYEES
    │
    └── Employee and compensation information
```

## Analytical Relationships

### Customer → Orders

Used for:

* Customer revenue
* Repeat purchasing behaviour
* Customer value
* Order frequency

### Orders → Ordered Items

Used for:

* Units sold
* Product revenue
* Product performance

### Products → Ordered Items

Used for:

* Product ranking
* Inventory analysis
* Sales demand analysis

### Orders → Reviews

Used for:

* Customer satisfaction
* Product ratings
* Low-rating analysis

## Modeling Principle

The relational structure allows transactional, customer, product, inventory, and satisfaction information to be combined through SQL joins for analytical reporting.

