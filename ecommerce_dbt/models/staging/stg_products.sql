select
    product_id::varchar        as id,
    product_category_name::varchar as category,

    product_name_length::int   as name_length,
    product_description_length::int as description_length,
    product_photos_qty::int   as photo_count,
    product_weight_g::int     as weight_g,
    product_length_cm::int    as length_cm,
    product_height_cm::int    as height_cm,
    product_width_cm::int     as width_cm

from {{ source('raw', 'products') }}
