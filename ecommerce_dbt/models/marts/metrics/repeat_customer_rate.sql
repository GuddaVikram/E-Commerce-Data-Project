select
    count(case when order_count > 1 then 1 end) * 1.0
    / count(*) as repeat_rate
from (
    select customer_sk, count(distinct order_id) as order_count
    from {{ ref('fact_orders') }}
    group by 1
) sub