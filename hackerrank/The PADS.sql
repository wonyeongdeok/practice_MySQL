SELECT  CONCAT(NAME
               ,'('
               ,LEFT(OCCUPATION, 1)
               ,')') AS NM_OC
  FROM  OCCUPATIONS
 ORDER
    BY  NM_OC ASC;

SELECT  CONCAT('There are a total of '
                ,COUNT(*)
                ,' '
                ,LOWER(OCCUPATION)
                ,'s.') AS TOTAL
  FROM  OCCUPATIONS
 GROUP
    BY  OCCUPATION
 ORDER
    BY  COUNT(*) ASC
        ,OCCUPATION ASC;