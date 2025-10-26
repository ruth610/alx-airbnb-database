# Airbnb Database Normalization

## 🎯 Objective
The goal of this document is to review the Airbnb database schema, identify any potential redundancy or violations of normalization principles, and ensure the database is normalized to **Third Normal Form (3NF)**.

---

## 🧩 Step 1: First Normal Form (1NF)

**Definition:**  
A table is in 1NF if all its columns contain atomic (indivisible) values, and each record is unique.

**Verification:**
- All tables (`User`, `Property`, `Booking`, `Payment`, `Review`, `Message`) have primary keys.
- All attributes contain atomic values (no repeating groups or arrays).

✅ **All tables satisfy 1NF.**

---

## 🧮 Step 2: Second Normal Form (2NF)

**Definition:**  
A table is in 2NF if it is in 1NF and all non-key attributes depend on the entire primary key (no partial dependencies).

**Verification:**
- Every table has a single-column primary key (UUID), so no composite key exists.
- Therefore, there are no partial dependencies.

 **All tables satisfy 2NF.**

---

## 🧱 Step 3: Third Normal Form (3NF)

**Definition:**  
A table is in 3NF if it is in 2NF and all attributes depend only on the primary key (no transitive dependencies).

**Review by Table:**

| Table | Finding | Status |
|--------|----------|---------|
| **User** | All attributes depend on `user_id`
| **Property** | All attributes depend on `property_id
| **Booking** | `total_price` depends indirectly on property price; it’s a derived 
| **Payment** | All attributes depend on `payment_id` 
| **Review** | All attributes depend on `review_id`
| **Message** | All attributes depend on `message_id`

---

## 🧠 Conclusion

The Airbnb database design is **fully normalized to 3NF** with a minor exception in the `Booking` table, where `total_price` is a **derived attribute**.

- This is acceptable as a **denormalization optimization** to improve query performance.
- All relationships are properly defined with **foreign keys** and **no redundancy** across tables.

✅ **Final Database State:** **Third Normal Form (3NF) Achieved**

---
