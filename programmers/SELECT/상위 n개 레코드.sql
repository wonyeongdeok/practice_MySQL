SELECT  NAME
  FROM  ANIMAL_INS
 WHERE  DATETIME IN (
                    SELECT  MIN(DATETIME)
                      FROM  ANIMAL_INS
                    );