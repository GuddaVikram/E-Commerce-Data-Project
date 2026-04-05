{{ config(materialized='incremental', unique_key='order_id') }}

select
    o.id          as order_id,
    c.customer_sk,
    o.status      as order_status,
    o.purchased_at,
    o.approved_at,
    o.delivered_at,
    o.estimated_delivery_at
from {{ ref('stg_orders') }} o
join {{ ref('dim_customers') }} c
  on o.customer_id = c.customer_id
  

{% if is_incremental() %}
where o.purchased_at >
      (select max(purchased_at) from {{ this }})
{% endif %}
