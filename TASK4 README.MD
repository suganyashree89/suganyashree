Employee Information System SQL Script
📄 Overview
This SQL script creates a simple Employee Information System using two tables:

EMPDETASILS – Stores employee personal and job-related details.

EMPINCOME – Stores salary information for employees.

It also demonstrates the use of:

Aggregate functions

GROUP BY and HAVING clauses

Fetching the second highest salary using OFFSET / FETCH

📂 Script Breakdown
🔁 Step 1: Drop Table If Exists

DROP TABLE IF EXISTS EMPDETAILS;
Ensures a clean setup by dropping the EMPDETAILS table if it already exists.

⚠️ Note: The correct table name later is EMPDETASILS (likely a typo).

🛠️ Step 2: Create Database

CREATE DATABASE EMPINFOMATION;
Creates a new database called EMPINFOMATION.

📊 Step 3: Create EMPDETASILS Table

CREATE TABLE EMPDETASILS (
  EMPID INT IDENTITY(100,1) PRIMARY KEY,
  EMPNAME VARCHAR(200),
  DESIGNATION VARCHAR(200)
);
EMPID is an auto-incrementing primary key starting from 100.

Stores employee names and job designations.

➕ Step 4: Insert Employee Records

INSERT INTO EMPDETASILS (EMPNAME, DESIGNATION) VALUES (...);
Adds 9 employees with various designations like ADMIN, INTERN, TEAM LEAD, etc.

📊 Step 5: Create EMPINCOME Table

CREATE TABLE EMPINCOME (
  EMPID INT,
  SALARY INT,
  CONSTRAINT FK_EMPIDS FOREIGN KEY (EMPID) REFERENCES EMPDETASILS(EMPID)
);
Contains employee salaries.

EMPID is a foreign key referencing EMPDETASILS.

💵 Step 6: Insert Salary Records

INSERT INTO EMPINCOME VALUES (...);
Inserts salary records for employees with EMPID from 101 to 108.

Example: EMPID 101 → 200000, EMPID 105 → 3,500,000

📋 Step 7: View All Salaries

SELECT * FROM EMPINCOME;
Displays all salary entries from the EMPINCOME table.

📈 Analysis Queries
📌 Aggregate Functions

SELECT COUNT(*) AS NO_OF_EMP FROM EMPDETASILS;
SELECT SUM(SALARY) AS TOTALCTC FROM EMPINCOME;
SELECT MAX(SALARY) AS MAXSALARY FROM EMPINCOME;
SELECT MIN(SALARY) AS MINSALARY FROM EMPINCOME;
COUNT: Total number of employees.

SUM: Total company salary expenditure.

MAX: Highest salary.

MIN: Lowest salary.

📊 Group By + Having

SELECT DESIGNATION, COUNT(*) AS COUNT
FROM EMPDETASILS
GROUP BY DESIGNATION
HAVING COUNT(*) > 1;
Groups employees by designation and counts them.

🥈 Find Second Highest Salary

SELECT SALARY 
FROM EMPINCOME 
ORDER BY SALARY DESC 
OFFSET 1 ROWS 
FETCH NEXT 1 ROWS ONLY;
Orders salaries in descending order.

Skips the top salary (OFFSET 1), fetches the next one – this gives the second highest salary.