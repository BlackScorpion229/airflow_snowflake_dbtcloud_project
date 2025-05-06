{{ config(materialized='table') }}

with silver_product AS (
    SELECT
        product_id,
        product_name,
        product_category,
        product_brand
    FROM {{ ref('bronze_sales_data') }}
    GROUP BY 1, 2, 3, 4
)
SELECT * from silver_product