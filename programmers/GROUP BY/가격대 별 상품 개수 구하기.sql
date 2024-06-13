SELECT  CONCAT(PRICE DIV 10000, '0000') AS PRICE_GROUP
        ,COUNT(PRODUCT_ID) AS PRODUCTS
  FROM  PRODUCT
 GROUP
    BY  PRICE DIV 10000
 ORDER
    BY  PRICE DIV 10000 ASC;