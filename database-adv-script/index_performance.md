# 🧠 Index Performance Analysis

## 🎯 Objective
Identify and create indexes to improve query performance on the **User**, **Booking**, and **Property** tables.  
Measure query performance **before and after** adding indexes using `EXPLAIN` or `ANALYZE`.

---

## 🧩 1. Identifying High-Usage Columns

Based on the database design, the following columns are frequently used in:
- **WHERE** clauses (filtering)
- **JOIN** conditions (relationships)
- **ORDER BY** clauses (sorting)

| Table | Column | Usage | Reason |
|--------|---------|--------|--------|
| `users` | `email` | WHERE | Used frequently for login and user search |
| `users` | `role` | WHERE | Filtering users by their role (guest, host, admin) |
| `properties` | `host_id` | JOIN | Used to join `properties` and `users` tables |
| `properties` | `location` | WHERE | Filtering or searching by city/region |
| `bookings` | `user_id` | JOIN | Used to join `bookings` and `users` tables |
| `bookings` | `property_id` | JOIN | Used to join `bookings` and `properties` tables |
| `bookings` | `status` | WHERE | Filtering bookings (confirmed, canceled, pending) |

---

## ⚙️ 2. Creating Indexes

The following SQL commands create indexes for the identified high-usage columns.

```sql
-- Users Table
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_role ON users(role);

-- Properties Table
CREATE INDEX idx_properties_host_id ON properties(host_id);
CREATE INDEX idx_properties_location ON properties(location);

-- Bookings Table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_status ON bookings(status);

EXPLAIN ANALYZE
SELECT * FROM bookings WHERE status = 'confirmed';

EXPLAIN ANALYZE
SELECT * FROM bookings WHERE status = 'confirmed';
