SELECT department_id
FROM departments
WHERE LOCATION_ID = 1700;


SELECT first_name, last_name, department_id
FROM employees
WHERE department_id IN (SELECT department_id
FROM departments
WHERE LOCATION_ID = 1700);


SELECT first_name, last_name, department_id
FROM employees
WHERE department_id NOT IN (SELECT department_id
FROM departments
WHERE LOCATION_ID = 1700);
