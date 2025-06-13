
INSERT INTO Category (category_name) VALUES ('Electronics'), ('Clothing'), ('Books');

INSERT INTO Product (name, category_id, price, stock_quantity)
VALUES 
('Laptop', 1, 60000.00, 10),
('T-Shirt', 2, 500.00, 50),
('Novel', 3, 300.00, 20);

INSERT INTO Customer (name, email, phone, address)
VALUES 
('Ravi', 'ravi@example.com', '9876543210', 'Delhi'),
('Shyam', 'shyam@example.com', '9123456780', 'Mumbai');

INSERT INTO Orders (customer_id, order_date, status)
VALUES 
(1, '2025-06-10', 'Confirmed'),
(2, '2025-06-11', 'Pending');

INSERT INTO OrderDetails (order_id, product_id, quantity, price)
VALUES 
(1, 1, 1, 60000.00),
(1, 3, 2, 600.00),
(2, 2, 3, 1500.00);

INSERT INTO Payment (order_id, payment_date, amount, method, status)
VALUES 
(1, '2025-06-10', 61200.00, 'Credit Card', 'Paid'),
(2, '2025-06-11', 1500.00, 'UPI', 'Pending');


