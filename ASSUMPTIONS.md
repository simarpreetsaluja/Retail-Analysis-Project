# Assumptions – Retail Sales Analysis (SQL Assignment 2)

**Database used:** PostgreSQL
**Tables:** Customers (12 rows), Products (10), Employees (5), Orders (24), Order_Items (36), Returns (3)

## 1. Revenue rules

1. **Net revenue** = quantity × unit_price_at_sale × (1 − discount_rate).
2. **Gross (pre-discount) value** = quantity × unit_price_at_sale.
3. `discount_rate` is a fraction (0.05 means 5% off) and applies only to that order line.
4. Revenue uses `unit_price_at_sale` (the price actually charged). `Products.unit_price` is the current price and is used only in Q6.
5. All amounts are in Indian Rupees (₹). Tax, shipping and payment fees are not in the data, so they are ignored.
6. Payment method (UPI, Card, Cash, Wallet) does not change revenue.

## 2. Order status rules

1. Only orders with `order_status = 'Delivered'` are counted as revenue.
2. Returned and Cancelled orders are not counted in any revenue, spend or ranking.
3. Status values are case-sensitive: 'Delivered', 'Returned', 'Cancelled'.
4. A returned order is treated as a full return of all its items, because the Returns table has no item-level detail.
5. Every Returned order (5003, 5010, 5018) has one row in the Returns table.

## 3. Date rules

1. Date ranges are inclusive. Q1 includes both 1 October 2024 and 31 March 2025.
2. Revenue belongs to the month of `order_date`, because there is no separate delivery or payment date.
3. Months are grouped by year and month together, so the same month in two different years is never merged.
4. Every month from September 2024 to May 2025 has at least one delivered order, so there are no missing months.

## 4. General assumptions

1. Customers, products and employees are identified by their ID, not by name.
2. A customer's location is `Customers.city`.
3. Each order is credited to the employee saved on that order, whatever the employee's department.
4. `stock_quantity` is the current stock and is not reduced by the orders in this data.
5. Columns used in calculations (quantity, unit_price_at_sale, discount_rate, order_status, order_date) have no NULL values.
6. The data is a fixed sample, so results are the same every time the queries are run.

## 5. Question-wise assumptions

| Question | Assumption |
|---|---|
| Q1 | "Between" includes both dates. Only Delivered orders are shown. |
| Q2 | INNER JOIN is used, so orders without a matching customer or employee are dropped. None are missing here. |
| Q3 | The ₹10,000 limit is on net revenue (after discount). Peripherals (₹9,897.00) is below it, so it is not shown. |
| Q4 | "At least two orders" counts only delivered orders. `COUNT(DISTINCT order_id)` is used because one order has many items. |
| Q5 | LEFT JOIN is used so customers with 0 delivered orders would still appear. Every customer has at least 1 here. |
| Q6 | The average is the simple average of all 10 product prices (₹5,249.00). |
| Q7 | NOT EXISTS is used. The result is empty because every customer has at least one delivered order. This is a correct result. |
| Q8 | Each order is counted once using `COUNT(DISTINCT order_id)`. |
| Q9 | Stock of exactly 20 or 40 is 'Moderate Stock'. Only stock above 40 is 'High Stock'. |
| Q10 | Only the three statuses (Delivered, Returned, Cancelled) are counted. Employees with no orders show 0. |
| Q11 | `RANK()` is used, so ties get the same rank. Products with no delivered sales show ₹0 and still get a rank. |
| Q12 | The running total keeps adding across all months in date order and does not reset at a new year. |
| Q13 | A returned order is one that has a row in the Returns table. Its value is the full pre-discount value of its items. |
| Q14 | The average is taken only across customers who have delivered purchases. All 12 customers qualify, so it equals the all-customer average (₹13,683.97). |
| Q15 | Percentage share is out of total delivered net revenue of all customers (₹1,64,207.63), not just the top 3. |

## 6. Technical notes

1. Queries are written for PostgreSQL (for example `EXTRACT` and `TO_CHAR` for dates).
2. Table creation and data loading scripts are run first, then the queries.
3. Tables are loaded in this order: Customers, Employees, Products, then Orders, Order_Items, Returns.
