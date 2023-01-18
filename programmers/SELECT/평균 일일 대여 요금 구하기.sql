SELECT Round(Avg(daily_fee), 0) average_fee
FROM   car_rental_company_car
WHERE  car_type = 'SUV'; 