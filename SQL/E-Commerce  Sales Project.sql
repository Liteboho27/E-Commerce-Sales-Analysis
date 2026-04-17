SELECT * FROM ecommerce_sales_data;

-- Create copy original table
CREATE TABLE ecommerce_sales
LIKE ecommerce_sales_data;

-- Insert data into the new table
INSERT ecommerce_sales
SELECT * FROM ecommerce_sales_data;

-- Check for and remove duplicates (Create unique values first because data does not have unique values, those with the same unique value are duplicates)
WITH duplicate_cte AS 
	(SELECT * , ROW_NUMBER() OVER (PARTITION BY category, region, quantity, sales, profit) AS row_num
	FROM ecommerce_sales)
SELECT * 
FROM duplicate_cte
WHERE row_num > 1;

-- Standardising the data
ALTER TABLE ecommerce_sales
CHANGE COLUMN `Order Date` Order_Date DATE,
CHANGE COLUMN `Product Name` Product_name VARCHAR (200);

ALTER TABLE ecommerce_sales
MODIFY COLUMN category VARCHAR(80),
MODIFY COLUMN region VARCHAR(80),
MODIFY COLUMN sales DECIMAL(12,2),
MODIFY COLUMN profit DECIMAL(12,2);

-- Check for NULLS and blanks
SELECT DISTINCT region, category, product_name
FROM ecommerce_sales
WHERE quantity IS NULL OR quantity = ''; -- No NULLS

-- Eerliest and latest order dates
SELECT MIN(order_date) AS earliest_order,
	MAX(order_date) AS latest_order
FROM ecommerce_sales;

-- EDA 
SELECT 
    COUNT(DISTINCT product_name) AS unique_products,
    COUNT(DISTINCT category) AS unique_categories,
    COUNT(DISTINCT region) AS unique_regions
FROM ecommerce_sales;

-- Total Number of orders
  SELECT COUNT(*) AS total_orders
FROM ecommerce_sales;

-- Total quantity sold per region
SELECT 
	region,
    COUNT(quantity) AS total_quantity,
    SUM(sales) AS total_sales,
    ROUND(SUM(profit), 0) AS total_profit
FROM ecommerce_sales
GROUP BY region
ORDER BY total_quantity;
    
-- Running total orders
SELECT 
	order_month,
	monthly_orders,
	SUM(monthly_orders) OVER (ORDER BY order_month) AS running_totals
FROM
	(SELECT COUNT(*) AS monthly_orders,
			DATE_FORMAT(order_date, '%Y-%m') AS order_month
    FROM ecommerce_sales
    GROUP BY order_month) AS orders
    ORDER BY order_month;

-- Top categories by number of orders
SELECT category,
	COUNT(*) AS order_number
FROM ecommerce_sales
GROUP BY category
ORDER BY COUNT(*) DESC;

-- Top region by orders
SELECT region, 
	COUNT(*) AS order_number
FROM ecommerce_sales
GROUP BY region
ORDER BY COUNT(*) DESC;

-- Top 5 products by orders
SELECT product_name, 
	COUNT(*) AS order_number
FROM ecommerce_sales
GROUP BY product_name
ORDER BY COUNT(*) DESC
LIMIT 5;

-- Number of Products sold per category and region
SELECT 
	category, 
    region,
    COUNT(product_name) AS quantity_sold
FROM ecommerce_sales
GROUP BY category, region
ORDER BY quantity_sold DESC;

-- Total sales and profit per month
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    COUNT(*) AS orders,
    ROUND(SUM(sales), 0) AS total_sales,
    ROUND(SUM(profit), 0) AS total_profit
FROM ecommerce_sales
GROUP BY month
ORDER BY month;

-- Total sales and profit by category
SELECT 
	category, 
    ROUND(SUM(sales), 0) AS total_sales,
	ROUND(SUM(profit), 0) AS total_profit
FROM ecommerce_sales
GROUP BY category
ORDER BY total_sales DESC, total_profit DESC;

-- Sales and Profit by region
SELECT 
	region,
    ROUND(SUM(sales), 0) AS total_sales,
    ROUND(SUM(profit), 0) AS total_profit
FROM ecommerce_sales
GROUP BY region
ORDER BY total_profit;

-- Profit margin per year
SELECT 
	year,
    ROUND((total_profit / total_sales), 2) * 100  AS profit_margin
FROM
	(SELECT (DATE_FORMAT(order_date, '%Y')) AS year,
    ROUND(SUM(sales), 0) AS total_sales, 
    ROUND(SUM(profit), 0) AS total_profit
FROM ecommerce_sales
GROUP BY year) t
GROUP BY year
ORDER BY year;

-- Product Analysis
SELECT 
	product_name,
    total_quantity,
    ROUND((total_profit / total_sales) * 100, 2) AS profit_margin
FROM 
	(SELECT product_name,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(sales), 2) AS total_sales
	FROM ecommerce_sales
	GROUP BY product_name
	ORDER BY total_quantity DESC
	LIMIT 5) t
GROUP BY product_name
ORDER BY total_quantity DESC;
