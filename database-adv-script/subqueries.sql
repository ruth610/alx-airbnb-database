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

SELECT users.*
FROM users
INNER JOIN 
    ( SELECT user_id, COUNT(*) as count_user
        FROM bookings 
        GROUP BY user_id
    )
    users_counting ON users.user_id = users_counting.user_id
WHERE users_counting.count_user > 3;