SELECT EMPLOYEE_ID, salary, department_id
FROM   employees t1
WHERE salary > (SELECT avg(salary)
FROM   employees t2
WHERE t1.department_id = t2.department_id);
