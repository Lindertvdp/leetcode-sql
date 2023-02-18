SELECT trip.request_at AS Day,
ROUND(SUM(CASE WHEN trip.status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1 ELSE 0 END)/COUNT(1), 2) AS 'Cancellation Rate'
FROM Trips trip
INNER JOIN Users client ON client.users_id = trip.client_id
INNER JOIN Users driver ON driver.users_id = trip.driver_id
WHERE client.banned = 'No' AND driver.banned = 'No'
AND trip.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY trip.request_at
