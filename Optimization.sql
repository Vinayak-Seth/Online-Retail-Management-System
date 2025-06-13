-- Optimize customer lookups by email
CREATE INDEX idx_customer_email ON Customer(email);

-- Optimize product searches by name
CREATE INDEX idx_product_name ON Product(name);

-- Optimize filtering and grouping by order date
CREATE INDEX idx_orders_order_date ON Orders(order_date);

-- Optimize payment reports by date
CREATE INDEX idx_payment_payment_date ON Payment(payment_date);

-- Optimize payment status and method queries
CREATE INDEX idx_payment_method_status ON Payment(method, status);

-- Optimize sales trends by category and product
CREATE INDEX idx_product_category ON Product(category_id, name);

-- Optimize customer order history
CREATE INDEX idx_orders_customer_id ON Orders(customer_id);

-- Optimize order detail joins
CREATE INDEX idx_orderdetails_order_product ON OrderDetails(order_id, product_id);

-- Optimize product lookup in order details
CREATE INDEX idx_orderdetails_product_id ON OrderDetails(product_id);

-- Optimize filtering low stock
CREATE INDEX idx_product_stock_quantity ON Product(stock_quantity);
