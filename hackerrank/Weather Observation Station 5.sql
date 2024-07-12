/*
- UNION 또는 UNION ALL 시행 시 각 쿼리에 LIMIT와 ODER BY 직접 사용 불가
- 각 쿼리를 서브쿼리로 감싸면 가능
*/

SELECT  CITY
        ,LENGTH(CITY)
  FROM  (SELECT  CITY
                 ,LENGTH(CITY)
           FROM  STATION
          WHERE  LENGTH(CITY) = (SELECT  MIN(LENGTH(CITY))
                                FROM  STATION)
          ORDER
             BY  CITY ASC
          LIMIT  1) AS SHORTEST_CITY

UNION ALL

SELECT  CITY
        ,LENGTH(CITY)
  FROM  (SELECT  CITY
                 ,LENGTH(CITY)
           FROM  STATION
          WHERE  LENGTH(CITY) = (SELECT  MAX(LENGTH(CITY))
                                    FROM  STATION)
          ORDER
             BY  CITY ASC
          LIMIT  1) AS LONGEST_CITY;