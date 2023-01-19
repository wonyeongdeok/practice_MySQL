SELECT b.ingredient_type,
       Sum(a.total_order) total_order
FROM   first_half a
       LEFT JOIN icecream_info b
              ON a.flavor = b.flavor
GROUP  BY b.ingredient_type
ORDER  BY total_order 