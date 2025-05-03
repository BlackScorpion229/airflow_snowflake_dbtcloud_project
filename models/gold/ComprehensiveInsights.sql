with Sales_data AS (
    SELECT
        s.sale_id,
        s.customer_id,
        s.sale_date
    FROM
        {{ ref("silver_sales_data") }} s
)
SELECT * from Sales_data 