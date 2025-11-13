create database Employee;
use employee;

create table dept(
deptno int primary key,
dname varchar(20),
dloc varchar(30));

create table employee(
empno int primary key,
ename varchar(30),
mgrno int,
hiredate date,
sal int,
deptno int,
foreign key(deptno) references dept(deptno));

create table incentives(
empno int primary key,
incDate date,
incAmt int,
foreign key(empno) references employee(empno));

create table project(
pno int primary key,
pname varchar(30),
ploc varchar(30));

create table assigned_to(
empno int,
pno int,
jobrole varchar(30),
foreign key(empno) references employee(empno),
foreign key(pno) references project(pno));

-- DEPARTMENT
INSERT INTO DEPT VALUES 
(10, 'HR', 'New York'),
(20, 'IT', 'San Francisco'),
(30, 'Finance', 'Chicago'),
(40, 'Marketing', 'Boston'),
(50, 'Research', 'Seattle');

-- EMPLOYEE
INSERT INTO EMPLOYEE VALUES
(1001, 'Alice Johnson', 1005, '2020-03-15', 65000, 10),
(1002, 'Bob Smith', 1005, '2019-08-22', 70000, 20),
(1003, 'Carol Davis', 1006, '2021-02-10', 55000, 10),
(1004, 'David Wilson', 1002, '2022-06-12', 60000, 30),
(1005, 'Emily Clark', NULL, '2018-01-05', 90000, 10),
(1006, 'Frank Lewis', NULL, '2017-11-20', 95000, 20),
(1007, 'Grace Hall', 1002, '2023-04-25', 58000, 40);

-- PROJECT
INSERT INTO PROJECT VALUES
(501, 'Payroll System', 'Chicago'),
(502, 'HR Portal', 'New York'),
(503, 'Inventory App', 'San Francisco'),
(504, 'Marketing Dashboard', 'Boston'),
(505, 'AI Research', 'Seattle');

-- INCENTIVES
INSERT INTO INCENTIVES VALUES
(1001, '2024-12-01', 2000),
(1002, '2025-01-15', 1500),
(1003, '2024-11-20', 1000),
(1004, '2025-05-25', 1200),
(1005, '2024-10-10', 2500),
(1006, '2025-02-05', 3000);

-- ASSIGNED-TO
INSERT INTO ASSIGNED_TO VALUES
(1001, 501, 'Analyst'),
(1002, 503, 'Developer'),
(1003, 502, 'Tester'),
(1004, 501, 'Accountant'),
(1005, 502, 'Project Manager'),
(1006, 503, 'Team Lead'),
(1007, 504, 'Marketing Associate'),
(1001, 505, 'Research Assistant');

select distinct(empno) from assigned_to a, project p where p.pno=a.pno and p.ploc in ('New York','Chicago','Boston');

select empno from employee where empno not in (select distinct(empno) from incentives);