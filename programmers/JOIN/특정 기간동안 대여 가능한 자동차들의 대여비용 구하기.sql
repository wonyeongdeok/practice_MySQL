/*
WHERE 절에서 날짜 필터링 하면 안 되고 HAVING 절에서 해야 하는 이유
- 동일한 차량에 대해 여러 날에 대여 기록이 존재
- 2022-11-01부터 2022-11-30 사이 대여 기록이 있을 경우 WHERE 절에서 필터링하면 제외 됨
- 하지만, 단 한 건이라도 2022-11-01 이전 대여 종료 기록이 있다면 최종 결과에 출력 됨
- 그러므로 그룹화 후 종료 날짜 최대 값을 사용하여 필터링
*/
SELECT  A.CAR_ID
        ,A.CAR_TYPE
        ,FLOOR(A.DAILY_FEE * (1 - C.DISCOUNT_RATE * 0.01)) * 30 AS FEE
  FROM  CAR_RENTAL_COMPANY_CAR AS A
 RIGHT
  JOIN  CAR_RENTAL_COMPANY_RENTAL_HISTORY AS B
    ON  A.CAR_ID = B.CAR_ID
 INNER
  JOIN  CAR_RENTAL_COMPANY_DISCOUNT_PLAN AS C
    ON  A.CAR_TYPE = C.CAR_TYPE
 WHERE  A.CAR_TYPE IN ('세단', 'SUV')
   AND  C.DURATION_TYPE = '30일 이상'
 GROUP
    BY  A.CAR_ID
        ,A.CAR_TYPE
HAVING  MAX(B.END_DATE) < '2022-11-01'
   AND  FEE >= 500000 AND FEE < 2000000
 ORDER
    BY  FEE DESC
        ,A.CAR_TYPE ASC
        ,A.CAR_ID DESC;