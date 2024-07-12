/*
LEFT(column, n) : 문자열의 왼쪽에서 n개의 문자 반환
RIGHT(column, n) : 문자열의 오른쪽에서 n개의 문자 반환
*/

SELECT  DISTINCT CITY
  FROM  STATION
 WHERE  LEFT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u')
   AND  RIGHT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u');