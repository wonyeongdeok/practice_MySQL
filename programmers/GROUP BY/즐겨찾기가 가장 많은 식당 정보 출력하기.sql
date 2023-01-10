SELECT a.food_type,
       a.rest_id,
       a.rest_name,
       a.favorites
FROM   rest_info a
       INNER JOIN (SELECT food_type,
                          Max(favorites) favorites
                   FROM   rest_info
                   GROUP  BY food_type) b
               ON a.food_type = b.food_type
                  AND a.favorites = b.favorites
ORDER  BY food_type DESC;