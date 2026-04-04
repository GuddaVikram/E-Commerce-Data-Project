{{ config(materialized='incremental', unique_key='order_id') }}

select
    o.id          as order_id,
    c.customer_sk,
    o.status      as order_status,
    o.purchase_ts,
    o.approved_ts,
    o.delivered_ts,
    o.estimated_delivery_ts
from {{ ref('stg_orders') }} o
join {{ ref('dim_customers') }} c
  on o.customer_id = c.customer_id
  

{% if is_incremental() %}
where o.purchase_ts >
      (select max(purchase_ts) from {{ this }})
{% endif %}
