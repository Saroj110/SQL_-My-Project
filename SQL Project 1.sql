-- SQL Analysis

-- Create TABLE

create database sql_project_1;


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    Salary NUMERIC(10, 2),
    JoinDate DATE
);

copy Employees(EmployeeID, Name, Department, Salary, joinDate)
from 'E:/Employees.csv'
Delimiter','
csv header;

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    Department VARCHAR(50),
    Budget NUMERIC(12, 2)
);

copy Projects(ProjectID, ProjectName, Department, Budget)
from 'E:/Projects.csv'
Delimiter','
csv header;

SELECT * FROM employees
LIMIT 10

-- Data Cleaning

SELECT * FROM employees
WHERE performancerating IS NULL

SELECT * FROM employees
WHERE department IS NULL

SELECT * FROM projects
WHERE department IS NULL

----
DELETE FROM employees
WHERE 
    performancerating IS NULL
    OR
    joindate IS NULL

-- Data Exploration

-- How many department we have?

SELECT COUNT(*) as total FROM employees

-- How many uniuque customers we have ?

SELECT COUNT(DISTINCT employeeid) as total FROM employees

SELECT DISTINCT projectname FROM projects

-- Data Analysis & Business Key Problems & Answers

-- Retrieve All Employees in the IT Department
-- Write a query to list all employees who work in the IT department.

   SELECT *
   FROM Employees
   WHERE Department = 'IT';

-- Find Employees Who Joined After 2020
--Retrieve the names of employees who joined after January 1, 2020.

   SELECT Name
   FROM Employees
   WHERE JoinDate > '2020-01-01';   

-- Calculate Total Budget by Department
-- Write a query to calculate the total project budget for each department.

  SELECT Department, SUM(Budget) AS TotalBudget
  FROM Projects
  GROUP BY Department;

-- List Employees with a Salary Above the Average
-- Retrieve the details of employees whose salaries are above the average salary of all employees.

 SELECT *
 FROM Employees
 WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- Find Departments Without Projects
--Write a query to find departments in the Employees table that have no associated projects in the Projects table.

 SELECT DISTINCT Department
 FROM Employees
 WHERE Department NOT IN (SELECT DISTINCT Department FROM Projects);

-- Add a Column for Performance Rating
--Modify the Employees table to add a column PerformanceRating (default value as NULL), and update it as follows:
-- HR employees: Rating = 4
-- IT employees: Rating = 5

 ALTER TABLE Employees ADD PerformanceRating INT;
 
 UPDATE Employees
 SET Performancerating = 4
 WHERE Department = 'HR';
 UPDATE Employees
 SET Performancerating = 5
 WHERE Department = 'IT';

-- Display Employees and Their Project Details
-- Join the Employees and Projects tables to display each employee’s name, department, and the project(s) associated with their department.

 SELECT e.Name, e.Department, p.ProjectName, p.Budget
 FROM Employees e
 LEFT JOIN Projects p ON e.Department = p.Department;
 
-- Create a View for High Earners Create a view HighEarners that contains the
-- details of employees earning more than 60,000.

CREATE VIEW HighEarners AS
SELECT *
FROM Employees
WHERE Salary > 60000;

-- Data Retrieval Techniques - GROUP BY and HAVING
-- Calculate the total sales revenue for each product using GROUP BY.
--Filter products with revenue greater than $1,000 using HAVING.

-- Total sales revenue for each product
 
 SELECT Product, SUM(Quantity * Price) AS TotalRevenue
 FROM Sales
 GROUP BY Product;

-- Products with revenue greater than $1,000

 SELECT 
    Product, 
    SUM(Quantity * Price) AS TotalRevenue
FROM sales
GROUP BY Product
HAVING SUM(Quantity * Price) > 1000;

-- Find employees who joined within the last two years.
-- Extract the year and month from JoinDate.

-- Employees who joined in the last two years

SELECT *
FROM Employees
WHERE JoinDate >= CURRENT_DATE - INTERVAL '2 years';

-- Extract year and month from JoinDate

SELECT 
    EmployeeID, 
    Name, 
    EXTRACT(YEAR FROM JoinDate) AS JoinYear, 
    EXTRACT(MONTH FROM JoinDate) AS JoinMonth
FROM Employees;

-- Perform an INNER JOIN to get customers with orders.
-- Use a LEFT JOIN to find customers without orders.

-- INNER JOIN

 SELECT e.ID, c.Name, o.Amount
 FROM Orders o
 INNER JOIN Customers c ON o.CustomerID = c.CustomerID;

--LEFT JOIN

 SELECT c.CustomerID, c.Name, o.OrderID
 FROM Customers c
 LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
 WHERE o.OrderID IS NULL;

-- Find empoyees salary above the average salary.
-- Retrieve categories with more than one product using a subquery.

-- Products priced above the average price

SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Categories with more than one product

SELECT Category
FROM Products
 GROUP BY Category HAVING COUNT(*) > 1;

-- Calculate the running total of sales.
-- Rank customers by their total spending.

-- Running total of sales
 SELECT SaleID, CustomerID, Price,
 SUM(Price) OVER (ORDER BY SaleDate) AS RunningTotal
 FROM Sales;

--Rank customers by total spending

 SELECT CustomerID, SUM(Price) AS TotalSpent,
 RANK() OVER (ORDER BY SUM(Price) DESC) AS Rank
 FROM Sales
 GROUP BY CustomerID;



