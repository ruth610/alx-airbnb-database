# 🗃️ SQL JOIN Practice – PostgreSQL

This project demonstrates different types of **JOIN operations** in PostgreSQL. Each query shows how data from multiple tables can be combined to retrieve meaningful information.

## 📚 Queries Overview

### 1. LEFT JOIN
Retrieves all properties and their reviews, including properties that have no reviews.

```sql
SELECT *
FROM properties
LEFT JOIN reviews ON properties.property_id = reviews.property_id;

## Retrieves all bookings along with the users who made those bookings.
```sql
SELECT bookings.*, users.*
FROM bookings
INNER JOIN users ON bookings.user_id = users.user_id;

### 3. RIGHT JOIN
Fetches all reviews and their associated properties, including reviews that are not linked to any property.

```sql
SELECT users.*, bookings.*
FROM users
FULL OUTER JOIN bookings ON users.user_id = bookings.user_id;
