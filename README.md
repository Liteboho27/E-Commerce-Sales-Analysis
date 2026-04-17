# E-commerce Sales Analysis 
## 📌 Project Overview

In this project, I analyzed an **e-commerce sales dataset** using **MySQL** to uncover actionable business insights.  
I performed data cleaning, exploratory data analysis (EDA), and answered real-world questions that managers and stakeholders typically ask.

**Goal**  
Demonstrate solid SQL skills (aggregations, window functions, CTEs, date handling, subqueries) while thinking like a data analyst, focusing on **business value** and clear recommendations.

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
**Interpretation**: Profitability is consistent but not growing, possible causes include rising input costs, increased discounting, or competitive pressure. Margin compression should be monitored.

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
  
<img width="956" height="359" alt="Data Types" src="https://github.com/user-attachments/assets/ea767367-1271-4215-8f43-1d72bc4c0b85" />


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

<img width="1366" height="316" alt="Monthly orders_running totals" src="https://github.com/user-attachments/assets/c2c14794-b203-4f14-937a-3f773c2352d8" />


<img width="743" height="425" alt="Monthly orders_Running totals table" src="https://github.com/user-attachments/assets/3b20386e-57a6-4e63-a242-06118eb33b45" />


<img width="1164" height="374" alt="Sales and profit by category" src="https://github.com/user-attachments/assets/474e9111-1c71-4cf3-a5c6-29a64332367d" />


<img width="1149" height="428" alt="Profit margin per year" src="https://github.com/user-attachments/assets/44fb9d19-8c63-4817-bd28-68760beab4db" />



### 4. Business Insights & Recommendations
Translated numbers into decisions:  
- Focus should be placed on high-impact categories/products to increase sales and profit
- Noted uniform regional performance as a strength  
- Flagged slight margin decline as a watch area

## 📁 Project Files

- `e-commerce sales project.sql` → All cleaning + analysis queries (well-commented)   
- `README.md` → This file

