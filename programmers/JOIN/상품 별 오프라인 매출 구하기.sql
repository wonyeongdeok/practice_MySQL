SELECT a.product_code,
       Sum(a.price * b.sales_amount) sales
FROM   product a
       RIGHT JOIN offline_sale b
               ON a.product_id = b.product_id
GROUP  BY a.product_code
ORDER  BY sales DESC,
          a.product_code
/*
a.product_code에 대해 GROUP BY를 했기 때문에 두번째 줄에서 Sum을 해줘야함
그렇지 않으면 합산된 결과가 안 나오고 a.product_code 그룹 중 첫번째 줄에 대한 a.price * b.sales_amount만 출력됨
*/