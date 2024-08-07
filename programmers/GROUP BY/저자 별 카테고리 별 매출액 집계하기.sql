SELECT  C.AUTHOR_ID
        ,C.AUTHOR_NAME
        ,B.CATEGORY
        ,SUM(A.SALES * B.PRICE) AS TOTAL_SALES
  FROM  BOOK_SALES AS A
  LEFT
  JOIN  BOOK AS B
    ON  A.BOOK_ID = B.BOOK_ID
  LEFT
  JOIN  AUTHOR AS C
    ON  B.AUTHOR_ID = C.AUTHOR_ID
 WHERE  DATE_FORMAT(A.SALES_DATE, '%Y-%m') = '2022-01'
 GROUP
    BY  C.AUTHOR_ID
        ,C.AUTHOR_NAME
        ,B.CATEGORY
 ORDER
    BY  C.AUTHOR_ID ASC
        ,B.CATEGORY DESC;