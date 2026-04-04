{{ config(materialized='table') }}

select
 {{ dbt_utils.generate_surrogate_key(['id']) }} as seller_sk,
    id      as seller_id,
    city    as seller_city,
    state   as seller_state
from {{ ref('stg_sellers') }}
