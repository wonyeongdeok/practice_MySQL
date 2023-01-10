SELECT Year(b.sales_date) year,
       Month(b.sales_date) month,
       a.gender,
       Count(DISTINCT a.user_id) users
FROM   user_info a
       RIGHT JOIN online_sale b
               ON a.user_id = b.user_id
WHERE  a.gender IS NOT NULL
GROUP  BY year,
          month,
          gender
ORDER  BY year,
          month,
          gender;