/* Using ANSI SQL */

SELECT 
   customer_id
  ,previous_value
  ,current_value
  ,current_value - previous_value AS difference
  ,CASE WHEN current_value - previous_value < 0 AND current_value != 0 THEN 
             'DownGrade'
        WHEN current_value - previous_value > 0 AND previous_value != 0 THEN
             'UpGrade'
        WHEN current_value - previous_value = 0 THEN 
             'NoChange'
        WHEN current_value - previous_value < 0 AND current_value = 0 THEN
             'Left'
        WHEN current_value - previous_value > 0 AND previous_value = 0 THEN
             'New'
    ELSE
             'Error'
   END AS status 
FROM (
SELECT customer_id
       ,max(product_cnt_201901) AS previous_value
       ,max(product_cnt_201902) AS current_value
FROM (
SELECT
    customer_id
   ,yyyymm
   ,product_cnt        AS product_cnt_201901
   ,null               AS product_cnt_201902
FROM
    cust_data
WHERE yyyymm = '201901'
UNION ALL
SELECT
    customer_id
   ,yyyymm
   ,null               AS product_cnt_201901
   ,product_cnt        AS product_cnt_201902
FROM
    cust_data
WHERE yyyymm = '201902'
ORDER BY customer_id, yyyymm
)
GROUP BY customer_id
ORDER BY customer_id
);

/* Using Analytical function */

WITH calc_data AS
(SELECT 
    customer_id
   ,lead (product_cnt,1) OVER (partition by customer_id order by yyyymm) AS current_value
   ,product_cnt AS previous_value
FROM cust_data
ORDER BY customer_id, yyyymm
)
SELECT 
   customer_id
  ,previous_value
  ,current_value
  ,current_value - previous_value AS difference
  ,CASE WHEN current_value - previous_value < 0 AND current_value != 0 THEN 
             'DownGrade'
        WHEN current_value - previous_value > 0 AND previous_value != 0 THEN
             'UpGrade'
        WHEN current_value - previous_value = 0 THEN 
             'NoChange'
        WHEN current_value - previous_value < 0 AND current_value = 0 THEN
             'Left'
        WHEN current_value - previous_value > 0 AND previous_value = 0 THEN
             'New'
    ELSE
             'Error'
   END AS status       
FROM calc_data
WHERE current_value IS NOT NULL
ORDER BY customer_id;

