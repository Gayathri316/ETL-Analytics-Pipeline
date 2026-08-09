USE sales_analytics;

-- ============================================================
-- ETL ANALYTICS PIPELINE
-- SQL BUSINESS ANALYSIS QUERIES
-- ============================================================


-- ============================================================
-- 1. TOTAL NUMBER OF ORDERS
-- ============================================================

SELECT COUNT(*) AS total_orders
FROM sales;


-- ============================================================
-- 2. TOTAL SALES
-- ============================================================

SELECT
    ROUND(SUM(Sales), 2) AS total_sales
FROM sales;


-- ============================================================
-- 3. TOTAL PROFIT
-- ============================================================

SELECT
    ROUND(SUM(Profit), 2) AS total_profit
FROM sales;


-- ============================================================
-- 4. AVERAGE ORDER VALUE
-- ============================================================

SELECT
    ROUND(AVG(Sales), 2) AS average_order_value
FROM sales;


-- ============================================================
-- 5. SALES BY REGION
-- ============================================================

SELECT
    Region,
    ROUND(SUM(Sales), 2) AS total_sales
FROM sales
GROUP BY Region
ORDER BY total_sales DESC;


-- ============================================================
-- 6. PROFIT BY REGION
-- ============================================================

SELECT
    Region,
    ROUND(SUM(Profit), 2) AS total_profit
FROM sales
GROUP BY Region
ORDER BY total_profit DESC;


-- ============================================================
-- 7. SALES BY CATEGORY
-- ============================================================

SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales
FROM sales
GROUP BY Category
ORDER BY total_sales DESC;


-- ============================================================
-- 8. TOP 5 PRODUCTS BY SALES
-- ============================================================

SELECT
    Product,
    ROUND(SUM(Sales), 2) AS total_sales
FROM sales
GROUP BY Product
ORDER BY total_sales DESC
LIMIT 5;


-- ============================================================
-- 9. TOP 5 PRODUCTS BY PROFIT
-- ============================================================

SELECT
    Product,
    ROUND(SUM(Profit), 2) AS total_profit
FROM sales
GROUP BY Product
ORDER BY total_profit DESC
LIMIT 5;


-- ============================================================
-- 10. MONTHLY SALES TREND
-- ============================================================

SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS month,
    ROUND(SUM(Sales), 2) AS total_sales
FROM sales
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY month;


-- ============================================================
-- 11. MONTHLY PROFIT TREND
-- ============================================================

SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS month,
    ROUND(SUM(Profit), 2) AS total_profit
FROM sales
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY month;


-- ============================================================
-- 12. OVERALL PROFIT MARGIN
-- ============================================================

SELECT
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(
        (SUM(Profit) / NULLIF(SUM(Sales), 0)) * 100,
        2
    ) AS profit_margin_percentage
FROM sales;


-- ============================================================
-- 13. AVERAGE DISCOUNT BY CATEGORY
-- ============================================================

SELECT
    Category,
    ROUND(AVG(Discount) * 100, 2) AS average_discount_percentage
FROM sales
GROUP BY Category
ORDER BY average_discount_percentage DESC;


-- ============================================================
-- 14. DISCOUNT VS SALES AND PROFIT
-- ============================================================

SELECT
    Discount,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM sales
GROUP BY Discount
ORDER BY Discount;


-- ============================================================
-- 15. SALES, PROFIT AND PROFIT MARGIN BY CATEGORY
-- ============================================================

SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(
        (SUM(Profit) / NULLIF(SUM(Sales), 0)) * 100,
        2
    ) AS profit_margin_percentage
FROM sales
GROUP BY Category
ORDER BY total_sales DESC;


-- ============================================================
-- 16. OVERALL BUSINESS KPIs
-- ============================================================

SELECT
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(AVG(Sales), 2) AS average_order_value,
    ROUND(
        (SUM(Profit) / NULLIF(SUM(Sales), 0)) * 100,
        2
    ) AS profit_margin_percentage
FROM sales;


-- ============================================================
-- 17. SALES AND PROFIT BY REGION
-- ============================================================

SELECT
    Region,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(
        (SUM(Profit) / NULLIF(SUM(Sales), 0)) * 100,
        2
    ) AS profit_margin_percentage
FROM sales
GROUP BY Region
ORDER BY total_sales DESC;


-- ============================================================
-- 18. PRODUCT PERFORMANCE
-- ============================================================

SELECT
    Product,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(
        (SUM(Profit) / NULLIF(SUM(Sales), 0)) * 100,
        2
    ) AS profit_margin_percentage
FROM sales
GROUP BY Product
ORDER BY total_sales DESC;


-- ============================================================
-- 19. TOP 10 ORDERS BY SALES
-- ============================================================

SELECT
    Order_ID,
    Order_Date,
    Product,
    Category,
    Region,
    Sales,
    Profit
FROM sales
ORDER BY Sales DESC
LIMIT 10;


-- ============================================================
-- 20. TOP 10 ORDERS BY PROFIT
-- ============================================================

SELECT
    Order_ID,
    Order_Date,
    Product,
    Category,
    Region,
    Sales,
    Profit
FROM sales
ORDER BY Profit DESC
LIMIT 10;


-- ============================================================
-- 21. LOW-PROFIT ORDERS
-- ============================================================

SELECT
    Order_ID,
    Product,
    Category,
    Region,
    Sales,
    Profit,
    Discount
FROM sales
WHERE Profit < 0
ORDER BY Profit ASC;


-- ============================================================
-- 22. ORDERS WITH HIGH DISCOUNTS
-- ============================================================

SELECT
    Order_ID,
    Product,
    Category,
    Region,
    Discount,
    Sales,
    Profit
FROM sales
WHERE Discount >= 0.20
ORDER BY Discount DESC;


-- ============================================================
-- 23. SALES BY REGION AND CATEGORY
-- ============================================================

SELECT
    Region,
    Category,
    ROUND(SUM(Sales), 2) AS total_sales
FROM sales
GROUP BY Region, Category
ORDER BY Region, total_sales DESC;


-- ============================================================
-- 24. PROFIT BY REGION AND CATEGORY
-- ============================================================

SELECT
    Region,
    Category,
    ROUND(SUM(Profit), 2) AS total_profit
FROM sales
GROUP BY Region, Category
ORDER BY Region, total_profit DESC;


-- ============================================================
-- 25. MONTHLY SALES AND PROFIT
-- ============================================================

SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS month,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(
        (SUM(Profit) / NULLIF(SUM(Sales), 0)) * 100,
        2
    ) AS profit_margin_percentage
FROM sales
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY month;


-- ============================================================
-- 26. MONTHLY ORDER COUNT
-- ============================================================

SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS month,
    COUNT(*) AS total_orders
FROM sales
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY month;


-- ============================================================
-- 27. HIGHEST SALES REGION
-- ============================================================

SELECT
    Region,
    ROUND(SUM(Sales), 2) AS total_sales
FROM sales
GROUP BY Region
ORDER BY total_sales DESC
LIMIT 1;


-- ============================================================
-- 28. HIGHEST PROFIT REGION
-- ============================================================

SELECT
    Region,
    ROUND(SUM(Profit), 2) AS total_profit
FROM sales
GROUP BY Region
ORDER BY total_profit DESC
LIMIT 1;


-- ============================================================
-- 29. HIGHEST SALES CATEGORY
-- ============================================================

SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales
FROM sales
GROUP BY Category
ORDER BY total_sales DESC
LIMIT 1;


-- ============================================================
-- 30. HIGHEST PROFIT CATEGORY
-- ============================================================

SELECT
    Category,
    ROUND(SUM(Profit), 2) AS total_profit
FROM sales
GROUP BY Category
ORDER BY total_profit DESC
LIMIT 1;