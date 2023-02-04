-- ---------------------------------
-- DBS311 - LAB6
-- Clint MacDonald
-- Nov. 16, 2022
-- PL/SQL Continued - Cursers and UDFs
-- Student ID: 149814212
-- Student Name: Saetbyeol Lim
-- ---------------------------------
SET SERVEROUTPUT ON;

-- Q1
CREATE OR REPLACE FUNCTION fncCalcFactorial(number IN INT) RETURN INT IS    
    amount INT := 1;
    formula VARCHAR2(255) := number || '!'||' = '||'fact('||number||') = ';
    
BEGIN
    IF number=0 THEN
        DBMS_OUTPUT.PUT_LINE ('0! = 1');
    ELSE
        FOR i IN REVERSE 1..number LOOP 
            amount := amount * i;
            IF i=number THEN
                formula := formula || i;
            ELSE
                formula := formula || ' * '|| i;
            END IF;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE (formula || ' = ' || amount);
    END IF;
    RETURN amount;
    
EXCEPTION
WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE ('There is an Error!');
END fncCalcFactorial;
/
-- -------- EXECUTE Q1
    BEGIN
        DBMS_OUTPUT.PUT_LINE(fncCalcFactorial(3));
        DBMS_OUTPUT.PUT_LINE(fncCalcFactorial(5));
        DBMS_OUTPUT.PUT_LINE(fncCalcFactorial(2));
    END;
    /

-- Q2
CREATE OR REPLACE PROCEDURE spCalcCurrentSalary

-- Q3
CREATE OR REPLACE PROCEDURE spDepartmentsReport 

-- Q4
CREATE OR REPLACE FUNCTION spDetermineWinningTeam 




