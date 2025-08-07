Here's a **README file** for the SQL script you provided. This file includes details about what the script does and how it structures the database. You can save this as a `README.md` file for documentation purposes.

---

# 📘 EMPDETAILS Database - README

## 📌 Overview

This project creates and manages an employee database called `EMPDETAILS`. It includes two primary tables:

* `EMPINFO`: Stores employee personal and professional details.
* `EMPSALARY`: Stores salary and tax-related information linked to the employees.

The SQL script performs operations such as inserting data, updating records, handling default values, establishing foreign key relationships, and calculating tax.

---

## 🗃️ Database and Table Structure

### 🔸 1. Create Database

```sql
CREATE DATABASE EMPDETAILS;
```

### 🔸 2. Create `EMPINFO` Table

```sql
CREATE TABLE EMPINFO(
  EMPID INT IDENTITY(100,1) PRIMARY KEY,
  EMPNAME VARCHAR(200),
  DESIGNATION VARCHAR(200)
);
```

* `EMPID`: Auto-incrementing primary key starting from 100.
* `EMPNAME`: Name of the employee.
* `DESIGNATION`: Job title/role of the employee.

---

## ➕ Data Insertion

### Insert Initial Employees

```sql
INSERT INTO EMPINFO(EMPNAME, DESIGNATION) VALUES (...);
```

9 employees with varying roles are added.

---

## 🔄 Table Alteration

### Add `DOJ` (Date of Joining) Column

```sql
ALTER TABLE EMPINFO ADD DOJ DATE DEFAULT '2022-07-12';
```

* Initially, `DOJ` is added as `NULL`.
* Later dropped and re-added with a default value (`2022-07-12`).

---

## 🔧 Data Updates

### Updating `DOJ` Based on Role

```sql
UPDATE EMPINFO SET DOJ='...' WHERE DESIGNATION='...';
```

Custom `DOJ` values are set for each designation.

---

## ❌ Deletion and Reinsertion

### Delete and Reinsert `ADMIN`

```sql
DELETE EMPINFO WHERE DESIGNATION='ADMIN';

INSERT INTO EMPINFO (EMPNAME, DESIGNATION, DOJ) VALUES ('SURESH', 'ADMIN', '2022-02-01');
```

---

## 💵 Create and Populate `EMPSALARY`

### Create Table

```sql
CREATE TABLE EMPSALARY(
  EMPID INT,
  SALARY INT
);
```

### Add Foreign Key

```sql
ALTER TABLE EMPSALARY
ADD CONSTRAINT FK_ID FOREIGN KEY(EMPID) REFERENCES EMPINFO(EMPID);
```

* Ensures `EMPID` in `EMPSALARY` references `EMPINFO`.

### Insert Salaries

```sql
INSERT INTO EMPSALARY VALUES (...);
```

Each employee is assigned a salary.

---

## ➗ Tax Calculation

### Add `TAX` Column

```sql
ALTER TABLE EMPSALARY ADD TAX FLOAT;
```

### Tax Calculation (Query Only)

```sql
SELECT EMPID, SALARY, SALARY * 0.18 AS TAX FROM EMPSALARY;
```

* Calculates 18% tax for each employee's salary.



