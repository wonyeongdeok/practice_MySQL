SELECT  B.USER_ID
        ,B.NICKNAME
        ,SUM(PRICE) AS TOTAL_SALES
  FROM  USED_GOODS_BOARD AS A
  LEFT  
  JOIN  USED_GOODS_USER AS B
    ON  A.WRITER_ID = B.USER_ID
 WHERE  STATUS = 'DONE'
 GROUP
    BY  B.USER_ID
HAVING  SUM(PRICE) >= 700000
 ORDER
    BY  SUM(PRICE) ASC;