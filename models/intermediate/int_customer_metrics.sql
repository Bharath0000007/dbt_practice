select
    customer_id,
    count(distinct order_id) as total_orders,
    sum(order_amount) as lifetime_value,
    avg(order_amount) as avg_order_value,
    min(order_date) as first_order_date,
    max(order_date) as last_order_date
from {{ ref('int_orders_enriched') }}
group by customer_id
