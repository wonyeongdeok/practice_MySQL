/*
MySQL 버전이나 설정에 따라
GROUP BY 절에서 수식으로 그룹화 하고
HAVING 절에서 같은 수식 사용 시 인식 못하는 경우 있으므로
수식을 활용하여 그룹화 필요 시 FROM 절에서 서브쿼리 사용할 것
*/

SELECT  TOTAL_SALARY
        ,COUNT(*)
  FROM  (SELECT  *
                 ,MONTHS * SALARY AS TOTAL_SALARY
           FROM  EMPLOYEE) AS A
 GROUP
    BY  TOTAL_SALARY
HAVING  TOTAL_SALARY = (SELECT  MAX(MONTHS * SALARY)
                          FROM  EMPLOYEE);