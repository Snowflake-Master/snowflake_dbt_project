-- =============================================
-- Model: cleaned_customers
-- =============================================
{{ config(materialized='table') }}

SELECT
    customer_id,
    {{ clean_email('email') }} AS clean_email
FROM {{ source('raw', 'customers') }}
