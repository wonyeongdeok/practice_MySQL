/*
GROUP_CONCAT(COLUMN_NAME)
- 특정 그룹 내에서 여러 행의 값을 하나의 문자열로 연결
- 기본적으로 쉼표로 구분 되며 GROUP_CONCAT(COLUMN_NAME SEPARATOR '|')와 같이 구분자 변경 가능
*/
SELECT  CASE
            WHEN GROUP_CONCAT(A.NAME) LIKE '%Python%' AND
                 GROUP_CONCAT(CATEGORY) LIKE '%Front End%' THEN 'A'
            WHEN GROUP_CONCAT(A.NAME) LIKE '%C#%' THEN 'B'
            WHEN GROUP_CONCAT(CATEGORY) LIKE '%Front End%' THEN 'C'
         END AS GRADE
         ,B.ID
         ,MAX(B.EMAIL) AS EMAIL
  FROM  SKILLCODES AS A
 INNER
  JOIN  DEVELOPERS AS B
    ON  A.CODE & B. SKILL_CODE
 GROUP
    BY  B.ID
HAVING  GRADE IS NOT NULL
 ORDER
    BY  GRADE ASC
        ,B.ID ASC;