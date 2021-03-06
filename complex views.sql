desc departments;

SELECT emp_sales.first_name, departments.department_name
FROM emp_sales JOIN departments ON emp_sales.department_id = departments.department_id;

CREATE VIEW locations_view AS
SELECT d.department_id, d.department_name, l.location_id, l.city
FROM departments d, locations l
WHERE d.location_id = l.location_id;

SELECT * FROM locations_view;

CREATE OR REPLACE VIEW emp_sales
as
select employee_id, first_name, last_name from employees where job_id = 'SA_MAN';

select * from emp_sales;

DROP VIEW emp_sales;