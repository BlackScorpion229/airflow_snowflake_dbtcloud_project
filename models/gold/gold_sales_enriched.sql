{{ config(
    materialized = 'view',
    tags = ['sales_analytics', 'gold_layer']
) }}

-- CTEs to modularize source references
WITH sale AS (
    SELECT
        "sale_id",
        "customer_id",
        "product_id",
        "warehouse_id",
        "sales_rep_id",
        "sale_date",
        "quantity",
        "unit_price",
        "discount",
        "shipping_cost",
        "tax_rate",
        "payment_method",
        "order_status",
        "return_status",
        "promotion_code",
        "review_rating",
        "review_comment",
        "customer_loyalty_points",
        "time_of_sale",
        "sale_month",
        "sale_year"
    FROM {{ ref('silver_sale') }}
),

customer AS (
    SELECT
        "customer_id",
        "customer_name",
        "customer_email",
        "customer_phone",
        "shipping_address"
    FROM {{ ref('silver_customer') }}
),

product AS (
    SELECT
        "product_id",
        "product_name",
        "product_category",
        "product_brand"
    FROM {{ ref('silver_product') }}
),

warehouse AS (
    SELECT
        "warehouse_id",
        "warehouse_location"
    FROM {{ ref('silver_warehouse') }}
),

sales_rep AS (
    SELECT
        "sales_rep_id",
        "sales_rep_name"
    FROM {{ ref('silver_sales_rep') }}
)

-- Final enriched sales dataset
SELECT
    -- Sale Details
    sale."sale_id",
    sale."sale_date",
    sale."time_of_sale",
    sale."sale_month",
    sale."sale_year",

    -- Customer Details
    sale."customer_id",
    customer."customer_name",
    customer."customer_email",
    customer."customer_phone",
    customer."shipping_address",

    -- Product Details
    sale."product_id",
    product."product_name",
    product."product_category",
    product."product_brand",

    -- Warehouse Details
    sale."warehouse_id",
    warehouse."warehouse_location",

    -- Sales Representative Details
    sale."sales_rep_id",
    sales_rep."sales_rep_name",

    -- Sales Metrics
    sale."quantity",
    sale."unit_price",
    sale."discount",
    sale."shipping_cost",
    sale."tax_rate",
    sale."payment_method",
    sale."order_status",
    sale."return_status",
    sale."promotion_code",
    sale."review_rating",
    sale."review_comment",
    sale."customer_loyalty_points"

FROM sale
LEFT JOIN customer ON sale."customer_id" = customer."customer_id"
LEFT JOIN product ON sale."product_id" = product."product_id"
LEFT JOIN warehouse ON sale."warehouse_id" = warehouse."warehouse_id"
LEFT JOIN sales_rep ON sale."sales_rep_id" = sales_rep."sales_rep_id"