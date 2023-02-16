select d.name as Department, e.name as Employee, e.salary as Salary
from Employee e
join Department d on d.id = e.departmentId
where e.salary = (
    select max(salary)
    from Employee
    where d.id = departmentId
    group by departmentId
)
