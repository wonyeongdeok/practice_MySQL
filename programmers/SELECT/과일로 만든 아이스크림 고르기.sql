SELECT first_half.flavor
FROM first_half LEFT JOIN icecream_info on first_half.flavor=icecream_info.flavor
WHERE first_half.total_order>3000 AND
      icecream_info.ingredient_type='fruit_based'
ORDER BY first_half.total_order DESC