# 📊 SQL Project 1 - Employee & Project Data Analysis

## 📁 Project Overview
This project demonstrates a full-cycle SQL analysis using PostgreSQL. It covers table creation, data import, data cleaning, exploration, performance insights, and advanced queries on employee and project datasets.

## 📂 Datasets Used

### 🧑 Employees.csv
- `EmployeeID` (INT) – Primary Key  
- `Name` (VARCHAR)  
- `Department` (VARCHAR)  
- `Salary` (NUMERIC)  
- `JoinDate` (DATE)  
- `PerformanceRating` (INT) – Added later  

### 📁 Projects.csv
- `ProjectID` (INT) – Primary Key  
- `ProjectName` (VARCHAR)  
- `Department` (VARCHAR)  
- `Budget` (NUMERIC)  

## ⚙️ Operations Performed

### 🏗️ Table Creation
- Created `Employees` and `Projects` tables
- Imported data from CSV using `COPY`

### 🧹 Data Cleaning
- Checked for `NULL` values in key fields
- Deleted rows with missing `JoinDate` or `PerformanceRating`

### 🔍 Data Exploration
- Counted total and unique employees
- Listed distinct departments and project names

### 📈 Business-Oriented SQL Analysis

#### 🔧 Department-Based Queries
- Retrieved all employees in the IT department  
- Found departments with no assigned projects  
- Identified employees who joined after `2020-01-01`

#### 💰 Salary Insights
- Listed employees earning above average  
- Created a `HighEarners` view for employees with salaries > 60,000

#### 💸 Project Budget
- Calculated total budget per department

#### 🔄 Joins & Relationships
- Performed INNER JOIN to link employees with departments  
- Used LEFT JOIN to identify projects without matching departments  
- Merged employees with their department-related projects

### 🧠 Advanced SQL Techniques

#### ⏱️ Time-Based Analysis
- Extracted year and month from `JoinDate`  
- Found employees who joined within the last 2 years

#### 📊 Window Functions
- Calculated running total of sales  
- Ranked customers by total spending using `RANK()`

#### 📦 Product Analysis (Sales Data)
- Computed total revenue per product  
- Filtered products with revenue > 1000 using `HAVING`  
- Listed categories with more than one product

## ✅ Key Insights
- IT and HR departments received performance ratings of 5 and 4  
- Some employee departments lacked corresponding projects  
- High earners (salary > 60K) were identified  
- Sales and customer rankings support business strategy

## 🛠️ Technologies Used
- PostgreSQL  
- SQL (DDL, DML, Joins, Subqueries, Views, Window Functions)  
- CSV files for data import

---
