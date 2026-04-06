{{ config(materialized='table') }}

select
    date_trunc('month', purchase_date) as purchase_month,
    sum(total_revenue) as monthly_revenue,
    sum(total_orders) as monthly_orders,
    sum(total_items_sold) as monthly_items_sold,
    sum(unique_customers) as monthly_unique_customers,
    sum(unique_products_sold) as monthly_unique_products_sold,
    sum(total_freight_revenue) as monthly_freight_revenue,
    round(sum(total_revenue) / nullif(sum(total_orders),0),2) as monthly_avg_order_value
from {{ ref('daily_revenue') }}
group by 1
order by 1