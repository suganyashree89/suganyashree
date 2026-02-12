create table emp_subuery(
empno int primary key ,
empname varchar(50),
empdesig varchar(50),
dateofjoining date,
salary int);

insert into emp_subuery values(101,'anu','receptionist', '2022-03-23', 20000),
(102,'arthi','acc', '2020-03-10', 25000),
(103,'banu','HR', '2018-03-23', 35000),
(104,'geetha','manager', '2022-05-22', 120000),
(105,'chira','jr.associate', '2025-03-24',25000 ),
(106,'rekha','jr.asociate', '2025-03-20', 20000),
(107,'divya','drafter', '2024-05-23', 30000),
(108,'arul','sr.drafter', '2022-07-10',50000),
(109,'teju','asst', '2020-03-25', 90000),
(110,'anbu','analyst', '2024-05-07', 40000),
(111,'dinesh','sr.analyst', '2023-06-12', 70000);

--average salary 

SELECT empno,empname, salary
FROM emp_subuery
WHERE salary > (
    SELECT AVG(salary)
    FROM emp_subuery
);

-- table attenance

create table emp_attenance(
empno int primary key ,
empname varchar(50),
compulsary_working_hr int,
work_hr_as_per_week int);

insert into emp_attenance values (101,'anu',45,45),
(102,'arthi',45,43),
(103,'banu',45,45),
(104,'geetha',45,40),
(105,'chira',45,43 ),
(106,'rekha',45,45),
(107,'divya',45,30),
(108,'arul',45,37),
(109,'teju',45,39),
(110,'anbu',45,40),
(111,'dinesh',45,41);

--using joins
select e.empno,e.empname,e.empdesig ,a.compulsary_working_hr,a.work_hr_as_per_week from emp_subuery as e
left join emp_attenance as a
on e.empno=a.empno;

--Correlated subquery implementation

SELECT e.empno, e.empname, e.empdesig, e.salary
FROM emp_subuery e
WHERE salary > (
    SELECT AVG(salary)
    FROM emp_subuery
    WHERE empno = e.empno
);

--compare subqquery with join

SELECT e.empno, e.empname, e.empdesig, a.work_hr_as_per_week
FROM emp_subuery e
JOIN (
    SELECT empno, SUM(work_hr_as_per_week) AS work_hr_as_per_week
    FROM emp_attenance
    GROUP BY empno
) a
ON e.empno = a.empno;

--nested query

SELECT empno, empname, empdesig, salary
FROM emp_subuery
WHERE salary > (
    SELECT AVG(salary)
    FROM emp_subuery
    WHERE empdesig IN (
        SELECT empdesig
        FROM emp_subuery
        WHERE empdesig = 'jr.associate')
);















