SELECT properties.* 
from properties
INNER JOIN
    (
        SELECT property_id, AVG(rating) as average_rating
        from reviews
        GROUP BY property_id
    )
rating_avg ON properties.property_id = rating_avg.property_id
WHERE rating_avg.average_rating > 4.0;

SELECT *
FROM users
WHERE (
    SELECT COUNT(*)
    FROM bookings 
    WHERE bookings.user_id = users.user_id
) > 3;
