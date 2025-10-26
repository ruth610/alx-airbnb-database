# 🏠 ALX Airbnb Database Project

## 📘 Overview

This project is part of the ALX Software Engineering program.  
It focuses on designing and implementing the **database schema** for an **Airbnb clone** application.

The goal is to:
- Identify key entities and relationships.
- Create a normalized database design (up to **Third Normal Form**).
- Generate an **Entity-Relationship Diagram (ERD)**.
- Write the corresponding **SQL `CREATE TABLE`** statements with proper constraints and indexing.

---

## 🧠 Database Entities

The database consists of six main entities:

1. **User**
2. **Property**
3. **Booking**
4. **Payment**
5. **Review**
6. **Message**

Each table is linked using foreign key constraints to maintain **referential integrity** and ensure **data consistency**.

---

## 🧩 Entity Relationships (Summary)

| Relationship | Description |
|---------------|--------------|
| User → Property | A host (user) can own multiple properties. |
| User → Booking | A user can make multiple bookings. |
| Property → Booking | A property can have many bookings. |
| Booking → Payment | Each booking can have one payment. |
| Property → Review | A property can have multiple reviews. |
| User → Message | Users can send and receive messages. |

---

## ⚙️ Normalization

The database is normalized up to **Third Normal Form (3NF)**.

- All attributes are atomic (1NF).
- No partial dependencies (2NF).
- No transitive dependencies (3NF).
- `total_price` in `Booking` is a derived field retained for performance optimization.

Detailed normalization analysis can be found in:  
📄 [`normalization.md`](../normalization.md)

---

## 🧱 SQL Schema

The SQL file defines all database tables, relationships, constraints, and indexes.

📄 [`schema.sql`](./schema.sql)

### Includes:
- **Primary keys** using `UUID`
- **Foreign key constraints** with `ON DELETE CASCADE`
- **Check constraints** for roles, status, ratings, and payment methods
- **Indexes** on commonly queried columns for performance optimization

---

## 📊 ER Diagram

The ERD visually represents all entities and their relationships.

- Created using **dbdiagram.io** / **Draw.io**
- Shows one-to-many and many-to-one relationships
- File location:  
  📄 [`ERD/requirements.md`](../ERD/requirements.md)  
  🖼️ [`ERD/ERD.png`](../ERD/ERD.png)



