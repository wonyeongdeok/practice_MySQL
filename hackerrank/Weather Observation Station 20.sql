-- I think it`s essential to consider whether record length is even or odd number.
WITH CTE AS (
    SELECT  LAT_N
            ,ROW_NUMBER() OVER(ORDER BY LAT_N DESC) AS ROW_NUM
      FROM  STATION
)
SELECT  CASE WHEN COUNT(*) % 2 != 0 THEN (SELECT  ROUND(LAT_N, 4)
                                            FROM  CTE
                                           WHERE  ROW_NUM = CEIL(COUNT(*) / 2))
             ELSE ROUND(((SELECT  LAT_N
                            FROM  CTE
                           WHERE  ROW_NUM = COUNT(*) / 2)
                        +
                         (SELECT  LAT_N
                            FROM  CTE
                           WHERE  ROW_NUM = (COUNT(*) / 2) + 1)) / 2, 4)
             END
  FROM  CTE;




/* Example for even rocrd length 
WITH CTE AS (
    SELECT  LAT_N
            ,ROW_NUMBER() OVER(ORDER BY LAT_N DESC) AS ROW_NUM
      FROM  (SELECT  *
               FROM  STATION
             UNION ALL
             SELECT 500, 'ABC', 'DEF', 930.608, 132.411) AS A
)
SELECT  CASE WHEN COUNT(*) % 2 != 0 THEN (SELECT  ROUND(LAT_N, 4)
                                            FROM  CTE
                                           WHERE  ROW_NUM = CEIL(COUNT(*) / 2))
             ELSE ROUND(((SELECT  LAT_N
                            FROM  CTE
                           WHERE  ROW_NUM = COUNT(*) / 2)
                        +
                         (SELECT  LAT_N
                            FROM  CTE
                           WHERE  ROW_NUM = (COUNT(*) / 2) + 1)) / 2, 4)
             END
  FROM  CTE