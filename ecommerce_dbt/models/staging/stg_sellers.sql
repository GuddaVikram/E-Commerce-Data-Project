{{ config(materialized='view') }}

select
    seller_id       as id,
    seller_city     as city,
    seller_state    as state
from {{ source('raw', 'sellers') }}
