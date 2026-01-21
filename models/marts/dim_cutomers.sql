select
    {{ dbt_utils.generate_surrogate_key(['c.customer_id']) }} as customer_key,
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    min(o.order_date) as first_order_date,
    max(o.order_date) as last_order_date,
    count(distinct o.order_id) as total_orders
from {{ source('raw', 'customers') }} c
left join {{ source('raw', 'orders') }} o
    on c.customer_id = o.customer_id
group by
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email
