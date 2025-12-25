USE SalesAnalysis;
GO

Select *
from orders;

--Data Check
SELECT *
FROM orders
WHERE Sales IS NULL
   OR Region IS NULL
   OR Order_Date IS NULL;


SELECT Order_ID, COUNT(*) AS cnt
FROM orders
GROUP BY Order_ID
HAVING COUNT(*) > 1;

SELECT *
FROM orders
WHERE Ship_Date < Order_Date;

SELECT DISTINCT Region
FROM orders;

Select COUNT(*)
FROM orders;


--Total Sales by Region
Select Region,SUM(Sales) as Total_sales
From orders
Group by Region
Order by Total_sales DESC;

--Monthly Sales Trend
Select FORMAT(Order_Date,'yyyy-MM')as Month,SUM(Sales) as Total_sales
From orders
Group by FORMAT(Order_Date,'yyyy-MM')
Order by Total_sales DESC;

--Cateogry Wise Contribution
Select Category,SUM(Sales) as Total_sales
From orders
Group by Category
Order by Total_sales DESC;

--Top 10 Products by Sales
Select Top 10 Product_Name,SUM(Sales)as Total_sales
From orders
Group by Product_Name
Order by Total_sales DESC;

--Region X Category Mix
SELECT Region,
       Category,
       SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Region, Category
ORDER BY Region;
