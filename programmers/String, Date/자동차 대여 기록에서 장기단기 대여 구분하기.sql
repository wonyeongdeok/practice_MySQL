-- 대여 기간 계산 시 Datediff(end_date, start_date)를 적용하게 되는데 이는 두 날짜의 차이만 반환.
-- 그러나, 대여 기간에 대여 시작 날짜도 포함해야 하므로 + 1
SELECT history_id,
       car_id,
       Date_format(start_date, '%Y-%m-%d'),
       Date_format(end_date, '%Y-%m-%d'),
       CASE
         WHEN Datediff(end_date, start_date) + 1 >= 30 THEN '장기 대여'
         ELSE '단기 대여'
       END AS rent_type
FROM   car_rental_company_rental_history
WHERE  Date_format(start_date, '%Y-%m') = '2022-09'
ORDER  BY history_id DESC;
