select
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    o.order_id,
    o.order_date,
    o.status as order_status,
    o.order_amount,
    p.payment_method,
    p.payment_amount,
    p.payment_date
from {{ source('raw', 'customers') }} c
left join {{ source('raw', 'orders') }} o
    on c.customer_id = o.customer_id
left join {{ source('raw', 'payments') }} p
    on o.order_id = p.order_id
order by o.order_date;
