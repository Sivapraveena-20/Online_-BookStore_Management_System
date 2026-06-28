# 📚 Online Bookstore System — SQL Project

A complete relational database project built with **MySQL**, modelling an Online Bookstore with full CRUD operations, analytical queries, views, stored procedures, and functions.

---

## 📌 Project Overview

This project simulates a real-world **Online Bookstore Management System** using a normalized relational database. It covers the complete lifecycle of bookstore operations — from managing books, customers, and employees to processing orders, payments, and inventory.

---

## 🗂️ Database Schema

The database `ONLINE_BOOKSTORE_DB` consists of **9 interrelated tables**:

| Table | Description |
|---|---|
| `Publishers` | Stores book publisher details |
| `Books` | Catalogue of available books |
| `Customers` | Registered customer information |
| `Suppliers` | Suppliers who stock the inventory |
| `Employees` | Bookstore staff records |
| `Orders` | Customer order records |
| `Order_Details` | Line items for each order (book + quantity) |
| `Payments` | Payment transactions linked to orders |
| `Inventory` | Stock levels per book and supplier |

---

## 🖼️ ER Diagram

![ER Diagram](screenshots/ER_Diagram.png)

> Entity-Relationship Diagram created using MySQL Workbench showing all 9 tables and their relationships.

---

## 📁 Project Structure

```
Online-Bookstore-System/
│
├── 01_create_database.sql        # Database creation
├── 02_create_tables.sql          # Table schemas with constraints
├── 03_insert_data.sql            # Sample data insertion
├── 04_Basic_Queries.sql          # SELECT, WHERE, ORDER BY, LIMIT
├── 05_Aggregate_functions.sql    # COUNT, SUM, AVG, MAX, MIN
├── 06_Group_by_Having.sql        # GROUP BY and HAVING clauses
├── 07_Joins.sql                  # INNER, LEFT, RIGHT joins
├── 08_Sub_queries.sql            # Subqueries and nested SELECTs
├── 09_Views.sql                  # SQL Views
├── 10_Stored_Procedures.sql      # Stored Procedures
├── 11_Functions.sql              # User-defined Functions
│
├── screenshots/                  # Query output screenshots
│   ├── ER_Diagram.png
│   ├── 01_tables_created.png
│   ├── 02_publishers.png
│   ├── 03_books.png
│   ├── 04_customers.png
│   ├── 05_orders.png
│   ├── 06_joins_output.png
│   ├── 07_subquery_output.png
│   └── ...
│
├── Normalization_Documentation.docx
└── README.md
```

---

## 🔧 How to Run

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/Online-Bookstore-System.git
   cd Online-Bookstore-System
   ```

2. **Open MySQL Workbench** or your preferred MySQL client.

3. **Execute files in order:**
   ```sql
   SOURCE 01_create_database.sql;
   SOURCE 02_create_tables.sql;
   SOURCE 03_insert_data.sql;
   SOURCE 04_Basic_Queries.sql;
   -- ... and so on
   ```

---

## 🧠 SQL Concepts Covered

### ✅ DDL — Data Definition Language
- `CREATE DATABASE`, `CREATE TABLE`
- Constraints: `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE`, `CHECK`, `DEFAULT`
- `ENUM` data type, `AUTO_INCREMENT`, `TIMESTAMP`

### ✅ DML — Data Manipulation Language
- `INSERT INTO` with multiple rows
- `SELECT` with `WHERE`, `ORDER BY`, `LIMIT`

### ✅ Aggregate Functions
- `COUNT()`, `SUM()`, `AVG()`, `MAX()`, `MIN()`
- Combined with `GROUP BY` and `HAVING`

### ✅ Joins
- `INNER JOIN` — matching records across tables
- `LEFT JOIN` — all records from left table
- `RIGHT JOIN` — all records from right table

### ✅ Subqueries
- Scalar subqueries in `WHERE` clause
- Subqueries with `IN`, `NOT IN`
- Correlated-style queries with `ORDER BY + LIMIT`

### ✅ Views
- `CREATE VIEW` for reusable query abstraction
- Joins encapsulated in views

### ✅ Stored Procedures
- Parameterized procedures with `IN` parameters
- Conditional logic with `IF-ELSE`
- Custom error signalling with `SIGNAL SQLSTATE`

### ✅ Functions
- User-defined `DETERMINISTIC` functions
- Scalar return values

---

## 📊 Sample Queries & Outputs

### Books priced above average
```sql
SELECT Title, Price
FROM Books
WHERE Price > (SELECT AVG(Price) FROM Books);
```

### Customer who spent the most
```sql
SELECT Customer_id, Customer_name
FROM Customers
WHERE Customer_id = (
    SELECT Customer_id FROM Orders
    GROUP BY Customer_id
    ORDER BY SUM(Total_amount) DESC
    LIMIT 1
);
```

### All orders with customer names (INNER JOIN)
```sql
SELECT C.Customer_name, O.Order_id, O.Order_date, O.Total_amount, O.Status
FROM Customers C
INNER JOIN Orders O ON C.Customer_id = O.Customer_id;
```

> See the `screenshots/` folder for output images of all major queries.

---

## 🗃️ Normalization

The database is normalized up to **Third Normal Form (3NF)**:

- **1NF**: All columns contain atomic values; each table has a primary key.
- **2NF**: No partial dependencies (all non-key attributes depend on the full primary key).
- **3NF**: No transitive dependencies (non-key attributes depend only on the primary key).

📄 Full normalization analysis: [`Normalization_Documentation.docx`](Normalization_Documentation.docx)

---

## 🛠️ Tools Used

- **MySQL 8.0**
- **MySQL Workbench** (schema design + query execution)
- **GitHub** (version control)

---

## 👩‍💻 Author

**Sivapraveena**  
B.Tech Computer Science and Business Systems  
📧 your-email@example.com  
🔗 [LinkedIn](https://linkedin.com/in/your-profile)

---

## 📄 License

This project is created for educational and portfolio purposes.
