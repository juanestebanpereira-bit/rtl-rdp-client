-- =============================================================================
-- stg_styles.sql
-- =============================================================================
-- Maps Olist product data to RDP style staging contract.
-- For prototype purposes, styles mirror items since Olist
-- has no style-level data.
--
-- Component:  Product Hierarchy
-- Owner:      Customer
-- Reads from: merchandising.olist_products_dataset
-- =============================================================================

WITH source AS (
    SELECT
        product_id,
        product_category_name
    FROM {{ source('merchandising', 'olist_products_dataset') }}
    WHERE product_id IS NOT NULL
),

renamed AS (
    SELECT
        product_id                          AS style_id,
        product_category_name               AS class_id,
        product_id                          AS style_number,
        COALESCE(
            product_category_name,
            'Unknown'
        )                                   AS style_name
    FROM source
)

SELECT * FROM renamed