README.md-- Insert sample users
INSERT INTO users (user_id, first_name, last_name, email, phone, created_at)
VALUES
(1, 'Ruth', 'Ambaw', 'ruth@example.com', '+251911111111', NOW()),
(2, 'Kal', 'Mekonnen', 'kal@example.com', '+251922222222', NOW()),
(3, 'Eden', 'Tadesse', 'eden@example.com', '+251933333333', NOW());

-- Insert sample properties
INSERT INTO properties (property_id, user_id, title, description, address, city, price_per_night, created_at)
VALUES
(1, 1, 'Cozy Apartment in Addis Ababa', 'Beautiful 2-bedroom apartment in Bole.', 'Bole Road', 'Addis Ababa', 80.00, NOW()),
(2, 2, 'Modern Studio near Meskel Square', 'Fully furnished studio with fast Wi-Fi.', 'Meskel Ave', 'Addis Ababa', 60.00, NOW()),
(3, 1, 'Lakeside Cottage in Bahir Dar', 'Peaceful lakeside view with free breakfast.', 'Lake Tana Rd', 'Bahir Dar', 120.00, NOW());

-- Insert sample bookings
INSERT INTO bookings (booking_id, user_id, property_id, check_in, check_out, status, total_amount, created_at)
VALUES
(1, 3, 1, '2025-11-10', '2025-11-15', 'confirmed', 400.00, NOW()),
(2, 2, 3, '2025-12-01', '2025-12-05', 'pending', 480.00, NOW()),
(3, 1, 2, '2025-11-05', '2025-11-08', 'canceled', 180.00, NOW());

-- Insert sample payments
INSERT INTO payments (payment_id, booking_id, amount, method, status, paid_at)
VALUES
(1, 1, 400.00, 'credit_card', 'completed', NOW()),
(2, 2, 480.00, 'paypal', 'pending', NULL),
(3, 3, 180.00, 'telebirr', 'refunded', '2025-11-06');
