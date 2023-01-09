SELECT book_id, DATE_FORMAT(published_date, '%Y-%m-%d') AS published_date
FROM book
WHERE DATE_FORMAT(published_date, '%Y')='2021' AND
      category='인문'