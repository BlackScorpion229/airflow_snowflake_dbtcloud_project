{{ config(materialized='table') }}

with silver_sales_rep AS (
    SELECT
        'sales_rep_id',
        'sales_rep_name'
    FROM {{ ref('bronze_sales_data') }}
    GROUP BY 1, 2
)
SELECT * from silver_sales_rep