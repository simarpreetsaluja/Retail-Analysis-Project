CREATE TABLE Customer (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL,
  city VARCHAR(60),
  state VARCHAR(60),
  signup_date DATE
);
CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(120) NOT NULL,
  category VARCHAR(60),
  unit_price DECIMAL(10,2),
  stock_quantity INT
);
CREATE TABLE Employees (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(100) NOT NULL,
  department VARCHAR(60),
  branch_city VARCHAR(60),
  monthly_salary DECIMAL(10,2)
);
CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  employee_id INT,
  order_status VARCHAR(30),
  payment_method VARCHAR(30),
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
  FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);
CREATE TABLE Order_Items (
  order_item_id INT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  unit_price_at_sale DECIMAL(10,2),
  discount_rate DECIMAL(4,2),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
CREATE TABLE Returns (
  return_id INT PRIMARY KEY,
  order_id INT,
  return_date DATE,
  return_reason VARCHAR(120),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

INSERT INTO Customers (customer_id, customer_name, email, city, state, signup_date) VALUES
(1001, 'Aarav Sharma', 'aarav.sharma@example.com', 'Lucknow', 'Uttar Pradesh', '2024-01-15'),
(1002, 'Diya Verma', 'diya.verma@example.com', 'Kanpur', 'Uttar Pradesh', '2024-02-10'),
(1003, 'Kabir Singh', 'kabir.singh@example.com', 'Delhi', 'Delhi', '2023-11-22'),
(1004, 'Meera Patel', 'meera.patel@example.com', 'Jaipur', 'Rajasthan', '2024-03-05'),
(1005, 'Ishaan Gupta', 'ishaan.gupta@example.com', 'Lucknow', 'Uttar Pradesh', '2023-08-19'),
(1006, 'Ananya Rao', 'ananya.rao@example.com', 'Bhopal', 'Madhya Pradesh', '2024-04-12'),
(1007, 'Reyansh Khan', 'reyansh.khan@example.com', 'Delhi', 'Delhi', '2024-05-01'),
(1008, 'Saanvi Joshi', 'saanvi.joshi@example.com', 'Pune', 'Maharashtra', '2023-12-09'),
(1009, 'Vivaan Mishra', 'vivaan.mishra@example.com', 'Lucknow', 'Uttar Pradesh', '2024-06-17'),
(1010, 'Aditi Das', 'aditi.das@example.com', 'Kolkata', 'West Bengal', '2024-07-02'),
(1011, 'Arjun Mehta', 'arjun.mehta@example.com', 'Jaipur', 'Rajasthan', '2023-09-14'),
(1012, 'Myra Nair', 'myra.nair@example.com', 'Mumbai', 'Maharashtra', '2024-08-21');

INSERT INTO Products (product_id, product_name, category, unit_price, stock_quantity) VALUES
(201, 'Wireless Mouse', 'Accessories', 799.0, 80),
(202, 'Mechanical Keyboard', 'Accessories', 2499.0, 35),
(203, 'USB-C Hub', 'Accessories', 1899.0, 42),
(204, '27-inch Monitor', 'Displays', 14999.0, 18),
(205, 'Laptop Stand', 'Accessories', 1299.0, 55),
(206, 'Webcam HD', 'Peripherals', 3299.0, 24),
(207, 'Noise-Cancelling Headphones', 'Audio', 5999.0, 20),
(208, 'Bluetooth Speaker', 'Audio', 2199.0, 30),
(209, 'External SSD 1TB', 'Storage', 7499.0, 16),
(210, 'Ergonomic Chair', 'Furniture', 11999.0, 12);

INSERT INTO Employee (employee_id, employee_name, department, branch_city, monthly_salary) VALUES
(301, 'Nisha Kapoor', 'Sales', 'Lucknow', 52000),
(302, 'Rahul Bansal', 'Sales', 'Delhi', 58000),
(303, 'Pooja Iyer', 'Support', 'Lucknow', 44000),
(304, 'Karan Malhotra', 'Operations', 'Jaipur', 49000),
(305, 'Sneha Kulkarni', 'Sales', 'Pune', 61000);

INSERT INTO Orders (order_id, customer_id, order_date, employee_id, order_status, payment_method) VALUES
(5001, 1001, '2024-09-02', 301, 'Delivered', 'UPI'),
(5002, 1002, '2024-09-05', 302, 'Delivered', 'Card'),
(5003, 1003, '2024-09-07', 302, 'Returned', 'Card'),
(5004, 1001, '2024-09-15', 301, 'Delivered', 'UPI'),
(5005, 1004, '2024-10-01', 304, 'Delivered', 'Cash'),
(5006, 1005, '2024-10-04', 301, 'Delivered', 'Card'),
(5007, 1006, '2024-10-11', 303, 'Cancelled', 'UPI'),
(5008, 1007, '2024-10-18', 302, 'Delivered', 'Card'),
(5009, 1008, '2024-11-02', 305, 'Delivered', 'Wallet'),
(5010, 1009, '2024-11-10', 301, 'Returned', 'UPI'),
(5011, 1010, '2024-11-15', 304, 'Delivered', 'Card'),
(5012, 1011, '2024-12-01', 304, 'Delivered', 'Cash'),
(5013, 1012, '2024-12-09', 305, 'Delivered', 'Wallet'),
(5014, 1003, '2025-01-05', 302, 'Delivered', 'Card'),
(5015, 1002, '2025-01-12', 302, 'Delivered', 'UPI'),
(5016, 1005, '2025-01-20', 301, 'Delivered', 'Card'),
(5017, 1006, '2025-02-02', 303, 'Delivered', 'UPI'),
(5018, 1007, '2025-02-14', 302, 'Returned', 'Card'),
(5019, 1008, '2025-03-01', 305, 'Delivered', 'Wallet'),
(5020, 1009, '2025-03-15', 301, 'Delivered', 'UPI'),
(5021, 1010, '2025-04-03', 304, 'Cancelled', 'Cash'),
(5022, 1011, '2025-04-22', 304, 'Delivered', 'Card'),
(5023, 1012, '2025-05-07', 305, 'Delivered', 'Wallet'),
(5024, 1004, '2025-05-19', 304, 'Delivered', 'UPI');

INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, unit_price_at_sale, discount_rate) VALUES
(1.0, 5001.0, 201.0, 2.0, 799.0, 0.05),
(2.0, 5001.0, 203.0, 1.0, 1899.0, 0.0),
(3.0, 5002.0, 202.0, 1.0, 2499.0, 0.1),
(4.0, 5002.0, 205.0, 2.0, 1299.0, 0.0),
(5.0, 5003.0, 207.0, 1.0, 5999.0, 0.0),
(6.0, 5004.0, 204.0, 1.0, 14999.0, 0.08),
(7.0, 5004.0, 201.0, 1.0, 799.0, 0.0),
(8.0, 5005.0, 210.0, 1.0, 11999.0, 0.05),
(9.0, 5006.0, 209.0, 1.0, 7499.0, 0.1),
(10.0, 5006.0, 203.0, 2.0, 1899.0, 0.0),
(11.0, 5007.0, 206.0, 1.0, 3299.0, 0.0),
(12.0, 5008.0, 207.0, 1.0, 5999.0, 0.15),
(13.0, 5008.0, 208.0, 2.0, 2199.0, 0.0),
(14.0, 5009.0, 202.0, 1.0, 2499.0, 0.05),
(15.0, 5009.0, 206.0, 1.0, 3299.0, 0.0),
(16.0, 5010.0, 204.0, 1.0, 14999.0, 0.0),
(17.0, 5011.0, 208.0, 3.0, 2199.0, 0.1),
(18.0, 5012.0, 210.0, 1.0, 11999.0, 0.0),
(19.0, 5013.0, 209.0, 2.0, 7499.0, 0.05),
(20.0, 5014.0, 202.0, 2.0, 2499.0, 0.0),
(21.0, 5014.0, 203.0, 1.0, 1899.0, 0.05),
(22.0, 5015.0, 205.0, 1.0, 1299.0, 0.0),
(23.0, 5015.0, 201.0, 3.0, 799.0, 0.1),
(24.0, 5016.0, 204.0, 1.0, 14999.0, 0.05),
(25.0, 5017.0, 206.0, 2.0, 3299.0, 0.0),
(26.0, 5017.0, 208.0, 1.0, 2199.0, 0.0),
(27.0, 5018.0, 207.0, 1.0, 5999.0, 0.0),
(28.0, 5019.0, 209.0, 1.0, 7499.0, 0.1),
(29.0, 5020.0, 203.0, 2.0, 1899.0, 0.0),
(30.0, 5020.0, 201.0, 1.0, 799.0, 0.0),
(31.0, 5021.0, 210.0, 1.0, 11999.0, 0.0),
(32.0, 5022.0, 202.0, 1.0, 2499.0, 0.0),
(33.0, 5022.0, 205.0, 1.0, 1299.0, 0.0),
(34.0, 5023.0, 209.0, 1.0, 7499.0, 0.0),
(35.0, 5024.0, 204.0, 1.0, 14999.0, 0.1),
(36.0, 5024.0, 205.0, 2.0, 1299.0, 0.0);

INSERT INTO Returns (return_id, order_id, return_date, return_reason) VALUES
(9001, 5003, '2024-09-20', 'Damaged item'),
(9002, 5010, '2024-11-17', 'Changed mind'),
(9003, 5018, '2025-02-20', 'Product not as expected');

SELECT *
	FROM customers;

SELECT *
	FROM employee;

SELECT *
	FROM products;

SELECT *
	FROM order_items;

SELECT *
	FROM orders;

SELECT *
	FROM returns;

--Q1. List delivered orders placed between 1 October 2024 and 31 March 2025. Show order_id, order_date, customer_id, and payment_method. Sort by order date descending.

SELECT
    order_id,
    order_date,
    customer_id,
    payment_method
FROM orders
WHERE order_status = 'Delivered'
  AND order_date >= '2024-10-01'
  AND order_date < '2025-04-01'
ORDER BY order_date DESC;


--Q2. Display each delivered order with customer and employee details.
SELECT c.customer_name, o.order_id, o.order_date, e.employee_name, o.order_status
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id
INNER JOIN Employees e ON o.employee_id = e.employee_id
WHERE o.order_status = 'Delivered';


--Q3. Calculate total units sold and net revenue for each product category.


SELECT
    p.category,
    SUM(oi.quantity) AS total_units_sold,
    ROUND(
        SUM(
            oi.quantity * oi.unit_price_at_sale
            * (1 - oi.discount_rate))::numeric,
        2) AS net_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category
HAVING SUM(
    oi.quantity * oi.unit_price_at_sale
    * (1 - oi.discount_rate)) > 10000
ORDER BY net_revenue DESC;


--Q4. Find customers who have placed at least two delivered orders. Show their customer ID, name, number of delivered orders, and total net spend.

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS delivered_orders,
    ROUND(
        SUM(
            oi.quantity * oi.unit_price_at_sale
            * (1 - oi.discount_rate)
        )::numeric,
        2
    ) AS total_net_spend
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY
    c.customer_id,
    c.customer_name
HAVING COUNT(DISTINCT o.order_id) >= 2
ORDER BY total_net_spend DESC;

--Q5. Find all customers and their delivered order counts.

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
    AND o.order_status = 'Delivered'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_orders DESC;


--Q6.Find products priced above the average price

SELECT
    product_name,
    category,
    unit_price,
    (SELECT AVG(unit_price) FROM products) AS average_price
FROM products
WHERE unit_price > (SELECT AVG(unit_price) FROM products);


--Q7. Find customers who have never placed a delivered order

SELECT
    customer_id,
    customer_name,
    city
FROM customers c
WHERE NOT EXISTS 
	(SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
      AND o.order_status = 'Delivered');


--Q8. Find the number of delivered orders and net revenue for each month.
SELECT
    EXTRACT(YEAR FROM o.order_date) AS year,
    EXTRACT(MONTH FROM o.order_date) AS month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.quantity * oi.unit_price_at_sale * (1 - oi.discount_rate))::numeric, 2) AS net_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY
    EXTRACT(YEAR FROM o.order_date),
    EXTRACT(MONTH FROM o.order_date)
ORDER BY year, month;


--Q9. Classify products based on stock quantity
SELECT
    product_name,
    stock_quantity,
    CASE
        WHEN stock_quantity < 20 THEN 'Low Stock'
        WHEN stock_quantity <= 40 THEN 'Moderate Stock'
        ELSE 'High Stock'
    END AS stock_status
FROM products;

--Q10. Count delivered, returned, and cancelled orders for each employee
SELECT
    e.employee_id,
    e.employee_name,
    COUNT(CASE WHEN o.order_status = 'Delivered' THEN 1 END) AS delivered_orders,
    COUNT(CASE WHEN o.order_status = 'Returned' THEN 1 END) AS returned_orders,
    COUNT(CASE WHEN o.order_status = 'Cancelled' THEN 1 END) AS cancelled_orders
FROM Employees e
LEFT JOIN orders o
    ON e.employee_id = o.employee_id
GROUP BY e.employee_id, e.employee_name
ORDER BY e.employee_id;


--Q11. Rank products in each category by net revenue
SELECT
    p.category,
    p.product_name,
    COALESCE(SUM(oi.quantity * oi.unit_price_at_sale * (1 - oi.discount_rate)), 0) AS net_revenue,
    RANK() OVER (
        PARTITION BY p.category
        ORDER BY COALESCE(SUM(oi.quantity * oi.unit_price_at_sale * (1 - oi.discount_rate)), 0) DESC
    ) AS product_rank
FROM products p
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
LEFT JOIN orders o
    ON oi.order_id = o.order_id
    AND o.order_status = 'Delivered'
WHERE oi.order_id IS NULL OR o.order_id IS NOT NULL
GROUP BY p.category, p.product_id, p.product_name
ORDER BY p.category, product_rank;

--Q12. Calculate monthly revenue and running total
SELECT
    DATE_TRUNC('month', o.order_date)::date AS month,
    ROUND(SUM(oi.quantity * oi.unit_price_at_sale * (1 - oi.discount_rate))::numeric, 2) AS monthly_revenue,
    ROUND(
        SUM(SUM(oi.quantity * oi.unit_price_at_sale * (1 - oi.discount_rate))) OVER (
            ORDER BY DATE_TRUNC('month', o.order_date)
        )::numeric,
        2
    ) AS running_total
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY DATE_TRUNC('month', o.order_date)
ORDER BY month;


--Q13. Find returned orders and their total order value
SELECT
    c.customer_name,
    r.return_date,
    r.return_reason,
    SUM(oi.quantity * oi.unit_price_at_sale) AS total_order_value
FROM returns r
JOIN orders o
    ON r.order_id = o.order_id
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    c.customer_name,
    r.return_date,
    r.return_reason,
    o.order_id
ORDER BY r.return_date;


--Q14. Find customers whose net revenue is above the average
WITH customer_revenue AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(oi.quantity * oi.unit_price_at_sale * (1 - oi.discount_rate)) AS net_revenue
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY c.customer_id, c.customer_name
)
SELECT
    customer_id,
    customer_name,
    ROUND(net_revenue::numeric, 2) AS net_revenue
FROM customer_revenue
WHERE net_revenue > (
    SELECT AVG(net_revenue)
    FROM customer_revenue
)
ORDER BY net_revenue DESC;

--Q15. Find the top three customers by delivered net spend
WITH customer_sales AS (
    SELECT
        c.customer_id,
        c.customer_name,
        COUNT(DISTINCT o.order_id) AS total_orders,
        SUM(oi.quantity * oi.unit_price_at_sale * (1 - oi.discount_rate)) AS net_spend
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY c.customer_id, c.customer_name
)
SELECT
    customer_name,
    total_orders,
    ROUND(net_spend::numeric, 2) AS net_spend,
    ROUND(
        (net_spend * 100.0 / SUM(net_spend) OVER ())::numeric,
        2
    ) AS revenue_percentage
FROM customer_sales
ORDER BY net_spend DESC
LIMIT 3;