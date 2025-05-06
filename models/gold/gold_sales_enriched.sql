{{ config(
    materialized = 'view',
    tags = ['sales_analytics', 'silver_layer']
) }}

-- CTEs to modularize source references
WITH sale AS (
    SELECT * FROM {{ ref('silver_sale') }}
),

customer AS (
    SELECT * FROM {{ ref('silver_customer') }}
),

product AS (
    SELECT * FROM {{ ref('silver_product') }}
),

warehouse AS (
    SELECT * FROM {{ ref('silver_warehouse') }}
),

sales_rep AS (
    SELECT * FROM {{ ref('silver_sales_rep') }}
)

-- Final enriched sales dataset
SELECT
    -- Sale Details
    sale.sale_id,
    sale.sale_date,
    sale.time_of_sale,
    sale.sale_month,
    sale.sale_year,

    -- Customer Details
    sale.customer_id,
    customer.customer_name,
    customer.customer_email,
    customer.customer_phone,
    customer.shipping_address,

    -- Product Details
    sale.product_id,
    product.product_name,
    product.product_category,
    product.product_brand,

    -- Warehouse Details
    sale.warehouse_id,
    warehouse.warehouse_location,

    -- Sales Representative Details
    sale.sales_rep_id,
    sales_rep.sales_rep_name,

    -- Sales Metrics
    sale.quantity,
    sale.unit_price,
    sale.discount,
    sale.shipping_cost,
    sale.tax_rate,
    sale.payment_method,
    sale.order_status,
    sale.return_status,
    sale.promotion_code,
    sale.review_rating,
    sale.review_comment,
    sale.customer_loyalty_points

FROM sale
LEFT JOIN customer ON sale.customer_id = customer.customer_id
LEFT JOIN product ON sale.product_id = product.product_id
LEFT JOIN warehouse ON sale.warehouse_id = warehouse.warehouse_id
LEFT JOIN sales_rep ON sale.sales_rep_id = sales_rep.sales_rep_id
