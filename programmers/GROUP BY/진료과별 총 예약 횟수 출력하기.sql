SELECT mcdp_cd  '진료과코드',
       Count(*) '5월예약건수'
FROM   appointment
WHERE  Date_format(apnt_ymd, '%Y-%m') = '2022-05'
GROUP  BY mcdp_cd
ORDER  BY Count(*),
          mcdp_cd 