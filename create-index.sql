CREATE INDEX emp_sal_idx ON employees (salary);

select * from employees where salary = 24000;

select * from employees where salary between 24000 and 25000;

CREATE INDEX emp_idx2 ON employees (salary, hire_date);

select * from employees where salary between 24000 and 25000
and hire_date < sysdate-365;

drop index emp_idx2;

drop index emp_sal_idx;

