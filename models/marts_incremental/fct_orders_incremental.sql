{{ config(
    materialized='incremental',
    unique_key='order_id',
    incremental_strategy='merge'
) }}

select
    order_id,
    customer_id,
    order_date,
    order_amount,
    total_paid,
    current_timestamp as updated_at
from {{ ref('int_orders_enriched') }}

{% if is_incremental() %}
where order_date >= (
    select max(order_date) from {{ this }}
)
{% endif %}
