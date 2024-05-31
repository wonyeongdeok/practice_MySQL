WITH CTE AS (
    SELECT  YEAR(DIFFERENTIATION_DATE) AS YEAR
            ,MAX(SIZE_OF_COLONY) AS MAX_SIZE
      FROM  ECOLI_DATA
     GROUP
        BY  YEAR(DIFFERENTIATION_DATE)
)
SELECT  A.YEAR
        ,CTE.MAX_SIZE - A.SIZE_OF_COLONY AS YEAR_DEV
        ,A.ID
  FROM  (SELECT  *
                 ,YEAR(DIFFERENTIATION_DATE) AS YEAR
           FROM  ECOLI_DATA) AS A
  LEFT
  JOIN  CTE
    ON  A.YEAR = CTE.YEAR
 ORDER
    BY  A.YEAR ASC
        ,CTE.MAX_SIZE - A.SIZE_OF_COLONY ASC