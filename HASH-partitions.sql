CREATE TABLE sales_hash
(
salesrep_id  NUMBER(5), 
salesrep_name VARCHAR2(30), 
sales_amount  NUMBER(10), 
sale_no       NUMBER(5)) 
PARTITION BY HASH(sale_no) 
PARTITIONS 4 ;

ANALYZE TABLE sales_hash COMPUTE STATISTICS;

SELECT table_name, partition_name, num_rows 
FROM user_tab_partitions
WHERE table_name = 'SALES_HASH';

INSERT INTO sales_hash VALUES (100,'Picard', 500, 1423);

ANALYZE TABLE sales_hash COMPUTE STATISTICS;

SELECT table_name, partition_name, num_rows FROM user_tab_partitions
WHERE table_name = 'SALES_HASH';


INSERT INTO sales_hash VALUES (100,'Picard', 500, 1423);
INSERT INTO sales_hash VALUES (100,'Picard', 600, 1424);
INSERT INTO sales_hash VALUES (100,'Picard', 200, 1425);
INSERT INTO sales_hash VALUES (100,'Picard', 100, 1426);
INSERT INTO sales_hash VALUES (100,'Picard', 500, 1427);
INSERT INTO sales_hash VALUES (100,'Picard', 600, 1428);
INSERT INTO sales_hash VALUES (100,'Picard', 200, 1429);
INSERT INTO sales_hash VALUES (100,'Picard', 100, 1430);

ANALYZE TABLE sales_hash COMPUTE STATISTICS;

SELECT table_name, partition_name, num_rows FROM user_tab_partitions
WHERE table_name = 'SALES_HASH';


