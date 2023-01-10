SELECT name,
       Count(*) count
FROM   animal_ins
WHERE  name IS NOT NULL
GROUP  BY name
HAVING Count(name) > 1
ORDER  BY name; 