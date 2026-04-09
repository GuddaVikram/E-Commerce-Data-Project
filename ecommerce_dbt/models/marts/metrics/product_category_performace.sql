{{
  config(
    materialized = 'table',
    )
}}
with category_revenue as (
    select
        p.product_category,
        sum(oi.price) as total_revenue
    from {{ ref('fact_order_items') }} oi
    join {{ ref('dim_products') }} p
      on oi.product_sk = p.product_sk
    group by 1
)
select
    product_category,
    total_revenue
from category_revenue
order by total_revenue desc