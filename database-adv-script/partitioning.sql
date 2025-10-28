-- ===========================================
-- STEP 1: Create Partitioned Bookings Table
-- ===========================================

-- 1. Create a new partitioned table
CREATE TABLE bookings_partitioned (
    booking_id UUID NOT NULL,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(10) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date)
) PARTITION BY RANGE (start_date);

-- 2. Create partitions by year
CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Add more partitions as needed...

-- 3. Copy existing data into partitioned table
INSERT INTO bookings_partitioned (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
SELECT booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at
FROM bookings;

-- 4. Test queries: Fetch bookings by date range
-- Example query for 2025 bookings
EXPLAIN ANALYZE
SELECT *
FROM bookings_partitioned
WHERE start_date >= '2025-01-01' AND start_date < '2026-01-01';

-- Example query: bookings for a user in 2025
EXPLAIN ANALYZE
SELECT *
FROM bookings_partitioned
WHERE user_id = 'some-user-uuid'
AND start_date >= '2025-01-01' AND start_date < '2026-01-01';
