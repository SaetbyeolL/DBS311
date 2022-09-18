-- ***************************************
-- DBS311 - Fall 2022
-- Lab 1b
-- Review of JOIN statements
-- 
-- Saetbyeol Lim
-- 149814212
-- 18th Sep 2022
-- ***************************************
-- no regular expression
/* 
NOTES
-- Make sure you follow the course style guide for SQL as posted on blackboard.
-- Data should always be sorted in a logical way, for the question, even if the 
   question does not specify to sort it.
*/

-- Q1
/* 
Provide a list of ALL departments, what city they are located in, and the name
of the current manager, if there is one.  
*/
SELECT
    d.department_id,
    d.department_name AS "department",
    l.city,
    e.first_name || ' ' || e.last_name AS "name" 
FROM
    departments d 
    JOIN
        locations l 
        ON d.location_id = l.location_id 
    JOIN
        employees e 
        ON d.manager_id = e.manager_id 
WHERE
    e.manager_id IS NOT NULL 
ORDER BY
    d.department_id;

-- Q2
/*
Allow the user to enter the name of a country, or any part of the name, and 
then list all employees, with their job title, currently working in that country.
*/
SELECT
    e.employee_id,
    e.first_name || ' ' || e.last_name AS "name",
    e.job_id AS "job title",
    c.country_name AS "country" 
FROM
    employees e 
    JOIN
        departments d 
        ON e.department_id = d.department_id 
    JOIN
        locations l 
        ON d.location_id = l.location_id 
    JOIN
        countries c 
        ON l.country_id = c.country_id 
WHERE
    l.country_id LIKE '&country%' 
ORDER BY
    e.employee_id;

-- Q3
/*
Provide a contact list of all employees, and if they have a manager, 
the name of their direct manager.
*/
SELECT
    e.first_name || ' ' || e.last_name AS "name",
    e.phone_number,
    e.manager_id 
FROM
    employees e 
    FULL OUTER JOIN
        departments d 
        ON e.department_id = d.department_id 
WHERE
    e.manager_id IS NOT NULL 
ORDER BY
    e.employee_id;

-- Q4
/*
Provide a list of locations in the database, that currently do not have 
any employees working there.
*/
SELECT
    l.location_id,
    l.street_address,
    l.postal_code,
    l.city,
    l.state_province,
    l.country_id 
FROM
    locations l 
    JOIN
        departments d 
        ON d.location_id = l.location_id 
    JOIN
        employees e 
        ON d.department_id = e.department_id 
WHERE
    d.location_id IN
    (
        1400,
        1500,
        1700,
        1800,
        2500
    )
ORDER BY
    l.location_id;

-- Q5
/*
Provide a list of employees whom are currently still in the same job that they
started in (i.e. they have never changed job titles).
*/
SELECT
    e.employee_id,
    e.first_name || ' ' || e.last_name AS "name",
    e.job_id 
FROM
    employees e 
    INNER JOIN
        job_history j 
        ON j.job_id = e.job_id 
WHERE
    e.job_id = j.job_id 
ORDER BY
    employee_id;