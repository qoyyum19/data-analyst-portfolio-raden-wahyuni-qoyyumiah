-- HR Analysis
-- Data Analyst with basic SQL by Raden Wahyuni Qoyyumiah


-- Checking & Identification Data
SELECT *
FROM dbo.departments;

SELECT *
FROM dbo.departments
WHERE location = 'Surabaya';

SELECT DISTINCT dept_name
FROM dbo.departments;

SELECT dept_name
FROM dbo.departments;

SELECT *
FROM dbo.departments
WHERE division = 'Business'
ORDER BY annual_budget_idr DESC;

SELECT *
FROM dbo.departments
WHERE annual_budget_idr > 2000000000;

SELECT *
FROM dbo.attendance;

SELECT *
FROM dbo.attendance
WHERE status = 'wfh';

SELECT *
FROM dbo.attendance
WHERE check_out IS NULL;

SELECT *
FROM dbo.attendance
WHERE check_in IS NULL;

SELECT *
FROM dbo.employees;

SELECT *
FROM dbo.employees
WHERE dept_id IS NULL;

SELECT *
FROM dbo.employees
WHERE manager_id IS NULL;

SELECT DISTINCT city
FROM dbo.employees;

SELECT marital_status
FROM dbo.employees; 

SELECT *
FROM dbo.employees
WHERE birth_date > '1975-01-01'
AND gender = 'Male';

SELECT *
FROM dbo.performance;

SELECT *
FROM dbo.performance
WHERE kpi_score > 35;

SELECT *
FROM dbo.performance
WHERE attitude_score > 35 AND kpi_score > 35;

SELECT *
FROM dbo.salary_history;

SELECT DISTINCT change_reason
FROM dbo.salary_history;

SELECT change_reason
FROM dbo.salary_history;

SELECT change_reason, COUNT(change_reason) AS total_change_reason
FROM dbo.salary_history
GROUP BY change_reason;

SELECT *
FROM dbo.salary_history
WHERE change_reason IS NULL;

--Analysis
-- 1. Total & Composition Employee
SELECT 
COUNT (*) AS total_employee
FROM dbo.employees;

SELECT DISTINCT full_name
FROM dbo.employees;

SELECT full_name
FROM dbo.employees
ORDER BY full_name ASC;

SELECT *
FROM dbo.employees
WHERE full_name = 'Adi Usman';

SELECT *
FROM dbo.employees
WHERE full_name = 'Anggi Effendi';

SELECT *
FROM dbo.employees;

SELECT gender, COUNT(gender) AS total_gender
FROM dbo.employees
GROUP BY gender;

-- Total employee: 500
-- Dominate of male 300 & female 200

-- 2. Distribution of Employees by Department (15 dept)
SELECT *
FROM dbo.departments;

SELECT *
FROM dbo.employees;

SELECT DISTINCT dept_name
FROM dbo.departments;

-- total employee 500 
SELECT 
    COUNT(*) AS total_employees
FROM dbo.employees;

SELECT 
    dept_id,
    COUNT(emp_id) AS total_employees
FROM dbo.employees 
GROUP BY dept_id
ORDER BY total_employees DESC;

-- 3. Absences & Attendance Rate
SELECT *
FROM dbo.attendance;

SELECT DISTINCT emp_id, status
FROM dbo.attendance;

-- 66%
SELECT
    status,
    COUNT(*) AS total_records
FROM dbo.attendance
GROUP BY status
ORDER BY total_records DESC;

-- 4. Performance Employee
SELECT *
FROM dbo.performance;

-- Maximal Performance 50
SELECT
    AVG(overall_score) AS average_performance,
    MIN(overall_score) AS minimum_performance,
    MAX(overall_score) AS maximum_performance
FROM dbo.performance;

-- 5. Gender Distribution (60% male, 40% female)
SELECT 
    gender,
    COUNT(*) AS total_employees,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM dbo.employees
GROUP BY gender
ORDER BY total_employees DESC;

