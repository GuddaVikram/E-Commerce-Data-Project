{{ config(materialized='table') }}
select
    oi.order_id,
    oi.item_id,
    p.product_sk,
    s.seller_sk,
    oi.price,
    oi.freight_value
from {{ ref('stg_order_items') }} oi
join {{ ref('dim_products') }} p
  on oi.product_id = p.product_id
join {{ ref('dim_sellers') }} s
  on oi.seller_id = s.seller_id
  