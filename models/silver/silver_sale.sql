{{ config(materialized='table') }}

with silver_sale AS (
    SELECT
        sale_id,
        customer_id,
        product_id,
        warehouse_id,
        sales_rep_id,
        sale_date,
        quantity,
        unit_price,
        discount,
        shipping_cost,
        tax_rate,
        payment_method,
        order_status,
        return_status,
        promotion_code,
        review_rating,
        review_comment,
        customer_loyalty_points,
        time_of_sale,
        sale_month,
        sale_year
    FROM {{ ref('bronze_sales_data') }}
)
SELECT * from silver_sale