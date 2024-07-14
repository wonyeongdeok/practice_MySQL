-- [SOL 1]
WITH RECURSIVE CTE AS (
    SELECT  1 AS N
    UNION ALL
    SELECT  N + 1
      FROM  CTE
     WHERE  N < 20
)
SELECT  REPEAT('* ', N)
  FROM  CTE;

-- [SOL 2]
SET @N = 0;
SELECT  REPEAT('* ', @N := @N + 1)
  FROM  INFORMATION_SCHEMA.TABLES
 WHERE  @N < 20;