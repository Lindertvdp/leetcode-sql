select id,case 
            when id = (select id 
                       from Tree 
                       where p_id is null) 
                then Root 
            when p_id is not null 
                      and (select count(1) 
                           from Tree t2 
                           where t2.p_id = t1.id) > 0 
                then Inner
            else Leaf
          end as type
from Tree t1
