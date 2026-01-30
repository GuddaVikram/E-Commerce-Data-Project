select
    order_id                    as id,
    customer_id                 as customer_id,
    order_status                as status,
    order_purchase_timestamp  as purchased_at,
    order_approved_at         as approved_at,
    order_delivered_customer_date as delivered_at,
    order_estimated_delivery_date as estimated_delivery_at

from {{ source('raw', 'orders') }}
