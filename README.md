# walmart-sales-analysis
This project provides an end-to-end business analysis of Walmart sales using Excel, SQL, Power BI, and business reporting techniques. It includes KPIs, trend analysis, customer segmentation, and actionable insights for stakeholders.

## 📁 Project Structure
- `data/` → Cleaned dataset used for analysis.
 
- `eda/` → SQL queries and EDA summary.
  
- `visuals/` → Power BI dashboard and charts.
  
- `report/` → Full project report and optional presentation.

## 🧹Data Cleaning & Transformation
1.Removed duplicate rows and null entries.

2.Standardized data formats (e.g., dates, currency).

3.Derived new columns like total_sales using unit_price × quantity.

4.Ensured consistent naming conventions for fields like gender, city, category, etc.

## 🔍 Key Analyses Performed

 ### 🔍 Key Analyses Performed

| 🔎 Area of Focus           | 📝 Description                                                                 
|---------------------------|-------------------------------------------------------------------------------|
| Total & Average Sales     | Identified overall total revenue and calculated average sales per transaction |
| Sales by Category         | Ranked product categories by total revenue contribution                       |
| Branch-wise Revenue       | Compared sales across branches to identify the highest-performing locations   |
| Payment Method Analysis   | Evaluated which payment methods were most frequently used by customers        |
| Monthly Revenue Trends    | Analyzed revenue over months to spot seasonal trends and support forecasting  |
| Revenue Contribution %    | Used donut Chart to show each category's % contribution to total revenue  |

## 📊 Power BI Dashboard
    The dashboard includes:
1.KPIs: Total Revenue, Average Sales, Transaction Volume

2.Category Sales Bar Chart

3.Payment Method Pie Chart

4.Monthly Revenue Line Graph

5.Revenue by Branch & City Tables

## 🧠 Insights Summary
1.Fashion Accessories generated the highest revenue across all categories.

2.Branch B was the top-performing branch by revenue.

3.Credit Card payments were the most preferred method, indicating urban-savvy shoppers.

4.Revenue peaked in early months showing seasonal trends, potentially linked to holidays.

## ✅ Recommendations
1.Prioritize stocking Fashion Accessories in high-performing branches.

2.Optimize branch operations in low-revenue areas.

3.Offer payment discounts or loyalty rewards to encourage use of preferred payment methods.

## 📌 Tools & Tech Stack
1.Python(Numpy,Pandas): Data cleaning and transformation

2.SQL: Data extraction and EDA (SQLite syntax used)

3.Power BI: Dashboard development and visualization

4.Gogle Doc: Report and documentation on project.

5.GitHub: Version control and project documentation.







