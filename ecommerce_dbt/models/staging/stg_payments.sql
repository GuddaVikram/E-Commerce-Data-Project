select
    order_id          as order_id,
    payment_sequential    as payment_sequence,
    payment_type      as payment_type,
    payment_installments  as installments,
    payment_value::numeric(10,2) as payment_amount

from {{ source('raw', 'order_payments') }}
