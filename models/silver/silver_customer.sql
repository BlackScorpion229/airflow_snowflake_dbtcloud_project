{{ config(materialized='table') }}

SELECT
    customer_id,
    customer_name,
    customer_email,
    customer_phone,
    shipping_address
FROM {{ ref('bronze_sales_data') }}
GROUP BY 1, 2, 3, 4, 5