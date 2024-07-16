/*
- IN 연산자는 지정된 목록 내에 값이 존재하는지 확인하는 데 사용
- 만약 지정된 목록에 NULL이 포함된 경우 예상치 못한 방식으로 동작하므로 NULL 처리 필수
*/

SELECT  N
        ,CASE WHEN P IS NULL THEN 'Root'
              WHEN N NOT IN (SELECT  P
                               FROM  BST
                              WHERE  P IS NOT NULL) THEN 'Leaf'
              ELSE 'Inner'
              END
  FROM  BST
 ORDER
    BY  N ASC;