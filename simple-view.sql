create or replace view emp_sales
as
select * from employees where job_id = 'SA_MAN';
 
select * from emp_sales;

select * from (select * from employees where job_id = 'SA_MAN');

select * from emp_sales
where salary > 12000;