# Partitioning Performance Report

## 1. Objective
Implement table partitioning on the Bookings table based on the `start_date` column to optimize queries on large datasets.

---

## 2. Partitioning Approach
- Created a **range-partitioned table** `bookings_partitioned` based on `start_date`.
- Created partitions for each year (`bookings_2024`, `bookings_2025`).
- Copied existing data from `bookings` into the partitioned table.

**Benefits of partitioning:**
- Queries scanning by date range only touch the relevant partition.
- Reduces I/O and improves query execution time for large datasets.

---

## 3. Performance Testing

### Query: Fetch all bookings for 2025

```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings_partitioned
WHERE start_date >= '2025-01-01' AND start_date < '2026-01-01';
