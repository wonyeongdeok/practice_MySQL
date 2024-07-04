/*
구매한 상품 총 수를 구하는 게 아니고 구매한 회원수를 구하는 것이므로
한 회원이 중복 구매를 했더라도 구매한 회원수는 1로 카운트 
*/
SELECT  YEAR(B.SALES_DATE) AS YEAR
        ,MONTH(B.SALES_DATE) AS MONTH
        ,COUNT(DISTINCT A.USER_ID) AS PURCHASED_USERS
        ,ROUND(COUNT(DISTINCT A.USER_ID) / (SELECT  COUNT(*)
                                              FROM  USER_INFO
                                             WHERE  YEAR(JOINED) = 2021), 1) AS PURCHASED_RATIO
  FROM  USER_INFO AS A
 RIGHT  
  JOIN  ONLINE_SALE AS B
    ON  A.USER_ID = B.USER_ID
 WHERE  YEAR(A.JOINED) = 2021
 GROUP
    BY  YEAR(B.SALES_DATE)
        ,MONTH(B.SALES_DATE)
 ORDER
    BY  YEAR ASC
        ,MONTH ASC;