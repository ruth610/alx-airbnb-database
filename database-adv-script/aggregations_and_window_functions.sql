SELECT
    property_id,
    COUNT(booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(booking_id) DESC) AS booking_rank,
    ROW_NUMBER() OVER (ORDER BY COUNT(booking_id) DESC) AS row_number
FROM bookings
GROUP BY property_id
ORDER BY booking_rank;
