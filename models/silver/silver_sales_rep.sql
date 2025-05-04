{{ config(materialized='table') }}

SELECT
    sales_rep_id,
    sales_rep_name
FROM {{ ref('bronze_sales_data') }}
GROUP BY 1, 2
