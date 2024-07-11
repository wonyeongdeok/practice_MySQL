SELECT  B.APNT_NO
        ,A.PT_NAME
        ,A.PT_NO
        ,C.MCDP_CD
        ,C.DR_NAME
        ,B.APNT_YMD
  FROM  PATIENT AS A
 RIGHT
  JOIN  APPOINTMENT AS B
    ON  A.PT_NO = B.PT_NO
  LEFT
  JOIN  DOCTOR AS C
    ON  B.MDDR_ID = C.DR_ID
 WHERE  DATE_FORMAT(B.APNT_YMD, '%Y-%m-%d') = '2022-04-13'
   AND  B.APNT_CNCL_YN = 'N'
   AND  C.MCDP_CD = 'CS'
 ORDER
    BY  B.APNT_YMD ASC;