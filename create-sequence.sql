CREATE SEQUENCE my_seq1
MINVALUE 1
MAXVALUE 9999999
START WITH 1
INCREMENT BY 1
CACHE 20;

CREATE SEQUENCE my_seq2
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 20;

Select my_seq1.NEXTVAL from dual;

Select my_seq1.NEXTVAL from dual;
Select my_seq1.NEXTVAL from dual;

Select my_seq1.CURRVAL from dual;



Select my_seq2.NEXTVAL from dual;
Select my_seq2.NEXTVAL from dual;


Select my_seq1.CURRVAL from dual;

Select my_seq2.CURRVAL from dual;


create table my_suppliers (supplier_id number(10), supplier_name varchar2(50));

insert into my_suppliers values (my_seq1.NEXTVAL, 'Apple');

insert into my_suppliers values (my_seq1.NEXTVAL, 'Google');

select * from my_suppliers;

insert into my_suppliers values (my_seq1.NEXTVAL, 'Microsoft');

drop sequence my_seq1;

select * from my_suppliers;




