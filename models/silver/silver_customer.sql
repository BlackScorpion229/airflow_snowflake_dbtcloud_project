{{ config(materialized='table') }}

with silver_customer AS (
    SELECT DISTINCT
        'customer_id',
        'customer_name',
        'customer_email',
        'customer_phone',
        'shipping_address'
    FROM {{ ref('bronze_sales_data') }}
)
SELECT * from silver_customer