SELECT id, month, coalesce(s1, 0) + coalesce(s2, 0) + coalesce(s3, 0) as salary
FROM (
    SELECT last.id, last.month, first.salary s1, middle.salary s2, last.salary s3
    FROM Employee last
    LEFT JOIN Employee middle ON middle.id = last.id AND middle.month = last.month - 1
    LEFT JOIN Employee first ON first.id = last.id AND first.month = last.month - 2
    WHERE last.month != (SELECT MAX(month) FROM Employee e WHERE e.id = last.id)
    ORDER BY id, month desc
) as temp
