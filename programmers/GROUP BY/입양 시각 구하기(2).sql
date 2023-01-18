SET @hour := -1;

SELECT ( @hour := @hour + 1 )          hour,
       (SELECT Count(*)
        FROM   animal_outs
        WHERE  Hour(datetime) = @hour) count
FROM   animal_outs
WHERE  @hour < 23 