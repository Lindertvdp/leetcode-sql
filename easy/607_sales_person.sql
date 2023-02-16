select name
from SalesPerson
where sales_id not in (
    select distinct s.sales_id
    from Orders o
    join Company c on c.com_id = o.com_id
    join SalesPerson s on s.sales_id = o.sales_id
    where c.name = RED
)
