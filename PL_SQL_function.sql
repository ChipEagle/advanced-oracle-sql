CREATE OR REPLACE Function func1 (emp_id IN NUMBER)
   RETURN VARCHAR2
IS
    emp_fname VARCHAR2(50);
BEGIN
    SELECT first_name  INTO emp_fname FROM employees where employee_id = emp_id;
    RETURN emp_fname;
END;


SELECT func1(100) from dual;

SELECT func1(200) from dual;
