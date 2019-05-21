update employees set salary = 30000 where employee_id = 100;


/*
Open a new connection HR2
*/

update employees set salary = 35000 where employee_id = 100;

commit;

SELECT username,
       osuser,
       sid,
       serial#,
       lockwait,
       status,
       module,
       machine,
       program
FROM   v$session
ORDER BY username;