-- ✅ Step 1: Initial Complex Query (Before Optimization)

-- This retrieves all bookings with user, property, and payment details
SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    u.email AS user_email,
    p.name AS property_name,
    p.location AS property_location,
    pay.amount AS payment_amount,
    pay.status AS payment_status,
    b.booking_date,
    b.check_in,
    b.check_out
FROM Bookings b
JOIN Users u ON b.user_id = u.id
JOIN Properties p ON b.property_id = p.id
JOIN Payments pay ON b.id = pay.booking_id;

SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount AS payment_amount,
    b.booking_date
FROM Bookings b
JOIN Users u ON b.user_id = u.id
JOIN Properties p ON b.property_id = p.id
LEFT JOIN Payments pay ON b.id = pay.booking_id;
