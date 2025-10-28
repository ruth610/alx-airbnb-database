SELECT bookings.*, users.*
FROM bookings 
INNER JOIN users on bookings.user_id = users.user_id;

SELECT properties.*
FROM properties
LEFT JOIN reviews on properties.property_id = reviews.property_id;

SELECT users.*, bookings.*
FROM users
FULL OUTER JOIN bookings on users.user_id = bookings.user_id;
