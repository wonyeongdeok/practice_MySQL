SELECT b.animal_id,
       b.NAME
FROM   animal_ins a
       RIGHT JOIN animal_outs b
               ON a.animal_id = b.animal_id
WHERE  a.animal_id IS NULL 