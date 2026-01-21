{{ config(
    materialized = 'incremental',
    incremental_strategy = 'append'
) }}

select
    order_id,
    customer_id,
    order_date,
    order_amount,
    status,
    current_timestamp as loaded_at
from {{ source('raw', 'orders') }}

{% if is_incremental() %}
  where order_date > (select max(order_date) from {{ this }})
{% endif %}
