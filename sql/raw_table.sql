CREATE SCHEMA IF NOT EXISTS raw;

CREATE TABLE IF NOT EXISTS raw.customers (
    customer_id TEXT,
    customer_unique_id TEXT,
    customer_zip_code_prefix TEXT,
    customer_city TEXT,
    customer_state TEXT
);

COPY raw.customers
FROM '/Users/vikramg/Documents/E-commerce Data Project/data/raw/olist_customers_dataset.csv'
DELIMITER ','
CSV HEADER;



CREATE TABLE IF NOT EXISTS raw.orders (
    order_id TEXT,
    customer_id TEXT,
    order_status TEXT,
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

COPY raw.orders
FROM '/Users/vikramg/Documents/E-commerce Data Project/data/raw/olist_orders_dataset.csv'
DELIMITER ','
CSV HEADER;


CREATE TABLE IF NOT EXISTS raw.order_items (
    order_id TEXT,
    order_item_id INTEGER,
    product_id TEXT,
    seller_id TEXT,
    shipping_limit_date TIMESTAMP,
    price NUMERIC,
    freight_value NUMERIC
);

COPY raw.order_items
FROM '/Users/vikramg/Documents/E-commerce Data Project/data/raw/olist_order_items_dataset.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE IF NOT EXISTS raw.order_payments (
    order_id TEXT,
    payment_sequential INTEGER,
    payment_type TEXT,
    payment_installments INTEGER,
    payment_value NUMERIC
);

COPY raw.order_payments
FROM '/Users/vikramg/Documents/E-commerce Data Project/data/raw/olist_order_payments_dataset.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE IF NOT EXISTS raw.products (
    product_id TEXT,
    product_category_name TEXT,
    product_name_length INTEGER,
    product_description_length INTEGER,
    product_photos_qty INTEGER,
    product_weight_g INTEGER,
    product_length_cm INTEGER,
    product_height_cm INTEGER,
    product_width_cm INTEGER
);

COPY raw.products
FROM '/Users/vikramg/Documents/E-commerce Data Project/data/raw/olist_products_dataset.csv'
DELIMITER ','
CSV HEADER;


CREATE TABLE IF NOT EXISTS raw.sellers (
    seller_id TEXT,
    seller_zip_code_prefix TEXT,
    seller_city TEXT,
    seller_state TEXT
);

COPY raw.sellers
FROM '/Users/vikramg/Documents/E-commerce Data Project/data/raw/olist_sellers_dataset.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE IF NOT EXISTS raw.geolocation (
    geolocation_zip_code_prefix TEXT,
    geolocation_lat NUMERIC,
    geolocation_lng NUMERIC,
    geolocation_city TEXT,
    geolocation_state TEXT
);

COPY raw.geolocation
FROM '/Users/vikramg/Documents/E-commerce Data Project/data/raw/olist_geolocation_dataset.csv'
DELIMITER ','
CSV HEADER;



