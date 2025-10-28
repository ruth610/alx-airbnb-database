-- These are columns commonly used in WHERE, JOIN, and ORDER BY clauses

-- Index on Users.email (used in login checks and joins)
CREATE INDEX idx_users_email ON Users(email);

-- Index on Bookings.user_id (used in joins between Users and Bookings)
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);

-- Index on Bookings.property_id (used in joins between Bookings and Properties)
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);

-- Index on Properties.location (used in search filters)
CREATE INDEX idx_properties_location ON Properties(location);

-- Index on Bookings.booking_date (used in date range filters or ordering)
CREATE INDEX idx_bookings_booking_date ON Bookings(booking_date);

EXPLAIN ANALYZE
SELECT u.name, COUNT(b.id) AS total_bookings
FROM Users u
JOIN Bookings b ON u.id = b.user_id
GROUP BY u.name;

