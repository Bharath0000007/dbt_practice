{{ config(materialized='table') }}

select
    product_id,
    upper(trim(product_name)) as product_name,
    category,
    price
from {{ source('raw', 'products') }}
