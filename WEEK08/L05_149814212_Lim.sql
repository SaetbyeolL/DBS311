-- ***********************
-- Name: Saetbyeol Lim
-- ID: 149814212
-- Date: 9 NOV 2022
-- Purpose: Lab 5 PL/SQL(PART1) - DBS311
-- ***********************

-- Q1.
-- Write a store procedure that gets an integer number and prints
-- The number is even.
-- If a number is divisible by 2.Otherwise, it prints 
-- The number is odd
CREATE OR REPLACE PROCEDURE even_or_odd(num IN NUMBER) AS remainder NUMBER;
BEGIN
    remainder := MOD(num, 2);
IF (remainder = 0) 
THEN
    dbms_output.put_line('The number is even.');
ELSE
    dbms_output.put_line('The number is odd.');
END IF;

EXCEPTION 
    WHEN OTHERS THEN dbms_output.put_line('There is an Error');
END;
        
        
-- Q2.
--Create a stored procedure named find_employee. 
--This procedure gets an employee number and prints the following employee information:
--First name 
--Last name 
--Email
--Phone 	
--Hire date 
--Job title
--The procedure gets a value as the employee ID of type NUMBER.
--See the following example for employee ID 107: 
--First name: Summer
--Last name: Payn
--Email: summer.payne@example.com
--Phone: 515.123.8181
--Hire date: 07-JUN-16
--Job title: Public Accountant
--The procedure display a proper error message if any error accours.
CREATE OR REPLACE PROCEDURE find_employee(employee_no IN NUMBER) AS
    first_name VARCHAR2(255 BYTE);
    last_name  VARCHAR2(255 BYTE);
    email      VARCHAR2(255 BYTE);
    phone      VARCHAR2(255 BYTE);
    hire_date  DATE;
    job_title  VARCHAR2(255 BYTE);
BEGIN
    SELECT first_name,
           last_name,
           email,
           phone,
           hire_date,
           job_id
    INTO
        first_name,
        last_name,
        email,
        phone,
        hire_date,
        job_title
    FROM employees
    WHERE employee_id = employee_no;
    dbms_output.put_line('First name: ' || first_name);
    dbms_output.put_line('Last name: ' || last_name);
    dbms_output.put_line('Email: ' || email);
    dbms_output.put_line('Phone: ' || phone);
    dbms_output.put_line('Hire date: ' || TO_CHAR(hire_date, 'DD-MON-YY'));
    dbms_output.put_line('Job title: ' || job_title);
EXCEPTION
    WHEN NO_DATA_FOUND THEN dbms_output.put_line('Employee does not exist');
    WHEN OTHERS THEN dbms_output.put_line('Error! please try again');
END;


-- Q3.
/*
In a unionized company, the collective bargaining agreement often contains a requirement for staff 
to receive a given percentage salary increase an on annual basis.  
These salary increases are different for different departments.  
For example, the company must give all employees who work in the marketing department an annual 2.5% raise.  
Write a procedure named update_salary_by_dept to update the salaries of all employees in a given department 
and the given percentage increase to be added to the current salary if the salary is greater than 0. 
The procedure shows the number of updated rows if the update is successful.
The procedure gets two input parameters and sends one back out again with the number of rows updated.  
-	When defining the first parameter, set the data type to the same data type as the associated field using the %type attribute.
-	Make sure your solution handles any possible errors with appropriate responses.
Additionally, write the code to execute the procedure.
*/
CREATE OR REPLACE PROCEDURE update_salary_by_dept ( 
    depid IN employees.department_id % type, 
    annualraise IN employees.salary % type 
    ) AS 
BEGIN
    UPDATE employees e 
    SET salary = (1 + annualraise / 100)* salary 
    WHERE
        department_id = depid;
    IF SQL % rowcount = 0 
        THEN DBMS_OUTPUT.PUT_LINE ('There is no record');
    ELSE
        DBMS_OUTPUT.PUT_LINE (SQL % rowcount || 'updated');
    END IF;
EXCEPTION 
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('There is an error');
END update_salary_by_dept;


    
-- Q4.
/*
In an attempt to equalize salaries over time, every year, the company increase the monthly salary of all employees 
who make less than the average salary by 1% (salary *1.01).  
Write a stored procedure named spUpdateSalary_UnderAvg. 
This procedure will not have any parameters. You need to find the average salary of all employees 
and store it into a variable of the same type. 
- If the average salary is less than or equal to $9000, 
  update the employees’ salary by 2% if the salary of the employee is less than the calculated average. 
- If the average salary is greater than $9000, update employees’ salary by 1% 
  if the salary of the employee is less than the calculated average. 
The query displays an error message if any error occurs. Otherwise, it displays the number of updated rows.
*/
CREATE OR REPLACE PROCEDURE spupdatesalary_underavg AS 
    averagesalary employees.salary % type;
BEGIN
    SELECT AVG(salary) 
    INTO averagesalary 
    FROM employees;

    IF averagesalary <= 9000 
    THEN
        UPDATE employees 
        SET salary = salary * 1.02 
        WHERE salary < averagesalary;
    ELSE
        UPDATE employees 
        SET salary = salary * 1.01 
        WHERE salary < averagesalary;
    END IF;
dbms_output.put_line(SQL % rowcount || 'updated');
EXCEPTION 
    WHEN TOO_MANY_ROWS THEN DBMS_OUTPUT.PUT_LINE('Too many rows');
    WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('No data found');
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('There is an error');
END spupdatesalary_underavg;



-- Q5.
/*
The company needs a report that shows three categories of employees based their salaries. 
The company needs to know if the salary is low, fair, or high. Let’s assume that
?	If the salary is less than 
o	(avg salary – min salary) / 2
The salary is low.
?	If the salary is greater than 
o	(max salary – avg salary) / 2
The salary is high.
?	If the salary is between 
o	(avg salary - min salary) / 2
o	and
o	(max salary - avg salary) / 2
o	the end values included
The salary is fair.
Write a procedure named spSalaryReport to show the number of employees in each price category:
The following is a sample output of the procedure if no error occurs:
Low: 4
Fair: 12
High: 6  
The values in the above examples are just random values and may not match the real numbers in your result.
Make sure you choose a proper data type for each variable. You may need to define more variables based on your solution.
*/
CREATE OR REPLACE PROCEDURE spSalaryReport AS
    minSalary NUMBER;
	maxSalary NUMBER;
	avgSalary NUMBER;








