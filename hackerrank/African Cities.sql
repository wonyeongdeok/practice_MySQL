SELECT  A.NAME
  FROM  CITY AS A
  LEFT
  JOIN  COUNTRY AS B
    ON  A.COUNTRYCODE = B.CODE
 WHERE  B.CONTINENT = 'Africa';