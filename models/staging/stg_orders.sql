{{ config(materialized='table') }}

select
    order_id,
    customer_id,
    order_date,
    order_amount,
    lower(status) as status
from {{ source('raw','orders') }}
