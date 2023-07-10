SELECT a.title,
       a.board_id,
       b.reply_id,
       b.writer_id,
       b.contents,
       Date_format(b.created_date, '%Y-%m-%d') AS created_date
FROM   used_goods_board a
       RIGHT JOIN used_goods_reply b
               ON a.board_id = b.board_id
WHERE  Date_format(a.created_date, '%Y-%m') = '2022-10'
ORDER  BY created_date ASC,
          a.title ASC;