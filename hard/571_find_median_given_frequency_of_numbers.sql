WITH RECURSIVE decompressed_numbers as (
    SELECT num, frequency, 1 AS counter
    FROM Numbers
    WHERE frequency > 0
        UNION
    SELECT num, frequency, counter + 1
    FROM decompressed_numbers
    WHERE counter < frequency
), 
decompressed_and_row_numbered_numbers as (
    SELECT num, ROW_NUMBER() OVER(ORDER BY num) rn
    FROM decompressed_numbers
)
SELECT AVG(num) median
FROM decompressed_and_row_numbered_numbers
WHERE rn IN (FLOOR(((SELECT COUNT(1) FROM decompressed_and_row_numbered_numbers)+1)/2),
             FLOOR(((SELECT COUNT(1) FROM decompressed_and_row_numbered_numbers)+2)/2))
