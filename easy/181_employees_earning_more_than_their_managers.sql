select e.name as Employee
from employee e
join employee manager on e.managerId = manager.id
where e.salary > manager.salary
