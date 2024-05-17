/*
DATE: 날짜 함수로, 입력된 날짜와 시간 값에서 날짜 부분만 추출
CAST: 형변환 함수로, 한 데이터 형식을 다른 데이터 형식으로 변환
DATE_FORMAT: 형 변환 함수로, 날짜와 시간 값을 지정된 형식의 문자열로 변환

DATE와 CAST를 사용한 날짜 추출 작업 시 정상작동 하지 않는 경우 있으므로
명시적으로 형식 지정하는 DATE_FORMAT을 주로 사용할 것을 권장
*/

SELECT BOOK_ID,
       DATE_FORMAT(PUBLISHED_DATE, '%Y-%m-%d') AS PUBLISHED_DATE
       -- CAST(PUBLISHED_DATE AS DATE) AS PUBLISHED_DAT -> 2021-10-24 00:00:00
       -- DATE(PUBLISHED_DATE) AS PUBLISHED_DATE -> 2021-10-24 00:00:00
FROM   BOOK
WHERE  YEAR(PUBLISHED_DATE) = '2021'
       AND CATEGORY = '인문';