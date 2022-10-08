-- ***********************
-- Name: Saetbyeol Lim
-- ID: 149814212
-- Date: 2st Oct
-- Purpose: Lab 3 DBS311
-- ***********************
-- Question 1 
INSERT INTO
    employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) 
VALUES
    (207, 'Saetbyeol', 'Lim', 'slim62@myseneca.ca', '647.870.7061', to_date('29-SEP-2022', 'dd-MON-yyyy'), 'AC_ACCOUNT', NULL, 0.21, 100, 90);

-- Question 2
UPDATE
    employees 
SET
    salary = 2500 
WHERE
    last_name IN 
    ('Matos', 'Whalen');

-- Question 3
SET AUTOCOMMIT ON;

-- Question 4
SELECT
    last_name 
FROM
    employees 
WHERE
    department_id = (
        SELECT
            department_id 
        FROM
            employees 
        WHERE
            LOWER(last_name) = 'abel');

-- Question 5
SELECT
    last_name 
FROM
    employees 
WHERE
    salary = (
        SELECT
            MIN(salary) 
        FROM
            employees);

-- Question 6
SELECT DISTINCT
    city 
FROM
    locations l 
    JOIN
        departments d 
        ON d.location_id = l.location_id 
    JOIN
        employees e 
        ON e.department_id = d.department_id 
WHERE
    salary = (
        SELECT
            MIN(salary) 
        FROM
            employees);

-- Question 7
SELECT
    last_name,
    department_id,
    e.salary 
FROM
    employees e 
WHERE
    salary IN (
        SELECT
            MIN(salary) 
        FROM
            departments d 
        GROUP BY
            d.department_id)
ORDER BY
    department_id;

-- Question 8
SELECT DISTINCT
    last_name 
FROM
    employees e 
WHERE
    salary IN (
        SELECT
            MIN(salary) 
        FROM
            locations l 
            JOIN
                departments d 
                ON d.location_id = l.location_id 
            JOIN
                employees e 
                ON e.department_id = d.department_id 
        GROUP BY
            city );

-- Question 9
SELECT
    last_name,
    salary 
FROM
    employees e 
WHERE
    salary IN(
        SELECT
            MIN(salary) 
        FROM
            employees 
        GROUP BY
            department_id)
ORDER BY
    salary DESC,
    last_name;

-- Question 10
SELECT
    last_name,
    job_id AS jobtitle,
    salary 
FROM
    employees e 
WHERE
    salary IN (
        SELECT
            salary 
        FROM
            employees 
        WHERE
            job_id = 'IT_PROG')
ORDER BY
    salary ASC,
    last_name;
