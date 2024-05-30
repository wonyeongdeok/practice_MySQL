-- 각 세대별 자식이 없는 개체의 수(COUNT)와 세대(GENERATION)

WITH RECURSIVE CTE AS (
    -- Anchor member
    SELECT  ID
            ,PARENT_ID
            ,1 AS LEVEL
      FROM  ECOLI_DATA AS E
     WHERE  PARENT_ID IS NULL
     UNION 
       ALL
    -- Recursive member
    SELECT  E.ID
            ,E.PARENT_ID
            ,CTE.LEVEL + 1
      FROM  ECOLI_DATA AS E
     INNER
      JOIN  CTE
        ON  E.PARENT_ID = CTE.ID
)

SELECT  COUNT(*) AS COUNT
        ,LEVEL AS GENERATION
  FROM  CTE
 WHERE  ID NOT IN (SELECT  PARENT_ID
                     FROM  CTE
                    WHERE  PARENT_ID IS NOT NULL)
 GROUP
    BY  LEVEL
 ORDER
    BY  LEVEL ASC;