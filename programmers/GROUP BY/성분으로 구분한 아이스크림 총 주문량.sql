SELECT  INGREDIENT_TYPE
        ,SUM(TOTAL_ORDER) AS TOTAL_ORDER
  FROM  FIRST_HALF AS A
  LEFT
  JOIN  ICECREAM_INFO AS B
    ON  A.FLAVOR = B.FLAVOR
 GROUP
    BY  INGREDIENT_TYPE
 ORDER
    BY  SUM(TOTAL_ORDER) ASC;