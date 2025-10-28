# Query Optimization Report

## 1. Objective
To analyze and optimize a complex query that retrieves all bookings along with their user, property, and payment details.

---

## 2. Initial Query

The original query joined **four tables** (Bookings, Users, Properties, Payments) and selected **all columns**.

```sql
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
