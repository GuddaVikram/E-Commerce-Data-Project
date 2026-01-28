## 📊 Source Dataset Overview

### 🌍 Geolocation Dataset
- Contains the latitude and longitude of ZIP codes.
- ZIP codes are referenced by both the customers and sellers datasets.

---

### 👤 Customers Dataset
- `customer_id` is a unique identifier for each order.
- Each order is associated with a unique `customer_id`.
- `customer_unique_id` uniquely identifies an individual customer and may appear across multiple orders.

---

### 🧑‍💼 Sellers Dataset
- `seller_id` is the unique identifier for each seller.

---

### 📦 Products Dataset
- `product_id` is the unique key.
- Contains detailed information about each product.

---

### 🛒 Orders Dataset
- `order_id` is the unique identifier for each order.
- Each order is associated with a `customer_id`.
- `order_status` represents the current state of the order, such as:
  - `delivered`
  - `shipped`
  - `processing`
  - `invoiced`

---

### 📦 Order Items Dataset
- No single column uniquely identifies a record.
- The composite key (`order_id`, `order_item_id`) uniquely identifies each item.
- Contains information about:
  - Items purchased within an order
  - Item price
  - Freight value

---

### 💳 Order Payments Dataset
- The combination of (`order_id`, `payment_sequential`) forms a unique key.
- Customers can pay for a single order using multiple payment methods.
- `payment_type` indicates the method of payment (e.g., credit card, debit card, etc.).

---

## 🧱 Raw Layer (PostgreSQL)

- Created RAW tables in PostgreSQL for each source dataset.
- Loaded raw CSV files directly into PostgreSQL tables without applying any transformations.
- This layer preserves source-level data integrity and acts as the foundation for downstream transformation layers.
