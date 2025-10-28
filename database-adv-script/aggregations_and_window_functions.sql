SELECT 
    user_id, 
    COUNT(booking_id) AS total_bookings
FROM bookings
GROUP BY user_id;

SELECT 
    property_id,
    COUNT(booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(booking_id) DESC) AS booking_rank
FROM bookings
GROUP BY property_id;
