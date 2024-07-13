/*
삼각형의 불등식
1. 두 변의 합이 나머지 한 변보다 커야 한다.
2. 이를 모든 조합에 적용 가능해야 한다.
즉, 변 a, b, c가 주어졌을 때 삼각형이 되기 위한 조건은:
(a + b > c) AND (b + c > a) AND (c + a > b)
*/

SELECT  CASE WHEN (A + B <= C) OR (B + C <= A) OR (C + A <= B) THEN 'Not A Triangle'
             WHEN (A = B) AND (B = C) THEN 'Equilateral'
             WHEN (A = B) OR (B = C) OR (C = A) THEN 'Isosceles'
             WHEN (A != B) AND (B != C) AND (C != A) THEN 'Scalene'
              END
  FROM  TRIANGLES;