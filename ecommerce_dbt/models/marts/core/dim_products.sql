{{ config(materialized='table') }}

select
 {{ dbt_utils.generate_surrogate_key(['id']) }} as product_sk,
    id              as product_id,
    category        as product_category,
    name_length     as product_name_length,
    description_length,
    weight_g,
    length_cm,
    height_cm,
    width_cm
from {{ ref('stg_products') }}
