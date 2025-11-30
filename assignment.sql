CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    JoinDate DATE
);
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    EmpID INT,
    ProjectName VARCHAR(100),
    StartTime DATETIME,
    EndTime DATETIME
);
INSERT INTO Employees VALUES
(1, 'Amit', 'IT', 50000, '2021-06-10'),
(2, 'Priya', 'HR', 45000, '2020-05-12'),
(3, 'Karan', 'IT', 70000, '2022-01-20'),
(4, 'Sneha', 'Finance', 65000, '2021-03-18');

INSERT INTO Projects VALUES
(101, 1, 'Website Upgrade', '2023-09-10 09:00:00', '2023-09-10 17:00:00'),
(102, 1, 'API Development', '2023-09-11 10:00:00', '2023-09-11 18:00:00'),
(103, 2, 'HRMS System', '2023-09-10 09:30:00', '2023-09-10 16:00:00'),
(104, 3, 'Cloud Migration', '2023-09-12 08:00:00', '2023-09-12 17:30:00'),
(105, 3, 'Security Audit', '2023-09-13 09:00:00', '2023-09-13 14:00:00');


set time_zone='+05:30';

SELECT
    CURRENT_DATE() AS today_date,
    NOW() AS current_datetime,
    DATE(NOW()) AS only_date,
    TIME(NOW()) AS only_time,
    YEAR(NOW()) AS year_value,
    MONTH(NOW()) AS month_value,
    DAY(NOW()) AS day_value,
    DATE_ADD(CURRENT_DATE(), INTERVAL 10 DAY) AS date_plus_10_days,
    DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH) AS date_minus_1_month,
    DATEDIFF('2026-01-01', CURRENT_DATE()) AS days_left_till_2026
;

SELECT 
    EmpID,
    ProjectName,
    ROW_NUMBER() OVER(PARTITION BY EmpID ORDER BY StartTime) AS RowNum
FROM Projects;

SELECT 
    EmpName,
    Salary,
    RANK() OVER(ORDER BY Salary DESC) AS SalaryRank
FROM Employees;


SELECT 
    EmpName,
    Salary,
    DENSE_RANK() OVER(ORDER BY Salary DESC) AS DenseSalaryRank
FROM Employees;


SELECT 
    Department,
    EmpName,
    Salary,
    RANK() OVER(PARTITION BY Department ORDER BY Salary DESC) AS DeptSalaryRank
FROM Employees;

SELECT 
    EmpID,
    ProjectName,
    FIRST_VALUE(ProjectName) OVER(
        PARTITION BY EmpID ORDER BY StartTime
    ) AS FirstProject
FROM Projects;

SELECT
    EmpName,
    Salary,
    PERCENT_RANK() OVER(ORDER BY Salary) AS SalaryPercentRank
FROM Employees;
