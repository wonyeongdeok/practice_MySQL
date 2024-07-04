/*
중성화 전
- Intact% : 

중성화 후
- Spayed%
- Neutered%
*/

SELECT  A.ANIMAL_ID
        ,A.ANIMAL_TYPE
        ,A.NAME
  FROM  ANIMAL_INS AS A
 RIGHT
  JOIN  ANIMAL_OUTS AS B
    ON  A.ANIMAL_ID = B.ANIMAL_ID
 WHERE  A.SEX_UPON_INTAKE LIKE 'Intact%'
   AND  B.SEX_UPON_OUTCOME NOT LIKE 'Intact%'
 ORDER
    BY  A.ANIMAL_ID ASC;