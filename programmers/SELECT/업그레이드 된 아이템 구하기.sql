    SELECT  A.ITEM_ID
        ,B.ITEM_NAME
        ,B.RARITY
  FROM  ITEM_TREE AS A
 INNER  
  JOIN  ITEM_INFO AS B
    ON  A.ITEM_ID=B.ITEM_ID
 WHERE  PARENT_ITEM_ID IN (SELECT  ITEM_ID
                             FROM  ITEM_INFO
                            WHERE  RARITY='RARE')
 ORDER
    BY  A.ITEM_ID DESC;