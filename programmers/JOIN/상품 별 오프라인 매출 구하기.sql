/*
A.PRODUCT_CODE에 대해 그룹화 했기 때문에 SALES 컬럼 계산 시 SUM을 해줘야함
그렇지 않으면 합산된 결과가 안 나오고 A.PRODUCT_CODE 그룹 내 첫번째 레코드 대한 A.PRICE * B.SALES_AMOUNT가 출력됨
*/

SELECT  A.PRODUCT_CODE
        ,SUM(A.PRICE * B.SALES_AMOUNT) AS SALES
  FROM  PRODUCT AS A
 RIGHT
  JOIN  OFFLINE_SALE AS B
    ON  A.PRODUCT_ID = B.PRODUCT_ID
 GROUP
    BY  A.PRODUCT_CODE
 ORDER
    BY  SALES DESC
        ,A.PRODUCT_CODE ASC;