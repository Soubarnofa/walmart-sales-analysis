--Total Sales by Category
SELECT category, SUM(total_sales) AS total_revenue
FROM [cleaned_walmart_data$]
GROUP BY category
ORDER BY total_revenue DESC;

--Revenue by Branch
SELECT branch, SUM(total_sales) AS total_revenue
FROM [cleaned_walmart_data$]
GROUP BY branch
ORDER BY total_revenue DESC;

--Revenue by City
SELECT city, SUM(total_sales) AS total_revenue
FROM [cleaned_walmart_data$]
GROUP BY city
ORDER BY total_revenue DESC;

--Sales by Payment Method
SELECT payment_method, COUNT(*) AS transactions, SUM(total_sales) AS revenue
FROM [cleaned_walmart_data$]
GROUP BY payment_method
ORDER BY transactions DESC;

--Segment-Wise KPI Summary (Category × City or Branch)
--This gives management a region-wise product performance snapshot
SELECT 
  city,
  category,
  COUNT(*) AS transactions,
  SUM(total_sales) AS total_revenue,
  AVG(total_sales) AS avg_sales,
  AVG(profit) AS avg_profit
FROM [cleaned_walmart_data$]
GROUP BY city, category
ORDER BY city, total_revenue DESC;

--Low Margin Products by Category (Profitability Check)
--Highlight areas with low profitability
SELECT 
  category,
  AVG(profit_margin) AS avg_margin
FROM [cleaned_walmart_data$]
GROUP BY category
ORDER BY avg_margin ASC;

--Top 5% High-Performing Transactions by Revenue
--Useful for focusing on top orders
SELECT *
FROM [cleaned_walmart_data$]
WHERE total_sales >= (
    SELECT PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY total_sales)
    OVER ()
);

--Anomaly Detection: Sales > 3x Standard Deviation
--Corporate analysts flag outliers
WITH stats AS (
  SELECT 
    AVG(total_sales) AS avg_sales,
    STDEV(total_sales) AS stddev_sales
  FROM [cleaned_walmart_data$]
)
SELECT * 
FROM [cleaned_walmart_data$], stats
WHERE total_sales > avg_sales + 3 * stddev_sales;

--Trend Analysis: Monthly Revenue Trend
--Use this for forecasting and seasonal behavior
SELECT 
  FORMAT(date, 'yyyy-MM') AS year_month,
  SUM(total_sales) AS monthly_sales
FROM [cleaned_walmart_data$]
GROUP BY FORMAT(date, 'yyyy-MM')
ORDER BY year_month;

-- Sales Contribution % by Category
--To prepare waterfall or contribution charts
WITH total_rev AS (
  SELECT SUM(total_sales) AS grand_total FROM [cleaned_walmart_data$]
)
SELECT 
  category,
  SUM(total_sales) AS revenue,
  ROUND(SUM(total_sales) * 100.0 / (SELECT grand_total FROM total_rev), 2) AS revenue_percent
FROM [cleaned_walmart_data$]
GROUP BY category
ORDER BY revenue_percent DESC;

-- Top 5 rows from the top 5% high-performing transactions (SQL Server)
WITH top_5_percent AS (
  SELECT *
  FROM [cleaned_walmart_data$]
  WHERE total_sales >= (
    SELECT PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY total_sales)
    OVER ()
  )
)
SELECT TOP 5 *
FROM top_5_percent
ORDER BY total_sales DESC;







