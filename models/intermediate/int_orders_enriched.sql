{{ config(materialized='table') }}
with orders as (
    select * from {{ ref('stg_orders') }}),
customers as (
    select * from {{ ref('stg_customers') }}),
payments as (
    select * from {{ ref('stg_payments') }})
select
    o.order_id,
    o.customer_id,
    c.first_name,
    o.order_date,
    o.order_amount,
    coalesce(sum(p.payment_amount),0) as total_paid
from orders o
left join customers c on o.customer_id = c.customer_id
left join payments p on o.order_id = p.order_id
group by all
