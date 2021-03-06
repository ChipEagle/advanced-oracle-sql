SELECT department_id, count(*) emp_count
FROM employees
GROUP BY department_id;

-- Inline View

Select * from 
(SELECT department_id, count(*) emp_count
FROM employees
GROUP BY department_id) emp join departments dept on emp.department_id=dept.department_id;

select * from employees
Where commission_pct is null
Order by salary desc;


select * 
from  (select * from employees
where commission_pct is null
Order by salary desc) top_salaries
Where rownum <=3;