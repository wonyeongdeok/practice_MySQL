SELECT  ID -- 3세대
  FROM  ECOLI_DATA
 WHERE  PARENT_ID IN (SELECT  ID -- 2세대
                        FROM  ECOLI_DATA
                       WHERE  PARENT_ID IN (SELECT  ID -- 3세대
                                              FROM  ECOLI_DATA
                                             WHERE  PARENT_ID IS NULL))
 ORDER
    BY  ID ASC;

/* RECURSIVE 활용 풀이
WITH RECURSIVE CTE AS
(
    SELECT  ID
            ,PARENT_ID
            ,1 AS DEPTH
      FROM  ECOLI_DATA
     WHERE  PARENT_ID IS NULL
     UNION
       ALL
    SELECT  CHILD.ID
            ,CHILD.PARENT_ID
            ,CTE.DEPTH + 1
      FROM  ECOLI_DATA AS CHILD
     INNER
      JOIN  CTE
        ON  CHILD.PARENT_ID = CTE.ID
)
SELECT ID FROM CTE WHERE DEPTH = 3;
*/