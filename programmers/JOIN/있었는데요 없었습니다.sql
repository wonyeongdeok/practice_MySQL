SELECT a.animal_id,
       a.NAME
FROM   animal_ins a
       LEFT JOIN animal_outs b
              ON a.animal_id = b.animal_id
WHERE  a.datetime > b.datetime
ORDER  BY a.datetime