SELECT  A.EMP_NO
        ,A.EMP_NAME
        ,CASE WHEN AVG(B.SCORE) >= 96 THEN 'S'
              WHEN AVG(B.SCORE) >= 90 THEN 'A'
              WHEN AVG(B.SCORE) >= 80 THEN 'B'
              ELSE 'C' END AS GRADE
        ,CASE WHEN AVG(B.SCORE) >= 96 THEN A.SAL * 0.2
              WHEN AVG(B.SCORE) >= 90 THEN A.SAL * 0.15
              WHEN AVG(B.SCORE) >= 80 THEN A.SAL * 0.1
              ELSE 0 END AS BONUS
  FROM  HR_EMPLOYEES AS A
 RIGHT
  JOIN  HR_GRADE AS B
    ON  A.EMP_NO = B.EMP_NO
 GROUP
    BY  A.EMP_NO
        ,A.EMP_NAME
 ORDER
    BY  A.EMP_NO ASC;