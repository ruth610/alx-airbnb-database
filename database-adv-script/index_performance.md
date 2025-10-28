# 🧠 Index Performance Analysis

## 🎯 Objective
Identify and create indexes to improve query performance on the **User**, **Booking**, and **Property** tables.  
Measure query performance **before and after** adding indexes using `EXPLAIN` or `ANALYZE`.

---

## 🧩 1. Identifying High-Usage Columns

| Table | Column | Reason |
|--------|---------|--------|
| `users` | `email` | Used in `WHERE` for login and lookup |
| `users` | `role` | Used for filtering by user role |
| `properties` | `host_id` | Used in `JOIN` with users |
| `properties` | `location` | Used for search and filter |
| `bookings` | `user_id` | Used in `JOIN` with users |
| `bookings` | `property_id` | Used in `JOIN` with properties |
| `bookings` | `status` | Used in `WHERE` to filter booking status |

---

## ⚙️ 2. SQL Commands: CREATE INDEX

Below are the exact SQL commands used to create indexes for high-usage columns.

```sql
-- ======================================
