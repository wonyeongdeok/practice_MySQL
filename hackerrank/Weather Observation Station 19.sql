/*
SQRT(NUM) : 숫자 NUM의 양의 제곱근
POW(NUM, EXPONET) : 숫자 NUM을 지정한 지수 EXPONET로 거듭 제곱
거듭 제곱 : 숫자를 지정된 지수만큼 여러 번 곱하는 연산
*/

SELECT  ROUND(SQRT((POW(MIN(LAT_N) - MAX(LAT_N), 2))
                    + (POW(MIN(LONG_W) - MAX(LONG_W), 2))), 4)
  FROM  STATION;