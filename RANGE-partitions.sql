CREATE TABLE sales_range 
(
salesrep_id  NUMBER(5), 
salesrep_name VARCHAR2(30), 
sales_amount  NUMBER(10), 
sales_date    DATE)
PARTITION BY RANGE(sales_date) 
(
PARTITION sales_jan2017 VALUES LESS THAN(TO_DATE('01/02/2017','DD/MM/YYYY')),
PARTITION sales_feb2017 VALUES LESS THAN(TO_DATE('01/03/2017','DD/MM/YYYY')),
PARTITION sales_mar2017 VALUES LESS THAN(TO_DATE('01/04/2017','DD/MM/YYYY')),
PARTITION sales_apr2017 VALUES LESS THAN(TO_DATE('01/05/2017','DD/MM/YYYY'))
);


INSERT INTO sales_range VALUES  (100, 'Picard', 100, '01-JAN-2017');

SELECT COUNT(*) FROM sales_range partition (sales_jan2017);



INSERT INTO sales_range VALUES  (100, 'Picard', 100, '01-FEB-2017');

SELECT COUNT(*) FROM sales_range partition (sales_feb2017);



INSERT INTO sales_range VALUES  (100, 'Picard', 100, '01-MAY-2017');

SELECT COUNT(*) FROM sales_range partition (sales_may2017);



ALTER TABLE sales_range  ADD PARTITION sales_may2017 VALUES LESS THAN(TO_DATE('01/06/2017','DD/MM/YYYY'));

