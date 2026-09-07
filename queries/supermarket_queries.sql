/* © 2026 Catherine Bantilan. All rights reserved. 
@https://github.com/cathbantilan/Supermarket-Sales
*/


--FOR KPIS
--1. Total Sales, COGS, Gross Income, Units Sold, Transactions, Average Rating.
SELECT ROUND(SUM(Sales), 2) AS Total_Sales,ROUND(SUM(cogs), 2) AS Total_Cogs, ROUND(SUM(`gross income`), 2) AS Total_Gross_Income, SUM(Quantity) AS Total_Quantity, COUNT(`Invoice ID`) AS Total_Transaction, ROUND(AVG(Rating), 2) AS Average_Rating
FROM `project-71609021-56d8-464e-b6d.supermarket_analysis.supermarket_sales`;


--MONTHLY PERFORMANCE/MONTHLY SALES TRENDS (SALES & GROSS INCOME)
--2. Sales and gross income by month.
  SELECT
  FORMAT_DATE('%B', Date) AS Month,
  EXTRACT(MONTH FROM Date) AS Month_Number,
  ROUND(SUM(Sales), 2) AS Total_Sales,
  ROUND(SUM(`gross income`), 2) AS Total_Gross_Income
FROM `project-71609021-56d8-464e-b6d.supermarket_analysis.supermarket_sales`
GROUP BY
  EXTRACT(MONTH FROM Date),
  Month
ORDER BY
  Month_Number;

--BRANCH PERFORMANCE
--3. Sales, profit, units, rating by branch/city.
SELECT DISTINCT Branch, City, ROUND(SUM(Sales), 2) AS Total_Sales,  ROUND(SUM(`gross income`), 2) AS Total_Gross_Income, AVG(Rating) AS Average_Rating
FROM `project-71609021-56d8-464e-b6d.supermarket_analysis.supermarket_sales`
GROUP BY Branch, City
ORDER BY Total_Sales DESC;

--PRODUCT PERFORMANCE
--4. Sales, profit, units, rating by product line.
SELECT DISTINCT `Product line`,  ROUND(SUM(Sales), 2) AS Total_Sales, ROUND(SUM(`gross income`), 2) AS Total_Gross_Income,  COUNT(`Invoice ID`) Total_Transaction, AVG(Rating) AS Average_Rating
FROM `project-71609021-56d8-464e-b6d.supermarket_analysis.supermarket_sales`
GROUP BY `Product line`
ORDER BY Total_Sales DESC;


--CUSTOMER PERFORMANCE
--5. Member vs Normal — sales, transactions, average transaction, units, rating.
SELECT DISTINCT `Customer Type`, ROUND(SUM(Sales), 2) AS Total_Sales, COUNT(`Invoice ID`) AS Total_Transaction, SUM(Quantity) AS Total_Units, ROUND(AVG(Rating), 2) AS Average_Rating
FROM `project-71609021-56d8-464e-b6d.supermarket_analysis.supermarket_sales`
GROUP BY `Customer Type`
ORDER BY Total_Sales DESC;


--PAYMENT PERFORMANCE
--6. Payment method — sales, transactions, average transaction.
SELECT DISTINCT Payment, ROUND(SUM(Sales), 2) AS Total_Sales,  COUNT(`Invoice ID`) AS Total_Transaction, ROUND(AVG(Rating),2) AS Average_Rating
FROM `project-71609021-56d8-464e-b6d.supermarket_analysis.supermarket_sales`
GROUP BY Payment
ORDER BY Total_Sales DESC;

--GENDER/DEMOGRAPHICS
--7. Sales, transactions, average transaction, units by gender.
SELECT DISTINCT Gender, SUM(Quantity) AS Total_Units, COUNT(`Invoice ID`) AS Total_Transaction, ROUND(SUM(Sales), 2) AS Total_Sales
FROM `project-71609021-56d8-464e-b6d.supermarket_analysis.supermarket_sales`
GROUP BY Gender
ORDER BY Total_Sales DESC;

--BRANCH CUSTOMER SATISFACTION
--8. Average rating by branch/city.
SELECT DISTINCT Branch,City, ROUND(AVG(Rating),2) AS Average_Rating
FROM `project-71609021-56d8-464e-b6d.supermarket_analysis.supermarket_sales`
GROUP BY Branch, City
ORDER BY Average_Rating DESC;

--GROSS INCOME
--9. Average gross margin % and gross income by product line.
SELECT
  `Product line`,
  ROUND(SUM(`gross income`), 2) AS Total_Gross_Income
FROM `project-71609021-56d8-464e-b6d.supermarket_analysis.supermarket_sales`
GROUP BY `Product line`
ORDER BY Total_Gross_Income DESC;


