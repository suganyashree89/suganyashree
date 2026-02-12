

TABLE 1: emp_subuery

Purpose: Stores employee master details such as designation, joining date, and salary.

Columns:

empno : Employee number (Primary Key)

empname : Employee name

empdesig : Employee designation

dateofjoining : Date of joining

salary : Employee salary

TABLE 2: emp_attenance

Purpose: Stores weekly attendance and working-hour details of employees.

Columns:

empno : Employee number (Primary Key)

empname : Employee name

compulsary_working_hr : Required working hours per week

work_hr_as_per_week : Actual working hours per week

QUERY 1: Employees Earning More Than Average Salary

Description: Finds employees whose salary is greater than the overall average salary.

Logic:

Inner query calculates the average salary of all employees.

Outer query returns employees earning more than that average.

QUERY 2: Join Employee and Attendance Tables

Description: Fetches employee details along with their attendance information.

Logic:

Uses LEFT JOIN to combine emp_subuery and emp_attenance tables.

Ensures all employees are displayed even if attendance data is missing.

QUERY 3: Correlated Subquery Example

Description: Demonstrates a correlated subquery where the inner query depends on the outer query.

Note: In this example, comparing salary with its own average does not produce meaningful results. Correlated subqueries are usually used with department or designation-based grouping.

QUERY 4: Subquery Compared with JOIN

Description: Shows how a subquery can be used with JOIN to aggregate attendance data.

Logic:

Subquery calculates total working hours per employee.

JOIN combines the aggregated result with employee details.

Best Practice: JOINs are preferred over subqueries for better performance and readability.

QUERY 5: Nested Subquery (Multiple Levels)

Description: Finds employees whose salary is greater than the average salary of junior associates.

ogic:

Innermost query selects designation 'jr.associate'.

Middle query calculates average salary for that designation.

Outer query fetches employees earning more than that average.