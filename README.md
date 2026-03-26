# E-commerce Sales Analysis – SQL Portfolio Project

## 📌 Project Overview

In this project, I analyzed an **e-commerce sales dataset** using **pure MySQL** to uncover actionable business insights.  
I performed data cleaning, exploratory data analysis (EDA), and answered real-world questions that managers and stakeholders typically ask.

**Goal**  
Demonstrate solid SQL skills (aggregations, window functions, CTEs, date handling, subqueries) while thinking like a **data analyst**, focusing on **business value** and clear recommendations rather than just technical queries.

**Dataset**  
Public Kaggle dataset: https://www.kaggle.com/datasets/sidramazam/e-commerce-sales-performance-analysis
Columns: `order_date`, `product_name`, `category`, `region`, `quantity`, `sales`, `profit`  
Time span: 3 years (2022–2024)

**Key Questions Answered**
- What are the overall KPIs (revenue, profit, margin)?
- How have sales/orders trended over time?
- Which categories/products drive the most revenue & profit?
- How do regions compare in performance?
- Which products/categories are underperforming?

## 🛠️ Tools & Technologies

- **Database**: MySQL  
- **SQL Features Demonstrated**: GROUP BY, CTEs, window functions (running totals), DATE_FORMAT, subqueries, aggregations, data type changes  

## 📊 Key Insights & Business Recommendations

### Overall Performance (2022–2024)
- **Total revenue**: $10,667,881  
- **Total profit**: $1,844,665  
- **Average profit margin**: ~17.3%  
- Profit Margin trend: stable at ~18% in 2022–2023, slight decline to ~17% in 2024  
**Interpretation**: Profitability is consistent but not growing — possible causes include rising input costs, increased discounting, or competitive pressure. Margin compression should be monitored.

### Product Category Performance
- **Electronics** is the clear leader:  
  • Revenue: **$5,326,074** (~50% of total)  
  • Profit: **$923,186** (~50% of total profit)  
 **Strong recommendation**: Allocate more marketing budget and inventory focus to Electronics - this category drives the majority of profitability.

### Regional Performance
- Sales volume, revenue, and profit are distributed **very evenly** across regions (variation < 12–15%).  
- This indicates **strong national consistency** in pricing, delivery, marketing, and operations — a sign of a well-executed, scalable e-commerce model.  
**Opportunity**: Small existing differences in profit margin and average order quantity could be amplified through targeted regional experiments (e.g., promotions in higher-margin areas, faster shipping pilots).

### Product Highlights
- Top 5 sellers are Monitors, Smartwatches, Cameras, Mouses and Printers respectively
- **Monitors** lead in units sold (highest volume)  
- **Cameras** show the strongest profit margin among top sellers  
- **Smartwatches** have the lowest average unit price, likely entry-level positioning or heavy promotional discounting  
**Recommendation**: Protect and promote the **Monitor + Camera** combination (high volume + high margin).  
Review Smartwatch pricing, bundling, or discounting strategy to improve contribution margin.

## 🔍 Project Walkthrough: Step-by-Step Process

I followed a structured, analyst-first approach from raw data to business recommendations.

### 1. Understanding the Data
**Goal**: Build confidence in the dataset before analysis.  
- Created a working copy of the table to preserve original data  
- Ran `DESCRIBE sales;` to check structure & data types  
- Inspected date range, unique values (categories, regions), and basic counts/statistics
- Corrected data types to standardise the data  

(https://github.com/Liteboho27/PROJECTS/blob/5a590baed0cfbc9ea292dce6bb82f917fb1c94f9/Table%20Schema.png)

### 2. Data Cleaning
**Goal**: Ensure trustworthy numbers.  
- Removed duplicate rows  
- Standardized text formatting
- Handled NULLs and blanks in key columns  
- Changed `sales` and `profit` to `DECIMAL(12,2)` to avoid rounding errors with monetary values  
- Confirmed `order_date` was properly stored as `DATE`  

### 3. Exploratory Data Analysis (EDA)
**Goal**: Discover patterns and answer stakeholder questions.  
- Calculated overall KPIs and yearly/monthly trends  
- Used window functions for running totals of orders & revenue  
- Ranked categories, products, and regions by revenue, profit, and margin   

![Monthly Trend Example](screenshots/02_monthly_trend.png)  
![Top Products by Revenue](screenshots/03_top_products.png)

### 4. Business Insights & Recommendations
Translated numbers into decisions:  
- Focus should be placed on high-impact categories/products to increase sales and profit
- Noted uniform regional performance as a strength  
- Flagged slight margin decline as a watch area

## 📁 Project Files

- `sales_analysis.sql` → All cleaning + analysis queries (well-commented)  
- `screenshots/` → Key query outputs & visuals  
- `README.md` → This file

## 🔍 How to Run / Explore This Project

1. Clone the repository:
   ```bash
   git clone https://github.com/Liteboho27/ecommerce-sales-analysis.git
