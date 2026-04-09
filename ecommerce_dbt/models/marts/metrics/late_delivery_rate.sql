{{ config(materialized='table') }}

select
    count(case when delivered_at > estimated_delivery_at then 1 end) * 1.0
    / count(*) as late_delivery_rate
from {{ ref('fact_orders') }}
where order_status = 'delivered'