CREATE TABLE dim_products (
    product_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    category TEXT
);

CREATE TABLE dim_customers (
    customer_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE,
    join_date DATE NOT NULL,
    city TEXT
);

CREATE TABLE dim_dates (
    date DATE PRIMARY KEY,
    year INTEGER,
    month INTEGER,
    week INTEGER,
    day_of_week TEXT,
	month_name TEXT,
	quarter CHAR(2)
);


CREATE TABLE fact_orders (
    row_id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL,
    customer_id INTEGER REFERENCES dim_customers(customer_id),
    product_id INTEGER REFERENCES dim_products(product_id),
    order_date DATE REFERENCES dim_dates(date),
    quantity INTEGER NOT NULL,
    price REAL NOT NULL,
    discount REAL DEFAULT 0.0
);
