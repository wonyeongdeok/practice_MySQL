/*
TRUNCATE(X, D) : 숫자를 특정 소수점 이하 자릿수까지 잘라내는 함수
X : 잘라내고자 하는 숫자나 표현식
D : 특정 소수점 이하 자릿수
EX) TRUNCATE(1.123, 1) -> 1.1  
*/

SELECT  TRUNCATE(SUM(LAT_N), 4)
  FROM  STATION
 WHERE  LAT_N > 38.7880
   AND  LAT_N < 137.2345;