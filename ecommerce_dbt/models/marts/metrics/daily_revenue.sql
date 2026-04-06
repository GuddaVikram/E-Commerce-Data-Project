{{ config(materialized='table') }}
  
select
    date_trunc('day', o.purchased_at) as purchase_date,
    sum(oi.price) as total_revenue,
    count(distinct o.order_id) as total_orders,
    count(*) as total_items_sold,
    count(distinct o.customer_sk) as unique_customers,
    count(distinct oi.product_sk) as unique_products_sold,
    sum(oi.freight_value) as total_freight_revenue,
    round(sum(oi.price) / count(distinct o.order_id),2) as avg_order_value

from {{ ref('fact_orders') }} o
join {{ ref('fact_order_items') }} oi
  on o.order_id = oi.order_id
where o.order_status = 'delivered'
group by 1
order by 1
