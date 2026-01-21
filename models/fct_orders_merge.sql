{{ config(
    materialized = 'incremental',
    incremental_strategy = 'merge',
    unique_key = 'order_id'
) }}

select
    order_id,
    customer_id,
    order_date,
    order_amount,
    status,
    current_timestamp as updated_at
from {{ source('raw', 'orders') }}

{% if is_incremental() %}
  -- Only process new or updated rows
  where order_date >= (select max(order_date) from {{ this }})
{% endif %}
