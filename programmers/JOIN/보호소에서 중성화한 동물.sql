SELECT a.animal_id,
       a.animal_type,
       a.name
FROM   animal_ins a
       RIGHT JOIN animal_outs b
               ON a.animal_id = b.animal_id
WHERE  a.sex_upon_intake LIKE "intact%"
       AND a.sex_upon_intake <> b.sex_upon_outcome
ORDER  BY a.animal_id;