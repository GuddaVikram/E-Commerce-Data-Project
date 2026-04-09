{{ config(materialized='table') }}

select
    order_id,
    (delivered_at - purchased_at) as delivery_time
from {{ ref('fact_orders') }}
where order_status = 'delivered'