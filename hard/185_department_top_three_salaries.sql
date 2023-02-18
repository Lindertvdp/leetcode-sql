SELECT temp.Department, temp.Employee, temp.Salary
FROM (
    SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary, DENSE_RANK() OVER(PARTITION BY d.id ORDER BY e.salary DESC) n
    FROM Employee e
    JOIN Department d ON d.id = e.departmentId
) AS temp
WHERE temp.n <= 3
