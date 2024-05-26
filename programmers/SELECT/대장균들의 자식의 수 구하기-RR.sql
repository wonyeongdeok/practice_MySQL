/*
- 동일한 테이블 내에서 ID와 PARENT_ID 컬럼으로 조인하는 법 배움
- 복습 필수
*/

SELECT  A.ID
        ,COUNT(B.ID) AS CHILD_COUNT
  FROM  ECOLI_DATA AS A
  LEFT
  JOIN  ECOLI_DATA AS B
    ON  A.ID = B.PARENT_ID
 GROUP
    BY  A.ID
 ORDER
    BY  A.ID ASC;