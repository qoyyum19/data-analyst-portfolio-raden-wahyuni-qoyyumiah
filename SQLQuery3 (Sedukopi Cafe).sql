-- Cafe
-- Data Analyst with basic SQL by Raden Wahyuni Qoyyumiah

-- Checking & Identification Data
SELECT *
FROM dbo.menu_items;

SELECT *
FROM dbo.menu_items
WHERE category = 'Coffee';

SELECT *
FROM dbo.order_details;

SELECT *
FROM dbo.order_details
WHERE notes IS NULL;

SELECT * 
FROM dbo.orders;

SELECT * 
FROM dbo.orders
WHERE payment_method = 'Tunai';

SELECT *
FROM dbo.outlets;

SELECT DISTINCT city
FROM dbo.outlets;

SELECT DISTINCT province
FROM dbo.outlets;

SELECT  *
FROM dbo.staff;

SELECT
status,
COUNT(*) AS total_status
FROM dbo.staff
GROUP BY status
ORDER BY total_status DESC;

-- Data Quality Check 
SELECT 
COUNT(*) AS total_menu_items
FROM dbo.menu_items;

SELECT
COUNT(*) AS total_order_details
FROM dbo.order_details;

SELECT
COUNT(*) AS total_orders
FROM dbo.orders;

SELECT
COUNT(*) AS total_outlets
FROM dbo.outlets;

SELECT
COUNT(*) AS total_staff
FROM dbo.staff;

SELECT
    order_id,
    COUNT(*) AS total
FROM dbo.orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Analysis
-- 1. Revenue by month
SELECT *
FROM dbo.orders;

SELECT *
FROM dbo.order_details;

SELECT *
FROM dbo.menu_items;

SELECT
    YEAR(o.order_date) AS year,
    MONTH(o.order_date) AS month,
    SUM(od.quantity * od.unit_price) AS total_revenue
FROM dbo.orders o
JOIN dbo.order_details od
    ON o.order_id = od.order_id
JOIN dbo.menu_items mi
    ON od.item_id = mi.item_id
GROUP BY
    YEAR(o.order_date),
    MONTH(o.order_date)
ORDER BY
    year,
    month;

-- 2. Revenue by year
SELECT *
FROM dbo.order_details;

SELECT *
FROM dbo.orders;

SELECT
    YEAR(o.order_date) AS year,
    SUM(od.quantity * od.unit_price) AS total_revenue
FROM dbo.orders o
JOIN dbo.order_details od
    ON o.order_id = od.order_id
JOIN dbo.menu_items mi
    ON od.item_id = mi.item_id
GROUP BY YEAR(o.order_date)
ORDER BY year;

-- 3. Top 10 Menu items
SELECT *
FROM dbo.menu_items;

SELECT TOP 10
    mi.item_id,
    mi.name,
    SUM(od.quantity) AS total_quantity_sold
FROM dbo.order_details od
JOIN dbo.menu_items mi
    ON od.item_id = mi.item_id
GROUP BY
    mi.item_id,
    mi.name
ORDER BY
    total_quantity_sold DESC;

-- 4. Average Price by category
SELECT
    category,
    AVG(price) AS average_price
FROM dbo.menu_items
GROUP BY category
ORDER BY average_price DESC;

-- 5. Total Item by order
SELECT
    o.order_id,
    SUM(od.quantity) AS total_items
FROM dbo.orders o
JOIN dbo.order_details od
    ON o.order_id = od.order_id
GROUP BY o.order_id
ORDER BY total_items DESC;