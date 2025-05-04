{{ config(materialized='table') }}

SELECT
    warehouse_id,
    warehouse_location
FROM {{ ref('bronze_sales_data') }}
GROUP BY 1, 2
