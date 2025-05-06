with silver_sales_data AS (
    SELECT
        sale_id,
        customer_id,
        sale_date
    FROM
        {{ ref("bronze_sales_data") }}
)
SELECT * from silver_sales_data