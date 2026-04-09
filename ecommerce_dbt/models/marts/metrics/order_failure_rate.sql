{{ config(materialized='table') }}

select
    count(case when order_status in ('canceled','unavailable') then 1 end) * 1.0
    / count(*) as failure_rate
from {{ ref('fact_orders') }}