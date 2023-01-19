SELECT Month(start_date) month,
       car_id,
       Count(*)          records
FROM   car_rental_company_rental_history
WHERE  Year(start_date) = 2022
       AND Month(start_date) BETWEEN 8 AND 10
       AND car_id IN (SELECT car_id
                      FROM   car_rental_company_rental_history
                      WHERE  Year(start_date) = 2022
                             AND Month(start_date) BETWEEN 8 AND 10
                      GROUP  BY car_id
                      HAVING Count(*) >= 5)
GROUP  BY Month(start_date),
          car_id
ORDER  BY Month(start_date),
          car_id DESC 