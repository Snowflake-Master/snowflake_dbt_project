{% snapshot scd_customers %}
  {{
    config(
      target_schema='snapshots',
      unique_key='customer_id',
      strategy='check',
      check_cols=['email', 'address', 'phone_number']
    )
  }}
  SELECT customer_id, full_name, email, address, phone_number, updated_at
  FROM {{ source('crm', 'customers') }}
{% endsnapshot %}