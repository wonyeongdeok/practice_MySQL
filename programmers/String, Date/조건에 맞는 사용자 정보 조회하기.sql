/*
SUBSTRING(col, pos, len)
- 문자열에서 특정 부분을 추출하는 데 사용
- str : 컬럼
- pos : 추출을 시작할 위치. 1부터 시작.
- len : 추출할 길이.
*/

SELECT  B.USER_ID
        ,B.NICKNAME
        ,CONCAT(B.CITY, ' ',
                B.STREET_ADDRESS1, ' ',
                B.STREET_ADDRESS2) AS '전체주소'
        ,CONCAT(SUBSTRING(B.TLNO, 1, 3), '-',
                SUBSTRING(B.TLNO, 4, 4), '-',
                SUBSTRING(B.TLNO, 8, 4))AS '전화번호'
  FROM  USED_GOODS_BOARD AS A
  LEFT
  JOIN  USED_GOODS_USER AS B
    ON  A.WRITER_ID = B.USER_ID
 GROUP
    BY  B.USER_ID
        ,B.NICKNAME
        ,B.CITY
        ,B.STREET_ADDRESS1
        ,B.STREET_ADDRESS2
        ,B.TLNO
HAVING  COUNT(*) >= 3
 ORDER
    BY  B.USER_ID DESC;