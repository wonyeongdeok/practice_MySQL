/*
비트 연산자 & 사용 시 WHERE 절의 서브 쿼리는 단일 행을 반환해야 함
그러므로 CODE가 'Python'이거나 'C#'인 경우를 OR 논리 연산자를 사용하여 구함
*/

SELECT  ID
        ,EMAIL
        ,FIRST_NAME
        ,LAST_NAME
  FROM  DEVELOPERS
 WHERE  SKILL_CODE & (SELECT  CODE
                        FROM  SKILLCODES
                       WHERE  NAME = 'Python')
    OR  SKILL_CODE & (SELECT  CODE
                        FROM  SKILLCODES
                       WHERE  NAME = 'C#')
 ORDER
    BY  ID ASC;