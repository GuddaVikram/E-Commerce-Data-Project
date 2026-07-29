# 🛒 Production-Grade Ecommerce Analytics Platform

A production-oriented end-to-end Data Engineering project that transforms raw ecommerce data into a scalable analytics platform using modern ELT practices.

This project demonstrates how a Data Engineer designs, builds, tests, and documents a complete analytics warehouse using PostgreSQL and dbt while following software engineering best practices.

---

# 📖 Project Overview

The objective of this project is to simulate how modern organizations build analytical data platforms.

The pipeline ingests raw ecommerce datasets into PostgreSQL, transforms them into clean and validated staging models, builds a dimensional warehouse using a Star Schema, and creates business-ready metrics that can be consumed by BI tools.

Unlike tutorial projects, this implementation focuses on production concepts including:

* Layered warehouse architecture
* Data quality contracts
* Star schema modeling
* Surrogate keys
* Incremental processing
* Modular SQL using dbt Jinja macros
* Reusable business metrics

---

# 🏗️ Architecture

```text
                    Source CSV Files
                           │
                           ▼
                  PostgreSQL (RAW Layer)
                           │
                           ▼
                dbt Staging Models (Views)
                           │
                           ▼
             Dimensional Models (Star Schema)
               ├── Dimension Tables
               └── Fact Tables
                           │
                           ▼
                Business Metrics Layer
                           │
                           ▼
             Power BI / Metabase / Looker
```

---

# 🛠️ Tech Stack

| Component                    | Technology          |
| ---------------------------- | ------------------- |
| Programming                  | SQL, Jinja          |
| Database                     | PostgreSQL          |
| Transformation               | dbt Core            |
| Data Modeling                | Star Schema         |
| Testing                      | dbt Tests           |
| Version Control              | Git & GitHub        |
| Containerization *(planned)* | Docker              |
| Orchestration *(planned)*    | Dagster             |
| Visualization *(planned)*    | Power BI / Metabase |

---

# 📂 Project Structure

```text
ecommerce_dbt/

├── models/
│   ├── staging/
│   │   ├── stg_customers.sql
│   │   ├── stg_orders.sql
│   │   ├── stg_order_items.sql
│   │   ├── stg_products.sql
│   │   ├── stg_sellers.sql
│   │   ├── stg_payments.sql
│   │   └── schema.yml
│   │
│   └── marts/
│       ├── core/
│       │   ├── dim_customers.sql
│       │   ├── dim_products.sql
│       │   ├── dim_sellers.sql
│       │   ├── fact_orders.sql
│       │   ├── fact_order_items.sql
│       │   └── schema.yml
│       │
│       └── metrics/
│           ├── revenue/
│           ├── customer/
│           ├── product/
│           └── operations/
│
├── macros/
├── tests/
├── snapshots/
├── analyses/
├── seeds/
├── dbt_project.yml
└── README.md
```

---

# 🗄️ Data Warehouse Architecture

## RAW Layer

The raw layer stores an unmodified copy of the source datasets.

Tables include:

* Customers
* Orders
* Order Items
* Products
* Sellers
* Payments
* Geolocation

No transformations are performed in this layer.

---

## STAGING Layer

The staging layer standardizes source data before it is consumed downstream.

Implemented transformations include:

* Column renaming
* Data type casting
* String trimming
* Lowercasing
* Null handling
* Standardized timestamps
* Data quality validation

This layer acts as the data contract between source systems and analytical models.

---

## MARTS Layer

The marts layer contains business-ready analytical models.

### Dimension Tables

* dim_customers
* dim_products
* dim_sellers

Dimension tables contain descriptive attributes used for reporting.

---

### Fact Tables

* fact_orders
* fact_order_items

Fact tables contain measurable business events and reference dimensions using surrogate keys.

---

# ⭐ Star Schema

```text
                 dim_customers
                        │
                        │
dim_products ─── fact_order_items ─── dim_sellers
                        │
                        │
                  fact_orders
```

---

# 🔑 Surrogate Keys

The project replaces natural business keys with surrogate keys inside the warehouse.

Example:

```
customer_id
        │
        ▼
customer_sk
```

Benefits include:

* Stable joins
* Better warehouse performance
* Support for Slowly Changing Dimensions
* Consistent warehouse modeling

---

# ⚡ Incremental Processing

Large fact tables are materialized incrementally.

Benefits:

* Faster pipeline execution
* Lower compute cost
* Better scalability
* Efficient handling of new data

---

# 🧪 Data Quality

Data quality is enforced using dbt tests.

Implemented validations include:

* Unique constraints
* Not Null checks
* Accepted Values
* Referential Integrity
* Source-to-model validation

These tests ensure the warehouse remains reliable for downstream analytics.

---

# 📈 Business Metrics

The metrics layer provides reusable business KPIs.

## Revenue

* Daily Revenue
* Monthly Revenue
* Revenue Growth
* Average Order Value (AOV)

---

## Customer

* Customer Lifetime Value (LTV)
* Repeat Customer Rate
* New vs Returning Customers

---

## Product

* Top Selling Products
* Product Category Performance

---

## Operations

* Delivery Time
* Late Delivery Rate
* Order Failure Rate

---

# 🔄 Reusable SQL with Jinja & Macros

The project uses dbt macros to eliminate duplicated SQL.

Examples include:

* Dynamic revenue model generation
* Date truncation
* Safe division
* Standardized filters
* Reusable aggregations

This improves maintainability and reduces repeated business logic across models.

---

# 🚀 Current Features

* PostgreSQL data warehouse
* Layered architecture
* dbt staging models
* Star schema implementation
* Dimension and fact modeling
* Surrogate keys
* Incremental fact models
* Data quality tests
* Business metrics layer
* Reusable Jinja macros
* Modular SQL architecture

---

# 📅 Roadmap

## In Progress

* Dynamic metric generation using advanced Jinja macros

## Planned

* Slowly Changing Dimension (Type 2)
* Dagster orchestration
* Docker deployment
* Source freshness monitoring
* Automated documentation
* CI/CD with GitHub Actions
* Data observability
* Power BI dashboard
* End-to-end pipeline automation

---

# ▶️ Running the Project

Clone the repository

```bash
git clone <repository-url>
```

Move into the project

```bash
cd ecommerce_dbt
```

Install dbt dependencies

```bash
dbt deps
```

Run all models

```bash
dbt run
```

Execute tests

```bash
dbt test
```

Generate documentation

```bash
dbt docs generate
```

Serve documentation

```bash
dbt docs serve
```

---

# 🎯 Skills Demonstrated

* Data Modeling
* ELT Pipeline Design
* PostgreSQL
* dbt Core
* SQL
* Jinja
* dbt Macros
* Incremental Models
* Data Quality Engineering
* Analytics Engineering
* Star Schema Design
* Business Metrics Modeling
* Git

---

# 📌 Project Status

🚧 Active Development

The project is continuously evolving toward a fully production-grade modern data platform with orchestration, observability, CI/CD, and cloud deployment.

