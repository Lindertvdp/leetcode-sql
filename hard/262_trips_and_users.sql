select trip.request_at as Day,
round(sum(case when trip.status in ('cancelled_by_driver', 'cancelled_by_client') then 1 else 0 end)/count(1), 2) as 'Cancellation Rate'
from Trips trip
join Users client on client.users_id = trip.client_id
join Users driver on driver.users_id = trip.driver_id
where client.banned = 'No' and driver.banned = 'No'
and trip.request_at between '2013-10-01' and '2013-10-03'
group by trip.request_at
