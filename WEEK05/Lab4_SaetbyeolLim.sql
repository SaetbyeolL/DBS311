-- ***********************
-- Name: Saetbyeol Lim
-- ID: 149814212
-- Date: 7 OCT 2022
-- Purpose: Lab 4 SET OPERATOR - DBS311
-- ***********************
-- Q1.
SELECT
    department_id 
FROM
    departments 
MINUS 
SELECT
    department_id 
FROM
    employees 
WHERE
    job_id = 'ST_CLERK';
        
-- Q2.
SELECT
    country_id,
    country_name 
FROM
    countries 
MINUS 
SELECT
    l.country_id,
    c.country_name 
FROM
    locations l 
    JOIN countries c ON l.country_id = c.country_id 
    JOIN departments d ON l.location_id = d.location_id;

-- Q3.
SELECT DISTINCT
    job_id,
    department_id 
FROM
    employees 
WHERE
    department_id = 10 
UNION ALL
SELECT DISTINCT
    job_id,
    department_id 
FROM
    employees 
WHERE
    department_id = 50 
UNION ALL
SELECT DISTINCT
    job_id,
    department_id 
FROM
    employees 
WHERE
    department_id = 20;
    
-- Q4.
SELECT
    employee_id,
    job_id 
FROM
    employees 
INTERSECT
SELECT
    employee_id,
    job_id 
FROM
    job_history 
WHERE
    job_id IS NOT NULL;
 
-- Q5.
SELECT
    last_name,
    department_id 
FROM
    employees 
UNION
SELECT
    department_name,
    department_id 
FROM
    departments;