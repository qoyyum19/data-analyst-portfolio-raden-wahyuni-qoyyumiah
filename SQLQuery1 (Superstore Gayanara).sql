-- Superstore Gayanara
-- Data Analyst with basic SQL by Raden Wahyuni Qoyyumiah

-- Checking & Identification Data
SELECT * 
FROM dbo.customers;

SELECT 
COUNT (*) AS total_customer
FROM dbo.customers;

SELECT phone
FROM dbo.customers
WHERE phone IS NULL;

SELECT *
FROM dbo.order_items;

SELECT DISTINCT item_id
FROM dbo.order_items;

SELECT DISTINCT product_id
FROM dbo.order_items;

SELECT *
FROM dbo.orders;

SELECT *
FROM dbo.products;

SELECT DISTINCT category
FROM dbo.products;

SELECT *
FROM dbo.products
WHERE stock = 0;

SELECT DISTINCT sub_category
FROM dbo.products;

SELECT *
FROM dbo.products
WHERE material IS NULL;

SELECT *
FROM dbo.reviews;

SELECT *
FROM dbo.reviews
WHERE review_text IS NULL;

--Analysis
-- 1. Business Overview
   -- Total customers (800 customers)
SELECT 
COUNT (*) AS total_customer
FROM dbo.customers;

   -- Total orders
SELECT 
COUNT (*) AS total_orders
FROM dbo.orders;

   -- Total Products
SELECT 
COUNT (*) AS total_products
FROM dbo.products;

   -- Total Order Items
 SELECT 
 COUNT (*) AS total_order_items
 FROM dbo.order_items;

-- 2. Total Revenue
SELECT
	SUM(quantity * unit_price_idr) AS total_revenue
FROM dbo.order_items;

SELECT
    SUM(subtotal_idr) AS total_revenue
FROM dbo.order_items;

-- 3. Average Order Value
SELECT *
FROM dbo.order_items;

SELECT
    SUM(quantity * unit_price_idr) 
    / COUNT(DISTINCT order_id) AS average_order_value
FROM dbo.order_items;

-- 4. Sales Trend
SELECT *
FROM dbo.orders;

SELECT
    YEAR(o.order_date) AS order_year,
    MONTH(o.order_date) AS order_month,
    SUM(oi.quantity * oi.unit_price_idr) AS revenue
FROM dbo.orders o
JOIN dbo.order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    YEAR(o.order_date),
    MONTH(o.order_date)
ORDER BY
    order_year,
    order_month;

-- 5. Top 10 Best Selling Products
SELECT *
FROM dbo.products;

SELECT *
FROM dbo.order_items;

SELECT TOP 10
    p.product_id,
    p.name,
    SUM(oi.quantity) AS total_quantity,
    SUM(oi.quantity * oi.unit_price_idr) AS total_revenue
FROM dbo.order_items oi
JOIN dbo.products p
    ON oi.product_id = p.product_id
GROUP BY
    p.product_id,
    p.name
ORDER BY total_revenue DESC;