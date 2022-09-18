-- ***********************
-- Name: Saetbyeol Lim
-- ID: 149814212
-- Date: 14 SEP 2022
-- Purpose: Lab 1 DBS311
-- ***********************

-- Q1
SELECT
    last_name AS LName,
    job_id AS jobTitle,
    hire_date AS jobStart 
FROM
    employees;

-- Q2
SELECT
    employee_id,
    last_name,
    '$' || to_char(round(salary, 2), 99999.99) -- In this question, 'round' is no needed
FROM
    employees 
WHERE
    salary BETWEEN 8000 AND 11000 
ORDER BY
    salary DESC,
    last_name;

-- Q3
SELECT
    employee_id,
    last_name,
    '$' || to_char(round(salary, 2), 99999.99) AS salary -- number ->number, char-> char, alias is optional
FROM
    employees 
WHERE
    salary BETWEEN 8000 AND 11000 
ORDER BY
    salary DESC, -- mark desc or asc which one you want to sort
    last_name;
-- alias: software friendly

-- Q4
SELECT
    job_id AS "Job Title",
    first_name || ' ' || last_name AS "Full name" 
FROM
    employees 
WHERE
    UPPER(first_name) LIKE '%E%'; -- whether I use upper or lower, that's okay
--SQL keywords are by default set to case insensitive.
    
-- Q5
SELECT *
FROM locations
WHERE city LIKE '&letter%'; -- trim(), don't include % inside of trim()

-- Q6
SELECT to_char(CURRENT_DATE + 1, 'month" "dd" of year "yyyy') AS Tomorrow --ddth:   fm:use this one sysdate: server date. use this one
FROM dual;

-- Q7
SELECT
    e.last_name,
    e.first_name,
    e.department_id,
    d.department_name,
    e.salary,
    round((e.salary*1.04), 0) AS "good salary",
    ((e.salary*1.04) - e.salary)*12 AS "annual pay increase" 
FROM
    employees e 
    INNER JOIN
        departments d 
        ON e.department_id = d.department_id 
WHERE
    e.department_id = '20' 
    OR e.department_id = '50' 
    OR e.department_id = '60';

-- Q8
SELECT
    last_name,
    hire_date,
    round((CURRENT_DATE - hire_date) / 365, 0) AS workingYear 
FROM
    employees 
WHERE
    hire_date < to_date('01-01-14', 'dd-mm-yy') 
ORDER BY
    workingYear;
    
-- Q9
SELECT
    city,
    country_id,
    CASE
        WHEN
            state_province IS NULL 
        THEN
            'Unknown Province' 
        ELSE
            state_province 
    END
    AS state_province 
FROM
    locations 
WHERE
    UPPER(city) LIKE 'S%' 
    AND length(city) >= 8;

-- Q10
SELECT
    last_name,
    hire_date,
    to_char(next_day((hire_date + 365), 'Thursday'), 'DAY", "MONTH" the "dd" of year "yyyy') AS reviewDay -- Ddspth
FROM
    employees 
WHERE
    hire_date > to_date('01-01-2017', 'dd-mm-yyyy') 
ORDER BY
    next_day((hire_date + 365), 'Thursday'); --ORDER BY 3; means column 3. but not recomended






