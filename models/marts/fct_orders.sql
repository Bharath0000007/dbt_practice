{{ config(materialized='table') }}
select
    order_id,
    customer_id,
    order_date,
    order_amount,
    total_paid
from {{ ref('int_orders_enriched') }}
