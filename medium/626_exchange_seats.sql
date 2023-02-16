select s1_id as id, case
                        when s2_id is null then s1_student
                        else s2_student
                    end as student
from (
    select s1.id as s1_id, s1.student as s1_student, s2.id as s2_id, s2.student as s2_student
    from Seat s1
    left join Seat s2 on s2.id = s1.id + 1
    where s1.id % 2 = 1
        union
    select *
    from Seat s1
    join Seat s2 on s2.id = s1.id - 1
    where s1.id % 2 = 0
    order by s1_id
) as temp_table
