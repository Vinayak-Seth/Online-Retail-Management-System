-- 1. Total Sales Revenue
SELECT SUM(amount) AS total_revenue
FROM Payment
WHERE status = 'Paid';

-- 2. Top-Selling Products
SELECT p.name, SUM(od.quantity) AS total_sold
FROM OrderDetails od
JOIN Product p ON od.product_id = p.product_id
GROUP BY p.name
ORDER BY total_sold DESC;

-- 3. Sales by Category
SELECT c.category_name, SUM(od.quantity * od.price) AS total_sales
FROM OrderDetails od
JOIN Product p ON od.product_id = p.product_id
JOIN Category c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_sales DESC;

-- 4. Customer Purchase History
SELECT c.name, o.order_id, o.order_date, SUM(od.quantity * od.price) AS order_total
FROM Customer c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN OrderDetails od ON o.order_id = od.order_id
GROUP BY o.order_id, c.name, o.order_date
ORDER BY o.order_date DESC;

-- 5. Low Stock Products
SELECT product_id, name, stock_quantity
FROM Product
WHERE stock_quantity < 5;

-- 6. Monthly Revenue Trend
SELECT DATE_FORMAT(payment_date, '%Y-%m') AS month, SUM(amount) AS revenue
FROM Payment
WHERE status = 'Paid'
GROUP BY month
ORDER BY month;

-- 7. Pending Orders
SELECT o.order_id, c.name, o.order_date, o.status
FROM Orders o
JOIN Customer c ON o.customer_id = c.customer_id
WHERE o.status = 'Pending';

-- 8. Revenue per Customer
SELECT c.name, SUM(p.amount) AS total_spent
FROM Customer c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Payment p ON o.order_id = p.order_id
WHERE p.status = 'Paid'
GROUP BY c.name
ORDER BY total_spent DESC;

-- 9. Repeat Customers
SELECT c.customer_id, c.name, COUNT(o.order_id) AS total_orders
FROM Customer c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(o.order_id) > 1;

-- 10. Inactive Customers (No Orders in Last 30 Days)
SELECT c.customer_id, c.name
FROM Customer c
LEFT JOIN Orders o ON c.customer_id = o.customer_id 
    AND o.order_date >= CURDATE() - INTERVAL 30 DAY
WHERE o.order_id IS NULL;

-- 11. Daily Sales Summary (Last 7 Days)
SELECT order_date,
       COUNT(DISTINCT o.order_id) AS total_orders,
       SUM(od.quantity * od.price) AS total_sales
FROM Orders o
JOIN OrderDetails od ON o.order_id = od.order_id
WHERE order_date >= CURDATE() - INTERVAL 7 DAY
GROUP BY order_date
ORDER BY order_date DESC;

-- 12. Sales Summary by Payment Method
SELECT method,
       COUNT(payment_id) AS total_transactions,
       SUM(amount) AS total_amount
FROM Payment
WHERE status = 'Paid'
GROUP BY method
ORDER BY total_amount DESC;

-- 13. Average Order Value (AOV)
SELECT ROUND(SUM(amount) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM Payment
WHERE status = 'Paid';

-- 14. Category-wise Monthly Sales Trend
SELECT c.category_name,
       DATE_FORMAT(o.order_date, '%Y-%m') AS month,
       SUM(od.quantity * od.price) AS monthly_sales
FROM Category c
JOIN Product p ON c.category_id = p.category_id
JOIN OrderDetails od ON p.product_id = od.product_id
JOIN Orders o ON od.order_id = o.order_id
GROUP BY c.category_name, month
ORDER BY c.category_name, month;

-- 15.Total sales per category
SELECT c.category_name, SUM(od.price * od.quantity) AS total_sales
FROM OrderDetails od
JOIN Product p ON od.product_id = p.product_id
JOIN Category c ON p.category_id = c.category_id
GROUP BY c.category_name;
