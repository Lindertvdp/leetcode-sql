select name as Customers
from (
    select c.name, sum(case when o.id is null then 1 else 0 end) as null_count
    from Customers c
    left join Orders o on o.customerId = c.id
    group by c.id
    having count(1) = null_count
) as temp
