
EXPLAIN ANALYZE
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
JOIN Payments pay ON b.id = pay.booking_id
WHERE pay.status = 'Completed'
AND p.location IS NOT NULL
ORDER BY b.booking_date DESC;

-- Create indexes (run only once):
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON Bookings(user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON Bookings(property_id);
CREATE INDEX IF NOT EXISTS idx_payments_booking_id ON Payments(booking_id);
CREATE INDEX IF NOT EXISTS idx_payments_status ON Payments(status);
CREATE INDEX IF NOT EXISTS idx_properties_location ON Properties(location);

-- ===========================================
-- STEP 3: Optimized Query (After Indexing)
-- ===========================================

EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount AS payment_amount,
    b.booking_date
FROM Bookings b
JOIN Users u ON b.user_id = u.id
JOIN Properties p ON b.property_id = p.id
LEFT JOIN Payments pay ON b.id = pay.booking_id
WHERE pay.status = 'Completed'
AND p.location = 'Addis Ababa'
ORDER BY b.booking_date DESC;
