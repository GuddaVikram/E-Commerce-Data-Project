{{ config(materialized='table') }}
with product_revenue as (
    select
        p.product_id,
        sum(oi.price) as total_revenue,
        count(distinct oi.order_id) as total_orders
    from {{ ref('fact_order_items') }} oi
    join {{ ref('dim_products') }} p
      on oi.product_sk = p.product_sk
    group by p.product_id
)   
select
    product_id,
    total_revenue,
    total_orders
from product_revenue
order by total_revenue desc