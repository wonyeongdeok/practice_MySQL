/*
CAST(COLUMN AS CHAR) : 문자형으로 변환(캐스팅)
CAST(COLUMN AS UNSIGNED) : 정수형으로 변환

REPLACE(COLUMN, A, B) : A문자를 B문자로 대체
*/

SELECT  CEIL(
            AVG(SALARY)
            - 
            AVG(CAST(REPLACE(CAST(SALARY AS CHAR), '0', '') AS UNSIGNED))
            )
  FROM  EMPLOYEES;