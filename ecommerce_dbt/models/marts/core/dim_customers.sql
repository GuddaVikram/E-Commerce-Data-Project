{{ config(materialized='table') }}

select
 {{ dbt_utils.generate_surrogate_key(['id']) }} as customer_sk,
    id          as customer_id,
    unique_id   as customer_unique_id,
    city        as customer_city,
    state       as customer_state
from {{ ref('stg_customers') }}
