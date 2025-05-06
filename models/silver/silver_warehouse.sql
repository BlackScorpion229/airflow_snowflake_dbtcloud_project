{{ config(materialized='table') }}

with silver_warehouse AS (
    SELECT
        warehouse_id,
        warehouse_location
    FROM {{ ref('bronze_sales_data') }}
    GROUP BY 1, 2
)
SELECT * from silver_warehouse