select * from all_tables;

select * from user_tables;

select * from user_tables
where table_name = 'EMPLOYEES';


select * from user_tables
where table_name like 'EMP%';

select * from user_tab_columns
where table_name = 'EMPLOYEES';

select * from user_ind_columns
where table_name = 'EMPLOYEES';

select username, program, machine from v$session;

select * from v$instance;

select * from v$lock;

select * from all_users;