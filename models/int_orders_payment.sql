{{ config(
    materialized='table'
) }}

select
    o.order_id,
    o.customer_id,
    o.order_amount,
    o.status,
    p.payment_method,
    s.payment_type
from {{ source('raw','payments') }} p
join {{ source('raw','orders') }} o
    on p.order_id = o.order_id
join {{ ref('payment_methods') }} s
    on p.payment_method = s.payment_method
