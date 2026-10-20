# Retail Sales Analysis using SQL (PostgreSQL)

## About the Project
This project analyzes a retail business dataset using PostgreSQL. I wrote 15 SQL queries to answer business questions about customers, products, employees, orders and returns.

## Database Tables

| Table | What it stores |
|---|---|
| Customers | Customer name, email, city, state, signup date |
| Products | Product name, category, price, stock quantity |
| Employees | Employee name, department, branch city, monthly salary |
| Orders | Order date, customer, employee, status, payment method |
| Order_Items | Quantity, sale price and discount for each product in an order |
| Returns | Return date and reason for returned orders |

## Business Rules Followed
- Net revenue = quantity × unit_price_at_sale × (1 − discount_rate)
- Gross value = quantity × unit_price_at_sale
- Revenue is counted only for orders with status `Delivered`
- Returned and Cancelled orders are not counted as revenue

Example: a product sold at ₹1,000, quantity 2, discount 10% gives net revenue of 1000 × 2 × 0.9 = ₹1,800.

## Queries Covered

| Q | Topic |
|---|---|
| Q1 | Filtering and sorting delivered orders by date |
| Q2 | Multi-table INNER JOIN (customer and employee names) |
| Q3 | Category-wise units and revenue using GROUP BY and HAVING |
| Q4 | Customers with at least two delivered orders |
| Q5 | LEFT JOIN to show customers with zero delivered orders |
| Q6 | Subquery for products priced above average |
| Q7 | NOT EXISTS for customers with no delivered order |
| Q8 | Month-wise orders and revenue using date functions |
| Q9 | CASE expression for stock labels |
| Q10 | Conditional aggregation for employee order counts |
| Q11 | Window function RANK() for products within category |
| Q12 | Monthly revenue with running total |
| Q13 | Return analysis with pre-discount order value |
| Q14 | CTE to find customers above average net revenue |
| Q15 | Top 3 customers and their percentage contribution |

## SQL Concepts Used
SELECT, WHERE, ORDER BY, LIMIT, INNER JOIN, LEFT JOIN, SUM, COUNT, AVG, GROUP BY, HAVING, subqueries, NOT EXISTS, CTE, CASE, RANK(), SUM() OVER(), EXTRACT(), TO_CHAR(), COALESCE(), ROUND()

## Files in this Repository

| File | Description |
|---|---|
| setup.sql | Creates the 6 tables and inserts the data |
| queries.sql | All 15 queries (Q1 to Q15) |
| ASSUMPTIONS.md | Assumptions made for each query |

## How to Run
1. Install PostgreSQL and open pgAdmin.
2. Create a new database.
3. Run `setup.sql` to create and fill the tables.
4. Run the queries from `queries.sql` one by one.

## Learning Outcomes
- Learned to combine multiple tables using INNER JOIN and LEFT JOIN.
- Calculated net revenue using quantity, sale price and discount rate.
- Used GROUP BY with HAVING to filter grouped results, such as categories above ₹10,000 revenue.
- Wrote subqueries and NOT EXISTS to compare values and find missing records.
- Used CASE expressions and conditional aggregation to classify stock and count order statuses.
- Applied window functions (RANK and running totals) and CTEs to rank products and track monthly revenue.
- Handled edge cases such as customers with no orders and queries that return zero rows.
- Practiced checking query results against the data to make sure they were correct.

