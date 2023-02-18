WITH ranking AS (
    SELECT *, 
        ROW_NUMBER() OVER (
            PARTITION BY company
            ORDER BY salary DESC, id DESC
        ) rn
    FROM Employee
),
even_and_odd_ranks AS (
    SELECT company, CEIL(COUNT(1)/2) AS median_rank
    FROM Employee
    GROUP BY company
        UNION
    SELECT company, COUNT(1)/2+1 AS median_rank
    FROM Employee
    GROUP BY company
    HAVING MOD(COUNT(1), 2) = 0
)
SELECT id, company, salary
FROM ranking r
WHERE r.rn in (
    SELECT eo.median_rank
    FROM even_and_odd_ranks eo
    WHERE r.company = eo.company
)
