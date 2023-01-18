SELECT a.category   category,
       Sum(b.sales) total_sales
FROM   book a
       RIGHT JOIN book_sales b
               ON a.book_id = b.book_id
WHERE  Date_format(b.sales_date, '%Y-%m') = '2022-01'
GROUP  BY category
ORDER  BY category 