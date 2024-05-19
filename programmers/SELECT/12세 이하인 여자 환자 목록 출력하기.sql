-- 일반함수 IFNULL(A, B) : A가 NULL이면 B를 반환, A가 NULL이 아니면 A를 반환

SELECT PT_NAME,
       PT_NO,
       GEND_CD,
       AGE,
       IFNULL(TLNO, 'NONE') AS TLNO
FROM   PATIENT
WHERE  AGE <= 12
       AND GEND_CD = 'W'
ORDER
   BY  AGE DESC,
       PT_NAME ASC
