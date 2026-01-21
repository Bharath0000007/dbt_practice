{% snapshot orders_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='order_id',
      strategy='check',
      check_cols=['status','order_amount']
    )
}}

select * from {{ source('raw','orders') }}

{% endsnapshot %}
