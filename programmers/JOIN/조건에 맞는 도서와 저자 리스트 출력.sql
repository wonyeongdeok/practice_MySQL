SELECT a.book_id,
       b.author_name,
       Date_format(a.published_date, '%Y-%m-%d') published_date
FROM   book a
       LEFT JOIN author b
              ON a.author_id = b.author_id
WHERE  a.category = '경제'
ORDER  BY published_date 