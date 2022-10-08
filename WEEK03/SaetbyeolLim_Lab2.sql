-- ***********************
-- Name: Saetbyeol Lim
-- ID: 149814212
-- Date: 25th Sep
-- Purpose: Lab 2 DBS311
-- ***********************
-- Question 1
SELECT
    to_char(AVG((nvl(commission_pct, 0) * salary) + salary ) - MIN((nvl(commission_pct, 0) *salary) + salary ), '$99,999.99') AS "Real Amount" 
FROM
    employees;       
  
-- Question 2
SELECT
    department_id,
    to_char(MAX(nvl(commission_pct, 0) *salary + salary), '$99,999') AS highestpay,
    to_char(MIN(nvl(commission_pct, 0) *salary + salary), '$99,999') AS lowestpay,
    to_char(AVG(nvl(commission_pct, 0) *salary + salary), '$99,999') AS averagepay 
FROM
    employees 
GROUP BY
    department_id 
ORDER BY
    highestpay DESC;

-- Question 3
SELECT
    department_id AS dept#,
    job_id AS job,
    COUNT(employee_id)AS howmany 
FROM
    employees 
HAVING
    COUNT(job_id) >= 1 
GROUP BY
    department_id,
    job_id 
ORDER BY
    howmany DESC;
    
-- Question 4
SELECT
    job_id AS jobtitle,
    SUM(salary + (nvl(commission_pct, 0) * salary)) AS totalamount 
FROM
    employees 
WHERE
    job_id NOT IN
    ('AD_PRES','AD_VP')
    AND salary >= 11000 
GROUP BY
    job_id 
ORDER BY
    totalamount DESC;

-- Question 5
SELECT
    manager_id,
    COUNT(employee_id) AS howmany 
FROM
    employees 
WHERE
    manager_id NOT IN
    (100,101,102)
GROUP BY
    manager_id 
HAVING
    COUNT(employee_id) >= 2 
ORDER BY
    howmany DESC;
    
-- Question 6
SELECT
    department_id,
    MAX(hire_date) AS earliesthireddate 
FROM
    employees 
WHERE
    department_id NOT IN
    (10,20)
    AND hire_date NOT BETWEEN '25-sep-2012' AND '25-sep-2022' 
GROUP BY
    department_id 
ORDER BY
    MAX(hire_date) DESC;
    