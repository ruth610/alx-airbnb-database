SELECT bookings.*, users.*
FROM bookings 
INNER JOIN users on bookings.user_id = users.user_id;

SELECT p.*, r.*
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id;

SELECT users.*, bookings.*
FROM users
FULL OUTER JOIN bookings on users.user_id = bookings.user_id;
