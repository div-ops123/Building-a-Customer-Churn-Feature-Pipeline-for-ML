-- Insert sample products
INSERT INTO dim_products (product_id, name, category) VALUES
(101, 'Classic T-Shirt', 'Apparel'),
(102, 'Denim Jeans', 'Apparel'),
(103, 'Running Sneakers', 'Footwear'),
(104, 'Leather Wallet', 'Accessories'),
(105, 'Smartwatch', 'Electronics'),
(106, 'Bluetooth Earbuds', 'Electronics'),
(107, 'Backpack', 'Accessories'),
(108, 'Yoga Mat', 'Sports'),
(109, 'Water Bottle', 'Sports'),
(110, 'Sunglasses', 'Accessories'),
(111, 'Formal Shirt', 'Apparel'),
(112, 'Sports Socks', 'Footwear');


-- Insert sample customers
INSERT INTO dim_customers (customer_id, name, email, join_date, city) VALUES
(201, 'Alice Johnson', 'alice.johnson@example.com', '2022-01-15', 'New York'),
(202, 'Bob Smith', 'bob.smith@example.com', '2021-11-03', 'Los Angeles'),
(203, 'Carol Lee', 'carol.lee@example.com', '2023-03-22', 'Chicago'),
(204, 'David Brown', 'david.brown@example.com', '2022-07-10', 'Houston'),
(205, 'Eva Davis', 'eva.davis@example.com', '2021-12-05', 'Phoenix'),
(206, 'Frank Wilson', 'frank.wilson@example.com', '2023-01-18', 'Philadelphia'),
(207, 'Grace Miller', 'grace.miller@example.com', '2022-05-30', 'San Antonio'),
(208, 'Henry Taylor', 'henry.taylor@example.com', '2021-09-12', 'San Diego'),
(209, 'Isabella Moore', 'isabella.moore@example.com', '2023-04-08', 'Dallas'),
(210, 'Jack Anderson', 'jack.anderson@example.com', '2022-02-25', 'San Jose'),
(211, 'Karen Thomas', 'karen.thomas@example.com', '2022-08-14', 'Austin');


-- Insert dim_dates automatically
WITH date_series 
AS (
    SELECT 
		generate_series('2020-01-01'::date, '2026-12-31'::date, interval '1 day') AS dt
)
INSERT INTO dim_dates (date, year, month, week, day_of_week, month_name, quarter)
SELECT 
    dt AS date,
    EXTRACT(YEAR FROM dt)::INT AS year,
    EXTRACT(MONTH FROM dt)::INT AS month,
    EXTRACT(WEEK FROM dt)::INT AS week,
    TO_CHAR(dt, 'Day') AS day_of_week,
    TO_CHAR(dt, 'Month') AS month_name,
    'Q' || EXTRACT(QUARTER FROM dt)::INT AS quarter
FROM date_series;


-- Insert sample fact_orders
INSERT INTO fact_orders (order_id, customer_id, product_id, order_date, quantity, price, discount) VALUES
-- Customer 201 (Alice) - multiple orders
(5001, 201, 101, '2025-12-15', 1, 25.0, 0.05),
(5001, 201, 102, '2025-12-15', 2, 40.0, 0.05),
(5002, 201, 103, '2025-12-28', 1, 60.0, 0.10),
(5003, 201, 104, '2026-01-10', 1, 35.0, 0.0),  -- Recent order

-- Customer 202 (Bob)
(5004, 202, 105, '2025-11-05', 1, 120.0, 0.15),
(5004, 202, 106, '2025-11-05', 1, 80.0, 0.10),
(5005, 202, 101, '2025-12-20', 3, 75.0, 0.0),

-- Customer 203 (Carol)
(5006, 203, 107, '2025-12-01', 1, 50.0, 0.05),
(5007, 203, 108, '2025-12-15', 2, 40.0, 0.0),
(5008, 203, 109, '2026-01-12', 1, 15.0, 0.0),  -- Recent order

-- Customer 204 (David)
(5009, 204, 110, '2025-10-22', 1, 60.0, 0.0),
(5010, 204, 101, '2025-11-30', 2, 50.0, 0.0),
(5011, 204, 102, '2025-12-25', 1, 20.0, 0.10),

-- Customer 205 (Eva)
(5012, 205, 103, '2025-12-05', 1, 60.0, 0.05),
(5013, 205, 104, '2025-12-15', 1, 35.0, 0.0),
(5014, 205, 105, '2026-01-14', 1, 120.0, 0.10),  -- Recent order

-- Customer 206 (Frank)
(5015, 206, 106, '2025-11-10', 1, 80.0, 0.05),
(5016, 206, 107, '2025-12-20', 1, 50.0, 0.0),
(5017, 206, 108, '2026-01-16', 2, 40.0, 0.05),  -- Recent order

-- Customer 207 (Grace)
(5018, 207, 109, '2025-10-15', 3, 45.0, 0.0),
(5019, 207, 110, '2025-12-18', 1, 60.0, 0.0),
(5020, 207, 101, '2026-01-18', 1, 25.0, 0.0),  -- Recent order

-- Customer 208 (Henry)
(5021, 208, 102, '2025-11-22', 2, 40.0, 0.0),
(5022, 208, 103, '2025-12-30', 1, 60.0, 0.10),
(5023, 208, 104, '2026-01-20', 1, 35.0, 0.0),  -- Recent order

-- Customer 209 (Isabella)
(5024, 209, 105, '2025-12-12', 1, 120.0, 0.05),
(5025, 209, 106, '2025-12-28', 2, 160.0, 0.10),
(5026, 209, 107, '2026-01-21', 1, 50.0, 0.0),  -- Recent order

-- Customer 210 (Jack)
(5027, 210, 108, '2025-12-05', 1, 40.0, 0.0),
(5028, 210, 109, '2025-12-20', 2, 30.0, 0.05),
(5029, 210, 110, '2026-01-22', 1, 60.0, 0.0);  -- Recent order

