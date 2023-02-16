select temp_1.stock_name, sum(- (temp_1.price - temp_2.price)) as capital_gain_loss
from (
    select *, rank() over(partition by stock_name order by operation_day) as rn
    from Stocks
    order by stock_name, operation_day
) as temp_1 
join (
    select *, rank() over(partition by stock_name order by operation_day) as rn
    from Stocks
    order by stock_name, operation_day
) as temp_2
on temp_1.stock_name = temp_2.stock_name
and temp_2.rn = temp_1.rn + 1 
where mod(temp_1.rn, 2) = 1
group by temp_1.stock_name
