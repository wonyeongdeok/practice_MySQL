SELECT  B.HISTORY_ID
        ,FLOOR(A.DAILY_FEE * (1 - IFNULL(C.DISCOUNT_RATE, 0) * 0.01) * B.DAY_DIFF) AS FEE
  FROM  CAR_RENTAL_COMPANY_CAR AS A
 RIGHT
  JOIN  (SELECT  *
                 ,DATEDIFF(END_DATE, START_DATE) + 1 AS DAY_DIFF  -- 빌린 날 포함해서 요금 부과
                 ,CASE WHEN DATEDIFF(END_DATE, START_DATE) >= 90 THEN '90일 이상'
                       WHEN DATEDIFF(END_DATE, START_DATE) >= 30 THEN '30일 이상'
                       WHEN DATEDIFF(END_DATE, START_DATE) >= 7 THEN '7일 이상'
                       END AS DURATION_TYPE
           FROM  CAR_RENTAL_COMPANY_RENTAL_HISTORY) AS B
    ON  A.CAR_ID = B.CAR_ID
  LEFT
  JOIN  CAR_RENTAL_COMPANY_DISCOUNT_PLAN AS C
    ON  A.CAR_TYPE = C.CAR_TYPE
   AND  B.DURATION_TYPE = C.DURATION_TYPE
 WHERE  A.CAR_TYPE = '트럭'
 ORDER
    BY  FEE DESC
        ,B.HISTORY_ID DESC;