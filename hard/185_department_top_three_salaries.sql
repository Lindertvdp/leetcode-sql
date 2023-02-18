select temp.Department, temp.Employee, temp.Salary
from (
    select d.name as Department, e.name as Employee, e.salary as Salary, dense_rank() over(partition by d.id order by e.salary desc) n
    from Employee e
    join Department d on d.id = e.departmentId
) as temp
where temp.n <= 3
