{{ config(materialized='table') }}

select
    payment_id,
    order_id,
    payment_date,
    try_cast(payment_amount as number(10,2)) as payment_amount,
    payment_method
from {{ source('raw', 'payments') }}
