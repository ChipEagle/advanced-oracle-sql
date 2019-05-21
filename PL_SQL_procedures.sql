CREATE OR REPLACE PROCEDURE proc1 (emp_id IN NUMBER)
IS
    emp_fname VARCHAR2(50);
BEGIN
    SELECT first_name  INTO emp_fname FROM employees where employee_id = emp_id;
    DBMS_OUTPUT.PUT_LINE('Employee name is: ' || emp_fname);
END;

SET SERVEROUTPUT ON

EXEC proc1(100);

EXEC proc1(200);


/*

Example with EXCEPTION

*/

CREATE OR REPLACE PROCEDURE hr.update_emp_sal (P_EMP_ID IN NUMBER, SAL_RAISE IN NUMBER)
AS
    V_EMP_CURRENT_SAL NUMBER;
BEGIN

SELECT SALARY INTO V_EMP_CURRENT_SAL FROM EMPLOYEES 
 WHERE EMPLOYEE_ID = P_EMP_ID;
 
        UPDATE employees
        SET salary = V_EMP_CURRENT_SAL + SAL_RAISE
        WHERE employee_id = P_EMP_ID;
        
    EXCEPTION WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR (-20001, 'An error was encountered -    ' || SQLCODE ||' 
        ERROR - ' || SQLERRM);
        ROLLBACK;
    COMMIT;
END;


SELECT * FROM employees;

EXEC hr.update_emp_sal(100, 10.01);

SELECT * FROM employees;

EXEC hr.update_emp_sal(100, 'N0.01');

DROP PROCEDURE hr.update_emp_sal;

