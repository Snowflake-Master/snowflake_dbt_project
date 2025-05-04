
{% snapshot snapshot_order_header %}
  {{
    config(
      target_schema='snapshots',
      unique_key='order_id',
      strategy='timestamp',
      updated_at='last_updated'
    )
  }}
  SELECT order_id, customer_id, status, total_amount, last_updated
  FROM {{ source('orders', 'order_header') }}
{% endsnapshot %}