delete to_delete
from Person to_delete, Person to_keep
where to_delete.email = to_keep.email
and to_delete.id > to_keep.id
