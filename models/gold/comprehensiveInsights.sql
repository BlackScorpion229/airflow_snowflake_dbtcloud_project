with comprehensiveInsights AS (
    SELECT
        sale_id,
        customer_id,
        sale_date
    FROM
        {{ ref("silver_sales_data") }}
)
SELECT * from comprehensiveInsights