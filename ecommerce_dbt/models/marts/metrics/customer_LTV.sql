{{ config(materialized='table') }}

select 
    o.customer_sk,
    count(distinct o.order_id) as total_orders,
    sum(oi.price) as lifetime_value
from {{ ref("fact_order_items") }} oi
join {{ ref("fact_orders") }} o
    on oi.order_id = o.order_id
group by o.customer_sk
order by 3 desc