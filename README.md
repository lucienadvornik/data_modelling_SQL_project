# Relational Database Design & SQL Setup for E-commerce Store

This project showcases the design and implementation of a relational database schema for an online cosmetics store. It includes:

- Conceptual and relational data modeling 
- Physical schema design tailored for Oracle SQL
- SQL DDL scripts to create and initialize the database
- Sample test data inserts
- Basic testing queries for validation

## Database Schema

This project is built on top of the following Oracle-style schema:

| Table         | Description |
|---------------|-------------|
| `users`       | Customer personal details |
| `products`    | Product catalog (with metadata) |
| `orders`      | Purchases made by users (one product per order) |
| `prices`      | Product prices (separated for normalization) |
| `payments`    | Payment method and status for each order |
| `delivery`    | Delivery status tracking for each order |


---


![Data Schema](schema_design/Schema.png)

![Data Schema](data_modelling/DM_01-Relational_data_model.png)
