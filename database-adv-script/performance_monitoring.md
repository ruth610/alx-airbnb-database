# Database Performance Monitoring Report

## 1. Objective
Continuously monitor and refine database performance by analyzing query execution plans and implementing schema adjustments to improve efficiency.

---

## 2. Queries Monitored

### Query 1: Fetch all bookings for a specific user
```sql
EXPLAIN ANALYZE
SELECT b.id, b.start_date, b.end_date, b.total_price, p.name AS property_name
FROM bookings_partitioned b
JOIN properties p ON b.property_id = p.id
WHERE b.user_id = 'some-user-uuid'
ORDER BY b.start_date DESC;
